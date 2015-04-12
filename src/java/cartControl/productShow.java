/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cartControl;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import controlClasses.DbConnection;

/**
 *
 * @author Ravindu
 */
public class productShow {
      public ResultSet getProductDetails(){
    
        ResultSet productResult = null;
        try {
            Statement stmt= DbConnection.dbConn().createStatement();
            productResult = stmt.executeQuery("SELECT  product_image_name, title, Price FROM products");
             
        }
        catch (SQLException ex) {
            productResult = null;
        }
        return productResult;
    }
}
