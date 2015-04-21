package SourceAdmin;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ravindu
 */
@WebServlet(urlPatterns = {"/servletUser"})
public class servletUser extends HttpServlet {
    
    String UserId;
    String UserName;
    String Password;
    String Contact;
    String type;
    String button;

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
        PrintWriter out = response.getWriter();
        try {
            
            UserId=request.getParameter("UserId");
            UserName=request.getParameter("UserName");
            Password=request.getParameter("password");
            Contact=request.getParameter("contact");
            type=request.getParameter("type");
            
            button=request.getParameter("button");
            
            editUser eu = new editUser();
            if("1".equals(button))
            {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet servletUser</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>User Id : " + UserId + "</h1>");
            out.println("<h1>User Name : " + UserName + "</h1>");
            out.println("<h1>Password : " + Password + "</h1>");
            out.println("<h1>Contact Number : " + Contact + "</h1>");
            out.println("<h1>User Type : " + type + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            
            eu.setUserId(UserId);
            eu.setUserName(UserName);
            eu.setPassword(Password);
            eu.setContact(Contact);
            eu.setType(type);
            eu.AddUser();
            }
            else
            {
               eu.setUserId(UserId);
               eu.searchUser();
               UserName=eu.getUserId();
               Contact=eu.getContact();
               type=eu.getType();
            }
        } finally {
            out.close();
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
        processRequest(request, response);
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
