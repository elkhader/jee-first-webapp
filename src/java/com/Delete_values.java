/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 *
 * @author Sara
 */
public class Delete_values {
    public void delete_value(String articlenom){
	
	Connection connection=DBConnection.getConnection();
	PreparedStatement ps=null;
	try {
	 String querry="delete from detaildemande where articleid=? and DemandeID=?";
	 ps=connection.prepareStatement(querry);		
	 ps.setString(1, GetIt.getArticleID(articlenom));
         ps.setString(2, GetIt.getDemandeID());
	 ps.executeUpdate();
	} catch (Exception e) {
	 System.out.println(e);
	}
	}
    
}
