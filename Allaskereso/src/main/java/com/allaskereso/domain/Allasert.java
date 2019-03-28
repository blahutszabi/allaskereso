package com.allaskereso.domain;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Allasert {

	@GeneratedValue
	@Id
	private Long id;
	
	@ManyToOne
	private Allaskereso allaskereso;
	
	@ManyToOne
	private Allas allas;
	
	private String szoveg;
	private Integer ertek;
	private Timestamp datum;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	public String getSzoveg() {
		return szoveg;
	}
	public void setSzoveg(String szoveg) {
		this.szoveg = szoveg;
	}
	public Integer getErtek() {
		return ertek;
	}
	public void setErtek(Integer ertek) {
		this.ertek = ertek;
	}
	public Timestamp getDatum() {
		return datum;
	}
	public void setDatum(Timestamp datum) {
		this.datum = datum;
	}
	@Override
	public String toString() {
		return "Allasert [id=" + id + ", allaskereso=" + allaskereso + ", allas=" + allas + ", szoveg=" + szoveg
				+ ", ertek=" + ertek + ", datum=" + datum + "]";
	}
	
	
}
