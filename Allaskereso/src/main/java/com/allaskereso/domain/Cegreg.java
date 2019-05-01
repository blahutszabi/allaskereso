package com.allaskereso.domain;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Cegreg {
	
	@GeneratedValue
	@Id
	private Long id;
	private String nev;
	private String varos;
	private String utca;
	private String hazszam;
	private String felh_nev;
	private String jelszo;
	private String kapcs_nev;
	private String kapcs_tel;
	private String kapcs_email;
	
	
	public Cegreg() {}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getNev() {
		return nev;
	}


	public void setNev(String nev) {
		this.nev = nev;
	}


	public String getVaros() {
		return varos;
	}


	public void setVaros(String varos) {
		this.varos = varos;
	}


	public String getUtca() {
		return utca;
	}


	public void setUtca(String utca) {
		this.utca = utca;
	}


	public String getHazszam() {
		return hazszam;
	}


	public void setHazszam(String hazszam) {
		this.hazszam = hazszam;
	}


	public String getFelh_nev() {
		return felh_nev;
	}


	public void setFelh_nev(String felh_nev) {
		this.felh_nev = felh_nev;
	}


	public String getJelszo() {
		return jelszo;
	}


	public void setJelszo(String jelszo) {
		this.jelszo = jelszo;
	}


	public String getKapcs_nev() {
		return kapcs_nev;
	}


	public void setKapcs_nev(String kapcs_nev) {
		this.kapcs_nev = kapcs_nev;
	}


	public String getKapcs_tel() {
		return kapcs_tel;
	}


	public void setKapcs_tel(String kapcs_tel) {
		this.kapcs_tel = kapcs_tel;
	}


	public String getKapcs_email() {
		return kapcs_email;
	}


	public void setKapcs_email(String kapcs_email) {
		this.kapcs_email = kapcs_email;
	}


	@Override
	public String toString() {
		return "Cegreg [id=" + id + ", nev=" + nev + ", varos=" + varos + ", utca=" + utca + ", hazszam=" + hazszam
				+ ", felh_nev=" + felh_nev + ", jelszo=" + jelszo + ", kapcs_nev=" + kapcs_nev + ", kapcs_tel="
				+ kapcs_tel + ", kapcs_email=" + kapcs_email + "]";
	}



	
	
}
