/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.HouseDAO;
import Entity.House;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Gia Minh
 */
@WebServlet(name = "EditHouse", urlPatterns = {"/editHouse"})
@MultipartConfig()
public class EditHouse extends HttpServlet {

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
            out.println("<title>Servlet EditHouse</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditHouse at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HouseDAO dao = new HouseDAO();
            HttpSession session = request.getSession();

            int userId = Integer.parseInt(request.getParameter("userId"));
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            Double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");
            Part part = request.getPart("imageUrl");
            InputStream imageFile = part.getInputStream();
            byte[] image = imageFile.readAllBytes();
            int imageLength = imageFile.toString().length();
            House oldHouse = dao.getHouseById(id);

            House house = new House();
            house.setId(id);
            house.setName(name);
            house.setPrice(price);
            house.setDesciption(description);
            if (imageLength < 1) {
                house.setImageUrl(oldHouse.getImageUrl());
            } else {
                house.setImageUrl(image);
            }
            house.setLocation(oldHouse.getLocation());
            house.setUserId(userId);
            house.setCategory(oldHouse.getCategory());
            int rs = dao.editHouse(house);

            if (rs == 1) {
                session.setAttribute("succMsg", "Product was edited");
                response.sendRedirect("admin/all_house.jsp?userId=" + userId);
            } else {
                session.setAttribute("failedMsg", "Product was not edited");
                response.sendRedirect("admin/all_house.jsp?userId=" + userId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
