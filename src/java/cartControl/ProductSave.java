/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cartControl;

import controlClasses.DbConnection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ravindu
 */
public class ProductSave {
    Statement stmt ;
    String myDate;
    public ProductSave(){
        Calendar calendar = Calendar.getInstance(TimeZone.getDefault()); 
            
           int month= calendar.get(Calendar.MONTH) + 1;
            Calendar cal = Calendar.getInstance();
           
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
            
           int year = calendar.get(Calendar.YEAR);
           int day = calendar.get(Calendar.DATE);
           String time = sdf.format(cal.getTime());
           myDate = day+"/"+month+"/"+year;
    }
    
   public int SaveProducts(ArrayList<product> list){
        try {
            
        int maxId = getMaxId()+1;
       
        for(product pro:list){ 
          String sql = "INSERT INTO cart VALUES('"+maxId+"','"+pro.getProduct_code()+"','1','"+myDate+"')";         
          stmt = DbConnection.dbConn().createStatement();              
          stmt.executeUpdate(sql);
          maxId++;
       }
        } catch (SQLException ex) {
               Logger.getLogger(ProductSave.class.getName()).log(Level.SEVERE, null, ex);
           }
       
        return 0;
   
   }
   
   public  int getMaxId(){
       int maxId=0;
       String sql = "SELECT MAX(cid) FROM cart";
       try {
           stmt = DbConnection.dbConn().createStatement();
               
                 ResultSet rst = stmt.executeQuery(sql);
                 while (rst.next()){
                     maxId = rst.getInt(1);
                    }
          
       } catch (Exception e) {
       }
       
       return maxId;
    }
   
}
