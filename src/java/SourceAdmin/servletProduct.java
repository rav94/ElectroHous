package SourceAdmin;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import controlClasses.DbConnection;
import java.awt.Image;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ravindu
 */
@WebServlet(urlPatterns = {"/servletProduct"})
public class servletProduct extends HttpServlet {
    String PId;
    String PCode;
    String title;
    String brand;
    String category;
    String Image;
    String Description;
    String Price;
    String OldPrice;
    String quantity;

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
        
        PId = request.getParameter("Produt_id");
        PCode = request.getParameter("Product_code");
        title = request.getParameter("title");
        brand = request.getParameter("brand");
        category = request.getParameter("category");
        Image = request.getParameter("image");
        Description = request.getParameter("description");
        Price = request.getParameter("price");
        OldPrice = request.getParameter("old_price");
        quantity = request.getParameter("quantity");
        
       
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet servletProduct</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h3>Product Id is " +PId+ "</h3>");
            out.println("<h3>Product Code is "+PCode+"</3>");
            out.println("<h3>Title is "+title+"</h3>");
            out.println("<h3>Brand is "+brand+"</h3>");
            out.println("<h3>Category is "+category+"</h3>");
            out.println("<h3>Image "+Image+"</h3>");
            out.println("<h3>Descrition "+Description+"</h3>");
            out.println("<h3>Price is "+Price+"</h3>");
            out.println("<h3>Old Price is "+OldPrice+"</h3>");
            out.println("<h3>Quantity is "+quantity+"</h3>");
            out.println("</body>");
            out.println("</html>");
            
        EditProduct ep=new EditProduct();
        ep.setPId(PId);
        ep.setProduct_code(PCode);
        ep.setTitle(title);
        ep.setBrand(brand);
        ep.setCategory(category);
        ep.setImage(Image);
        ep.setPrice(Price);
        ep.setOldPrice(OldPrice);
        ep.setQuantity(quantity);
        
        ep.updateProduct();
        //ep.insertProduct(ep);
            
       
        
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
