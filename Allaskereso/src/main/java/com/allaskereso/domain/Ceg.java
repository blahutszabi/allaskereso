package com.allaskereso.domain;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Ceg {
	
	@GeneratedValue
	@Id
	private Long id;
	private String nev;
	
	@OneToMany(mappedBy = "ceg")
	private List<Allas> allasok;
	
	@ManyToOne
	private Varos varos;
	
	private String utca;
	private String hazszam;
	private String felh_nev;
	private String jelszo;
	
	@OneToOne
	private Kapcsolattarto kapcsolattarto;
	
	public Ceg() {}

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

	public List<Allas> getAllasok() {
		return allasok;
	}

	public void setAllasok(List<Allas> allasok) {
		this.allasok = allasok;
	}

	public Varos getVaros() {
		return varos;
	}

	public void setVaros(Varos varos) {
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

	public Kapcsolattarto getKapcsolattarto() {
		return kapcsolattarto;
	}

	public void setKapcsolattarto(Kapcsolattarto kapcsolattarto) {
		this.kapcsolattarto = kapcsolattarto;
	}

	@Override
	public String toString() {
		return "Ceg [id=" + id + ", nev=" + nev + ", allasok=" + allasok + ", varos=" + varos + ", utca=" + utca
				+ ", hazszam=" + hazszam + ", felh_nev=" + felh_nev + ", jelszo=" + jelszo + ", kapcsolattarto="
				+ kapcsolattarto + "]";
	}
	
	

	
	
}
