/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlClasses;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Statement;
import java.sql.ResultSet;

/**
 *
 * @author Ravindu
 */
//@WebServlet(name = "authenticate", urlPatterns = {"/authenticate"})
public class authenticate extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @SuppressWarnings("CallToPrintStackTrace")
    public static boolean usercheck()
    {
        boolean result = false;
        
        try{
            Statement stmt= DbConnection.dbConn().createStatement();
            ResultSet rset;
            rset = stmt.executeQuery("SELECT username, password FROM user");
            
            String username = rset.getString(1);
            String password = rset.getString(2);
            result = rset.next();
        }
        
        catch(Exception ex){
            ex.printStackTrace();
        }
        
        return result;
    }
    
            
            
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
