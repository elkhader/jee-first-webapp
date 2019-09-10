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
public class Demand_Bean {
    private String demandeID;
    private String prenom;
    private String datedemande;
    private String etat;
    
    public String getDemandeID() {
		return demandeID;
	}
    public void setDemandeID(String demandeID) {
		this.demandeID = demandeID;
	}
    public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getdatedemande() {
		return datedemande;
	}
	public void setdatedemande(String datedemande) {
		this.datedemande = datedemande;
	}
        
        public void setEtat(String etat){
            this.etat= etat;
        }
        public String getEtat(){
            return etat; 
        }

    
}
