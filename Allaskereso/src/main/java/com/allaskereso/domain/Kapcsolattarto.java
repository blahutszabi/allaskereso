package com.allaskereso.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Kapcsolattarto {
	
	@GeneratedValue
	@Id
	private Long id;
	private String nev;
	private String email;
	private String telefonszam;
	
	@OneToOne(mappedBy="kapcsolattarto")
	private Ceg ceg;
	
	private Kapcsolattarto() {}

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefonszam() {
		return telefonszam;
	}

	public void setTelefonszam(String telefonszam) {
		this.telefonszam = telefonszam;
	}

	public Ceg getCeg() {
		return ceg;
	}

	public void setCeg(Ceg ceg) {
		this.ceg = ceg;
	}

	@Override
	public String toString() {
		return "Kapcsolattarto [id=" + id + ", nev=" + nev + ", email=" + email + ", telefonszam=" + telefonszam
				+ ", ceg=" + ceg + "]";
	}
	
	
}
