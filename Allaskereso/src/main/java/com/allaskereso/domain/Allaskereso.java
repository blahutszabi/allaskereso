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
public class Allaskereso {
	@GeneratedValue
	@Id
	private Long id;
	private String nev;
	private Date szul_ido;
	private String email;
	
	@ManyToOne
	private Varos varos;
	
	private String felh_nev;
	private String jelszo;
	private Timestamp utolso_belepes;
	
	@OneToMany(mappedBy="allaskereso")
	private List<Allasert> allasertekelesek;
	
	@ManyToOne
	private Statusz statusz;
	
	@OneToMany(mappedBy="allaskereso")
	private List<Oneletrajz> oneletrajzok;
	
	@OneToMany(mappedBy="allaskereso")
	private List<Jelentkezes> jelentkezesek;
	
	@OneToMany(mappedBy="allaskereso")
	private List<Allaskeresoszakma> allaskeresoszakmak;
	
	@OneToMany(mappedBy="allaskereso")
	private List<Allaskeresoert> allaskeresoertekelesek;
	
	private Allaskereso() {}

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

	public Varos getVaros() {
		return varos;
	}

	public void setVaros(Varos varos) {
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

	public List<Allasert> getAllasertekelesek() {
		return allasertekelesek;
	}

	public void setAllasertekelesek(List<Allasert> allasertekelesek) {
		this.allasertekelesek = allasertekelesek;
	}

	public Statusz getStatusz() {
		return statusz;
	}

	public void setStatusz(Statusz statusz) {
		this.statusz = statusz;
	}

	public List<Oneletrajz> getOneletrajzok() {
		return oneletrajzok;
	}

	public void setOneletrajzok(List<Oneletrajz> oneletrajzok) {
		this.oneletrajzok = oneletrajzok;
	}

	public List<Jelentkezes> getJelentkezesek() {
		return jelentkezesek;
	}

	public void setJelentkezesek(List<Jelentkezes> jelentkezesek) {
		this.jelentkezesek = jelentkezesek;
	}

	public List<Allaskeresoszakma> getAllaskeresoszakmak() {
		return allaskeresoszakmak;
	}

	public void setAllaskeresoszakmak(List<Allaskeresoszakma> allaskeresoszakmak) {
		this.allaskeresoszakmak = allaskeresoszakmak;
	}

	public List<Allaskeresoert> getAllaskeresoertekelesek() {
		return allaskeresoertekelesek;
	}

	public void setAllaskeresoertekelesek(List<Allaskeresoert> allaskeresoertekelesek) {
		this.allaskeresoertekelesek = allaskeresoertekelesek;
	}

	@Override
	public String toString() {
		return "Allaskereso [id=" + id + ", nev=" + nev + ", szul_ido=" + szul_ido + ", email=" + email + ", varos="
				+ varos + ", felh_nev=" + felh_nev + ", jelszo=" + jelszo + ", utolso_belepes=" + utolso_belepes
				+ ", allasertekelesek=" + allasertekelesek + ", statusz=" + statusz + ", oneletrajzok=" + oneletrajzok
				+ ", jelentkezesek=" + jelentkezesek + ", allaskeresoszakmak=" + allaskeresoszakmak
				+ ", allaskeresoertekelesek=" + allaskeresoertekelesek + "]";
	}
	
	
}
