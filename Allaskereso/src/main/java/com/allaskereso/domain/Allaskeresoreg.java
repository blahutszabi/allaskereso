package com.allaskereso.domain;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Allaskeresoreg {
	@GeneratedValue
	@Id
	private Long id;
	private String nev;
	private Date szul_ido;
	private String email;
	private String utca;
	private String hazszam;
	private String varos;


	
	private String felh_nev;
	private String jelszo;
	private Timestamp utolso_belepes;
	
	
	
	public Allaskeresoreg() {}



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



	public Date getSzul_ido() {
		return szul_ido;
	}



	public void setSzul_ido(Date szul_ido) {
		this.szul_ido = szul_ido;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
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



	public String getVaros() {
		return varos;
	}



	public void setVaros(String varos) {
		this.varos = varos;
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



	public Timestamp getUtolso_belepes() {
		return utolso_belepes;
	}



	public void setUtolso_belepes(Timestamp utolso_belepes) {
		this.utolso_belepes = utolso_belepes;
	}
	
	

	

	
	
	
}
