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

/**
 *
 * @author Ravindu
 */

public class cartRemove extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        try{
           HttpSession session = request.getSession();
           
           String code = request.getParameter("product_id");
           Object sess1 = request.getSession().getAttribute("cart");
           ArrayList<product> list = new ArrayList<product>();
            list = (ArrayList)sess1;
            int x =0;
            int removeitem = 0;
            for(product pro:list){
                if(pro.getProduct_code().equalsIgnoreCase(code)){ 
                removeitem = x;
                break;
            }
            x++;
            }
            
            product pr = list.remove(removeitem);
            out.println(pr.getProduct_code());
            
            session.setAttribute("cart", list);
            Object sess2 =  request.getSession().getAttribute("cart");
            ArrayList<product> list2 = (ArrayList<product>)sess2;
            for(product pro2:list2){
            out.println(pro2.getProduct_code());
            }
        
        }
        
        catch(Exception ex)
        {
            out.println(ex);
        }
        
      
        response.sendRedirect("cart.jsp");
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
