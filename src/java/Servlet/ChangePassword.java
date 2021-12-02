/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.UserDAO;
import Entity.User;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ChangePassword", urlPatterns = {"/changePassword"})
public class ChangePassword extends HttpServlet {

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
            out.println("<title>Servlet ChangePassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassword at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        int id = Integer.parseInt(request.getParameter("id"));
        String newpassword = request.getParameter("newpassword");
        String confirmpassword = request.getParameter("confirmpassword");

        UserDAO dao = new UserDAO();
        User oldUser = dao.getUserById(id);
        if (newpassword.equals(confirmpassword)) {
            User user = new User();
            user.setId(id);
            user.setFirstname(oldUser.getFirstname());
            user.setLastname(oldUser.getFirstname());
            user.setPhone(oldUser.getPhone());
            user.setEmail(oldUser.getEmail());
            user.setAddress(oldUser.getAddress());
            user.setPassword(newpassword);

            int rs = dao.editAccount(user);
            if (rs == 1) {
                session.removeAttribute("admin");
                response.sendRedirect("login.jsp");
            } else {
                session.setAttribute("ChangeFailed", "Change password failed");
                response.sendRedirect("admin/change_password.jsp?userId=" + id);
            }
        } else {
            session.setAttribute("ChangeFailed", "Confirm password is incorrect");
            response.sendRedirect("admin/change_password.jsp?userId=" + id);
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
