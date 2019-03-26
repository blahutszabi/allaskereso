package com.allaskereso.domain;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;



@Entity
public class Varos {
	
	@GeneratedValue
	@Id
	private Long id;
	private String nev;
	
	@OneToMany(mappedBy="varos")
	private List<Ceg> cegek;
	
	@OneToMany(mappedBy="varos")
	private List<Allas> allasok;
	
	@OneToMany(mappedBy="varos")
	private List<Allaskereso> allaskeresok;
	
	public Varos() {}
	
	public List<Ceg> getCegek() {
		return cegek;
	}

	public void setCegek(List<Ceg> cegek) {
		this.cegek = cegek;
	}
	
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

	public List<Allaskereso> getAllaskeresok() {
		return allaskeresok;
	}

	public void setAllaskeresok(List<Allaskereso> allaskeresok) {
		this.allaskeresok = allaskeresok;
	}

	@Override
	public String toString() {
		return "Varos [id=" + id + ", nev=" + nev + ", cegek=" + cegek + ", allasok=" + allasok + ", allaskeresok="
				+ allaskeresok + "]";
	}

	
}
