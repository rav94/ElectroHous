/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlClasses;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author Ravindu
 */
public class DbConnection {
    PreparedStatement pstmnt;
    static Connection conn = null;
    
    public static Connection dbConn(){
        try
        {
            
        Class.forName("com.mysql.jdbc.Driver");
        conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/electrohouse", "root", "");
        
        }
        
        catch(Exception ex){
            JOptionPane.showMessageDialog(null, ex);
        }
        
        return conn;
    }
    
    public int runQuery(String sql)
    {
        int x = 0;
        try
        {
            pstmnt = conn.prepareStatement(sql);
            x = pstmnt.executeUpdate();
        }
        catch(Exception ex)
        {
            JOptionPane.showMessageDialog(null, ex);
        }
        
        return x;
    }
    
    public ResultSet selectQuery(String sql)
    {
     
     ResultSet set = null;
     try
     {
        pstmnt = conn.prepareStatement(sql);
        set =  pstmnt.executeQuery();
     }
        
     catch(Exception ex)
     {
            
     }
        
     return set;
    } 
}
