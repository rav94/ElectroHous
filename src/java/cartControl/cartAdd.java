/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cartControl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.catalina.Session;

/**
 *
 * @author Ravindu
 */

public class cartAdd extends HttpServlet {

    ArrayList<product> list ;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try{
            String image = request.getParameter("image");
            String title = request.getParameter("title");
            String product_id = request.getParameter("product_id");
            Double price = Double.parseDouble(request.getParameter("price"));
            HttpSession session = request.getSession(true);
            
        if(  session.getAttribute("cart")==null){
        list = new ArrayList<product>();
        
        }
        else{
        list =(ArrayList)session.getAttribute("cart");
        }
        
        product product = new product();
       
        product.setImage(image);
        product.setTitle(title);
        product.setProduct_code(product_id);
        product.setPrice(price);
        list.add(product);
        session.setAttribute("cart", list);
        
        response.sendRedirect("cart.jsp");
        }
        
        catch(Exception ex)
        {
            
            out.println(ex);
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
