package com.allaskereso.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Moderator {

	@GeneratedValue
	@Id
	private Long id;
	private String nev;
	private String felh_nev;
	private String jelszo;
	
	private Moderator() {}

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

	@Override
	public String toString() {
		return "Moderator [id=" + id + ", nev=" + nev + ", felh_nev=" + felh_nev + ", jelszo=" + jelszo + "]";
	}
	
	
	
}
