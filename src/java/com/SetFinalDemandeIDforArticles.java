/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * Update detaildemande set demandeID=(?) where tempdemandeID=(?)
 */
public class SetFinalDemandeIDforArticles {
    public static void UpdateIt(String OriginalDemandeID){
        Connection connection=DBConnection.getConnection();
	PreparedStatement pss=null;
	try {
	 String querry="Update detaildemande set demandeID=(?) where tempdemandeID=(?)";
	 pss=connection.prepareStatement(querry);		
	 pss.setString(1, OriginalDemandeID);
         pss.setString(2,GetIt.getDemandeID());
         pss.executeUpdate();
        
    }
        catch(Exception ex)
                    {
                        ex.printStackTrace();
                    }
    
}
