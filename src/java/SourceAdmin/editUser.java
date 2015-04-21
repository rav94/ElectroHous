package SourceAdmin;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Ravindu
 */
import controlClasses.DbConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JOptionPane;

public class editUser {
   
    private String UserId;
    private String UserName;
    private String Password;
    private String Contact;
    private String type;

    public String getUserId() {
        return UserId;
    }

    public String getUserName() {
        return UserName;
    }

    public String getPassword() {
        return Password;
    }

    public String getContact() {
        return Contact;
    }

    public String getType() {
        return type;
    }

    public void setUserId(String UserId) {
        this.UserId = UserId;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public void setContact(String Contact) {
        this.Contact = Contact;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    public void AddUser(){
            try{
        Connection c=DbConnection.dbConn();
        Statement s=c.createStatement();
        
        s.executeUpdate("INSERT INTO `user`(`User_Id`, `Password`, `Name`, `ContactNo`, `UserType`) VALUES ('"+Integer.parseInt(getUserId())+"','"+getPassword()+"','"+getUserName()+"','"+Integer.parseInt(getContact())+"','"+getType()+"')");
       }                                       
    catch(Exception ex){
        System.out.println(ex);
    }
    }
    
    public void searchUser(){
       try {
            String query;
           // DbConnection db = new DbConnection();
            Connection c= DbConnection.dbConn();

            Statement stmt = c.createStatement();
            query="SELECT Name,ContactNo,UserType FROM user WHERE User_Id='"+Integer.parseInt(getUserId())+"'";
            ResultSet rs=  stmt.executeQuery(query);
            
          while(rs.next()){
          
              setUserName(rs.getString("Name"));
              setContact(rs.getString("ContactNo"));
              setType(rs.getString("UserType"));
          }
        }
              catch (Exception e) {
                 JOptionPane.showMessageDialog(null, e);
        }
    }
    public void updateUser(){
    
    }
    
    public void removeUser(){
    
    }
    
}
