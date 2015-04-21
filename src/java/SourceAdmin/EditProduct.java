/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package SourceAdmin;

import cartControl.product;
import controlClasses.DbConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Ravindu
 */
public class EditProduct{
    
   // private DbConnection db=new DbConnection();
    
    private String PId;
    private String Product_code;
    private String Title;
    private String Brand;
    private String Category;
    private String Image;
    private String description;
    private String Price;
    private String OldPrice;
    private String Quantity;

   // public DbConnection getDb() {
   //   return db;
   // }

    public String getPId() {
        return PId;
    }

    public String getProduct_code() {
        return Product_code;
    }

    public String getTitle() {
        return Title;
    }

    public String getBrand() {
        return Brand;
    }

    public String getCategory() {
        return Category;
    }

    public String getImage() {
        return Image;
    }

    public String getDescription() {
        return description;
    }

    public String getPrice() {
        return Price;
    }

    public String getOldPrice() {
        return OldPrice;
    }

    public String getQuantity() {
        return Quantity;
    }

    //public void setDb(DbConnection db) {
      //  this.db = db;
    //}

    public void setPId(String PId) {
        this.PId = PId;
    }

    public void setProduct_code(String Product_code) {
        this.Product_code = Product_code;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public void setBrand(String Brand) {
        this.Brand = Brand;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(String Price) {
        this.Price = Price;
    }

    public void setOldPrice(String OldPrice) {
        this.OldPrice = OldPrice;
    }

    public void setQuantity(String Quantity) {
        this.Quantity = Quantity;
    }
    
    //test variables
    public void test(){
        System.out.println(PId);
    }
    
    public void updateProduct(){
        try{
        Connection c=DbConnection.dbConn();
        Statement s=c.createStatement();
        
        s.executeUpdate("UPDATE `product` SET `ProductCode`='"+getProduct_code()+"',`Title`='"+getTitle()+"',`Brand`='"+getBrand()+"',`Category`='"+getCategory()+"',`product_image_name`='"+getImage()+"',`Description`='"+getDescription()+"',`Price`='"+Integer.parseInt(getPrice())+"',`quantity`='"+Integer.parseInt(getQuantity())+"' WHERE `PId`='"+Integer.parseInt(getPId())+"'");
       }                                       
    catch(Exception ex){
        System.out.println(ex);
    }
    } 
     
}
