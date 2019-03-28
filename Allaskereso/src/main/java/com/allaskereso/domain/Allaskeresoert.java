package com.allaskereso.domain;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Allaskeresoert implements Serializable {

	private String ertekeles;
	private Timestamp datum;
	
	@ManyToOne
	@Id
	private Allaskereso allaskereso;
	
	@ManyToOne
	@Id
	private Allas allas;
	
	private Allaskeresoert() {}

	public String getErtekeles() {
		return ertekeles;
	}

	public void setErtekeles(String ertekeles) {
		this.ertekeles = ertekeles;
	}

	public Timestamp getDatum() {
		return datum;
	}

	public void setDatum(Timestamp datum) {
		this.datum = datum;
	}

	public Allaskereso getAllaskereso() {
		return allaskereso;
	}

	public void setAllaskereso(Allaskereso allaskereso) {
		this.allaskereso = allaskereso;
	}

	public Allas getAllas() {
		return allas;
	}

	public void setAllas(Allas allas) {
		this.allas = allas;
	}

	@Override
	public String toString() {
		return "Allaskeresoert [ertekeles=" + ertekeles + ", datum=" + datum + ", allaskereso=" + allaskereso
				+ ", allas=" + allas + "]";
	}
	
	
}
