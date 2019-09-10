/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Sara
 */
public class Read_Values {
    public static void main(String[] args) {
	Read_Values obj_Read_Values=new Read_Values();
	obj_Read_Values.get_values();
    }
    public List get_values(){
	Connection connection=DBConnection.getConnection();
	
	PreparedStatement ps=null;
	ResultSet rs=null;
	List list=new ArrayList();
	try {
	String querry="select articlenom, SUM(quantite), articleprix from articles, detaildemande where articles.articleid=detaildemande.articleid and tempdemandeid=(?) group by articlenom";
	ps=connection.prepareStatement(querry);	
        ps.setString(1, GetIt.getDemandeID());/*HERE PUT DEMANDEID */
	rs=ps.executeQuery();
	while(rs.next()){
	  Article_Bean obj_Article_Bean=new Article_Bean();
	  System.out.println(rs.getString("articlenom"));
	  System.out.println(rs.getString("SUM(quantite)"));
	  System.out.println(rs.getString("articleprix"));
	  
	  obj_Article_Bean.setArticlenom(rs.getString("articlenom"));
          obj_Article_Bean.setQuantite(rs.getString("SUM(quantite)"));
	  obj_Article_Bean.setArticleprix(rs.getString("articleprix"));
	  
	list.add(obj_Article_Bean);
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	return list;
	}
}
