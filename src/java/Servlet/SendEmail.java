/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.SavedListDAO;
import DAO.HouseDAO;
import DAO.UserDAO;
import Entity.House;
import Entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Gia Minh
 */
@WebServlet(name = "SendEmail", urlPatterns = {"/sendEmail"})
public class SendEmail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SendEmail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendEmail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String userName, userPhone, userEmail, userPassword, userAddress, houseTiTle, housePrice, houseDescription, houseAddress;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("id");

            HouseDAO houseDAO = new HouseDAO();
            House houseRented = houseDAO.getHouseById(Integer.parseInt(id));
            houseTiTle = houseRented.getName();
            housePrice = String.valueOf(houseRented.getPrice());
            houseAddress = houseRented.getLocation();
            houseDescription = houseRented.getDesciption();

            int adminId = houseRented.getUserId();
            UserDAO userDAO = new UserDAO();
            User admin = userDAO.getUserById(adminId);
            String adminName = admin.getLastname() + admin.getFirstname();
            String adminEmail = admin.getEmail();
            String adminPhone = admin.getPhone();

            int renterId = Integer.parseInt(request.getParameter("userId"));
            User renter = userDAO.getUserById(renterId);
            userPhone = renter.getPhone();
            userEmail = request.getParameter("userEmail");
            userName = renter.getLastname() + renter.getLastname();

            Properties prop = new Properties();
            prop.put("mail.smtp.host", "smtp.gmail.com");
            prop.put("mail.smtp.port", "587");
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.starttls.enable", "true");
            Session session = Session.getInstance(prop,
                    new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("boardinghousemail@gmail.com", "Giaminh2001@");
                }
            });
            try {
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(userEmail));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail));
                MimeBodyPart textPart = new MimeBodyPart();
                Multipart multipart = new MimeMultipart();
                String final_Text = "House Title: " + houseTiTle + "\n" + "Price: " + housePrice + "\n"
                        + "Location: " + houseAddress + "\n" + "Description: " + houseDescription + "\n"
                        + "Author: " + adminName + "\n" + "Author Email: " + adminEmail + "\n" + "Author Phone: " + adminPhone + "\n";
                textPart.setText(final_Text);
                message.setSubject("Rent house");
                multipart.addBodyPart(textPart);
                message.setContent(multipart);
                message.setSubject("Your request has been accepted");
                Transport.send(message);

                Message message2 = new MimeMessage(session);
                message2.setFrom(new InternetAddress(adminEmail));
                message2.setRecipients(Message.RecipientType.TO, InternetAddress.parse(adminEmail));
                MimeBodyPart textPart2 = new MimeBodyPart();
                Multipart multipart2 = new MimeMultipart();
                String final_Text2 = "House Title: " + houseTiTle + "\n" + "Price: " + housePrice + "\n" + "Location: " + houseAddress + "\n"
                        + "Renter: " + userName + "\n" + "Renter Phone: " + userPhone + "\n" + "Renter email: " + userEmail + "\n";
                textPart2.setText(final_Text2);
                message2.setSubject("Rent house");
                multipart2.addBodyPart(textPart2);
                message2.setContent(multipart2);
                message2.setSubject("Someone want to rent your house");

                Transport.send(message2);
                response.sendRedirect("thank.jsp?userId=" + renterId);
                houseDAO.deleteHouse(Integer.parseInt(id));
                SavedListDAO savedlistDAO = new SavedListDAO();
                savedlistDAO.deleteSavedlistByHouseId(Integer.parseInt(id));
            } catch (Exception e) {
                response.sendRedirect("rent.jsp?id=" + id + "&userId=" + renterId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
