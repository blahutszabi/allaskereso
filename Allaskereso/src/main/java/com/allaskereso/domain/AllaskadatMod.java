package com.allaskereso.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class AllaskadatMod {
	@GeneratedValue
	@Id
	private Long id;
	
	private String email;
	private String jelszo;
	private String varos;
	private String utca;
	private String hazszam;
	private String statusz;
	
	public AllaskadatMod() {}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJelszo() {
		return jelszo;
	}
	public void setJelszo(String jelszo) {
		this.jelszo = jelszo;
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

	public String getStatusz() {
		return statusz;
	}

	public void setStatusz(String statusz) {
		this.statusz = statusz;
	}
	
	
	
}
