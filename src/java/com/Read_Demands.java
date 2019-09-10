/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

/**
 *
 * @author Sara
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Sara
 */
public class Read_Demands {
    public static void main(String[] args) {
	Read_Demands obj_Read_Demands=new Read_Demands();
        obj_Read_Demands.get_Demands();
    }
    public List get_Demands(){
	Connection connection=DBConnection.getConnection();
	
	PreparedStatement ps=null;
	ResultSet rs=null;
	List list=new ArrayList();
	try {
	String querry="select demandeID, prenom, datedemande, Etat from login, demande where login.departID=(?) and login.ID=demande.ID ";
	ps=connection.prepareStatement(querry);	
        ps.setString(1, GetIt.getDepartID());/*HERE PUT DEMANDEID */
	rs=ps.executeQuery();
	while(rs.next()){
	  Demand_Bean obj_Demand_Bean=new Demand_Bean();
	  System.out.println(rs.getString("demandeID"));
	  System.out.println(rs.getString("prenom"));
	  System.out.println(rs.getString("datedemande"));
          
	  
	  obj_Demand_Bean.setDemandeID(rs.getString("demandeID"));
          obj_Demand_Bean.setPrenom(rs.getString("prenom"));
	  obj_Demand_Bean.setdatedemande(rs.getString("datedemande"));
          
          
	  
	list.add(obj_Demand_Bean);
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	return list;
	}
    public List get_DemandsforUser(String Email){
	Connection connection=DBConnection.getConnection();
	
	PreparedStatement ps=null;
	ResultSet rs=null;
	List list=new ArrayList();
	try {
	String querry="select DemandeID, DateDemande, Etat from demande where demande.ID=(select ID from login where email=?) ";
	ps=connection.prepareStatement(querry);	
        ps.setString(1, Email);/*HERE PUT DEMANDEID */
	rs=ps.executeQuery();
	while(rs.next()){
	  Demand_Bean obj_Demand_Bean=new Demand_Bean();
	  System.out.println(rs.getString("demandeID"));
	  System.out.println(rs.getString("datedemande"));
          System.out.println(rs.getString("Etat"));
	  
	  obj_Demand_Bean.setDemandeID(rs.getString("demandeID"));
	  obj_Demand_Bean.setdatedemande(rs.getString("datedemande"));
          obj_Demand_Bean.setEtat(rs.getString("etat"));
          
	  
	list.add(obj_Demand_Bean);
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	return list;
	}
}
    

