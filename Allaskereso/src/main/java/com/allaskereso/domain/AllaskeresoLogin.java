package com.allaskereso.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class AllaskeresoLogin {
	
	@GeneratedValue
	@Id
	private Long id;
	private String felh_nev;
	private String jelszo;
	
	public AllaskeresoLogin() {}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
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
	
	

}
