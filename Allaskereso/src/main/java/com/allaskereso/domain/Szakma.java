package com.allaskereso.domain;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Szakma {
	@GeneratedValue
	@Id
	private Long id;
	private String megnevezes;
	
	@OneToMany(mappedBy="szakma")
	private List<Allas> allasok;
	
	@OneToMany(mappedBy="szakma")
	private List<Allaskeresoszakma> allaskeresoszakmak;

	private Szakma() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMegnevezes() {
		return megnevezes;
	}

	public void setMegnevezes(String megnevezes) {
		this.megnevezes = megnevezes;
	}

	public List<Allas> getAllasok() {
		return allasok;
	}

	public void setAllasok(List<Allas> allasok) {
		this.allasok = allasok;
	}

	public List<Allaskeresoszakma> getAllaskeresoszakmak() {
		return allaskeresoszakmak;
	}

	public void setAllaskeresoszakmak(List<Allaskeresoszakma> allaskeresoszakmak) {
		this.allaskeresoszakmak = allaskeresoszakmak;
	}

	@Override
	public String toString() {
		return "Szakma [id=" + id + ", megnevezes=" + megnevezes + ", allasok=" + allasok + ", allaskeresoszakmak="
				+ allaskeresoszakmak + "]";
	}
	
	
}
