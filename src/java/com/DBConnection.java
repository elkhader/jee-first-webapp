/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Admin
 */
public class DBConnection {
    static final String URL="jdbc:mysql://localhost:3306/";
    static final String DATABASE_NAME="mynewdatabase";
    static final String USERNAME="root";
    static final String PASSWORD="22101997";
    
    public static Connection getConnection(){
        Connection con=null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(URL+DATABASE_NAME,USERNAME,PASSWORD);
 
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return con;
    }
    
}
