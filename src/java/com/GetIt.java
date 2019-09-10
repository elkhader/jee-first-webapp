get/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com;

import java.sql.*;
/**
 *
 * @author Admin
 */
public class GetIt {
    private static String date;
    private static String departID="";
    private static String demandeID;
    private static String email;
    
    public static void setEmail(String email){
        GetIt.email=email;}
    
    public static String getEmail(){
        return email;
    }
    
    public static void setDemandeID(String demandeID){
        GetIt.demandeID= demandeID;
    }
    public static String softGetDemandeID(){
        return demandeID;
    }
    public static String getDemandeID(){
        
        PreparedStatement pstatement = null;
    
        
    
        
        
                    
    try 
        {   String query="select demandeID from tempdemande  ORDER BY DemandeID DESC LIMIT 1";
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mynewdatabase","root","22101997");
                        
                        PreparedStatement psmt=con.prepareStatement(query);
                        
                        
                        ResultSet rs=psmt.executeQuery();
                        
                        while(rs.next())
                        {
                            
                            demandeID=rs.getString("DemandeID");

                            
                        }
                        
                    }
                    
                    catch(Exception ex)
                    {
                        ex.printStackTrace();
                    }
    
                    
        //redirect user to login page if not logged in
       
    return demandeID;
    }   
    
    public static String getArticleID(String articlenom){
        
        String articleid="";
        Connection connection=DBConnection.getConnection();
	PreparedStatement pss=null;
	try {
	 String querry="Select articleid from articles where articlenom=?";
	 pss=connection.prepareStatement(querry);		
	 pss.setString(1, articlenom);
         
	ResultSet rss= pss.executeQuery();
        
        while(rss.next())
                        {
                            
                            articleid=rss.getString("articleid");

                            
                        }
         
	} catch (Exception e) {
	 System.out.println(e);
	}
      return articleid;  
    }
    
    public static String getDate() {
		return date;
	}
    public static void setDate(String date) {
		GetIt.date = date;}

public static String getfinalDemandeID(){
        
        String demandeID="";
        PreparedStatement pstatement = null;
    
        
    
        
        
                    
    try 
        {   String query="select demandeID from demande  ORDER BY DemandeID DESC LIMIT 1";
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mynewdatabase","root","22101997");
                        
                        PreparedStatement psmt=con.prepareStatement(query);
                        
                        
                        ResultSet rs=psmt.executeQuery();
                        
                        while(rs.next())
                        {
                            
                            demandeID=rs.getString("DemandeID");

                            
                        }
                        
                    }
                    
                    catch(Exception ex)
                    {
                        ex.printStackTrace();
                    }
    
                    
        //redirect user to login page if not logged in
       
    return demandeID;
    }   


public static String getUserClass(String email){
        
        String userClass="";
        Connection connection=DBConnection.getConnection();
	PreparedStatement pss=null;
	try {
	 String querry="Select class from login where email=?";
	 pss=connection.prepareStatement(querry);		
	 pss.setString(1, email);
         
	ResultSet rss= pss.executeQuery();
        
        while(rss.next())
                        {
                            
                            userClass=rss.getString("class");

                            
                        }
         
	} catch (Exception e) {
	 System.out.println(e);
	}
      return userClass;  
    }

public static void SetDepartID(String email){
        
        Connection connection=DBConnection.getConnection();
	PreparedStatement pss=null;
	try {
	 String querry="Select departID from login where email=?";
	 pss=connection.prepareStatement(querry);		
	 pss.setString(1, email);
         
	ResultSet rss= pss.executeQuery();
        
        while(rss.next())
                        {
                            
                            departID=rss.getString("departID");

                            
                        }
         
	} catch (Exception e) {
	 System.out.println(e);
	}
      
    }
public static String getDepartID(){
    return departID;
}
}