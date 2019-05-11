package com.allaskereso.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class CegModosit {

	@GeneratedValue
	@Id
	private Long id;
	private String jelszo;
	private String nev;
	private String varos;
	private String utca;
	private String hazszam;
	private String kapcs_nev;
	private String kapcs_email;
	private String kapcs_tel;
	
	public CegModosit() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getJelszo() {
		return jelszo;
	}

	public void setJelszo(String jelszo) {
		this.jelszo = jelszo;
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

	public String getKapcs_nev() {
		return kapcs_nev;
	}

	public void setKapcs_nev(String kapcs_nev) {
		this.kapcs_nev = kapcs_nev;
	}

	public String getKapcs_email() {
		return kapcs_email;
	}

	public void setKapcs_email(String kapcs_email) {
		this.kapcs_email = kapcs_email;
	}

	public String getKapcs_tel() {
		return kapcs_tel;
	}

	public void setKapcs_tel(String kapcs_tel) {
		this.kapcs_tel = kapcs_tel;
	}
	
	
	
}
