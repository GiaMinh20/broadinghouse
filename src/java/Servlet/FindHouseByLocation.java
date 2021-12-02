/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.HouseDAO;
import Entity.House;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Gia Minh
 */
@WebServlet(name = "FindHouseByLocation", urlPatterns = {"/findHouseByLocation"})
public class FindHouseByLocation extends HttpServlet {

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
            out.println("<title>Servlet FindHouseByLocation</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FindHouseByLocation at " + request.getContextPath() + "</h1>");
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
        String location = request.getParameter("location");
        String useId = request.getParameter("userId");
        HouseDAO dao = new HouseDAO();
        List<House> houseOfLocations = dao.getHouseByLocation(location);
        HttpSession session = request.getSession();
        session.setAttribute("location", location);
        if (houseOfLocations != null) {
            session.setAttribute("houseOfLocations", houseOfLocations);
            if (useId == null) {
                response.sendRedirect("house_of_location.jsp?location=" + location);
            } else {
                response.sendRedirect("house_of_location.jsp?location=" + location + "&userId=" + useId);
            }
        } else {
            if (useId == null) {
                response.sendRedirect("not_found_location.jsp?location=" + location);
            } else {
                response.sendRedirect("not_found_location.jsp?location=" + location + "&userId=" + useId);
            }
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
