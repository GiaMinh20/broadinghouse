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
import org.apache.commons.io.IOUtils;

/**
 *
 * @author Gia Minh
 */
@WebServlet(name = "AddHouse", urlPatterns = {"/addHouse"})
@MultipartConfig()
public class AddHouse extends HttpServlet {

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
            out.println("<title>Servlet AddHouse</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddHouse at " + request.getContextPath() + "</h1>");
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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {

            String name = req.getParameter("name");
            double price = Double.parseDouble(req.getParameter("price"));
            String detailLocation = req.getParameter("detailLocation");
            String location = req.getParameter("location");
            String description = req.getParameter("description");
            int userId = Integer.parseInt(req.getParameter("userId"));
            String caterory = req.getParameter("category");

            Part part = req.getPart("imageUrl");
            InputStream imageFile = part.getInputStream();
            byte[] image = IOUtils.toByteArray(imageFile);
            int imageLengh = image.length;
            HttpSession session = req.getSession();

            if (imageFile.toString().length() > 0) {
                House house = new House(name, price,detailLocation, location, image, description, caterory, userId);
                HouseDAO dao = new HouseDAO();

                int rs = dao.addHouse(house);

                if (rs == 1) {
                    session.setAttribute("AddMsg", "Product was added");
                    resp.sendRedirect("admin/add_house.jsp");
                } else {
                    session.setAttribute("AddMsg", "Product was not added");
                    resp.sendRedirect("admin/add_house.jsp");
                }
            } else {
                session.setAttribute("AddMsg", "Product was not added please add an image for news");
                resp.sendRedirect("admin/add_house.jsp");
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
