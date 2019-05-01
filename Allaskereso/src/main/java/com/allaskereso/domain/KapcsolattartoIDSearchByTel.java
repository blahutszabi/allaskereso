package com.allaskereso.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
@Entity
public class KapcsolattartoIDSearchByTel {
	@GeneratedValue
	@Id
	private Long id;
	private String telefonszam;
	
	public KapcsolattartoIDSearchByTel() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTelefonszam() {
		return telefonszam;
	}

	public void setTelefonszam(String telefonszam) {
		this.telefonszam = telefonszam;
	}

	@Override
	public String toString() {
		return "KapcsolattartoIDSearchByTel [id=" + id + ", telefonszam=" + telefonszam + "]";
	}
	
	
}
