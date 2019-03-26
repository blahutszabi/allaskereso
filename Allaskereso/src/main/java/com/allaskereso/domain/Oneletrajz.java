package com.allaskereso.domain;

import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
@Entity
public class Oneletrajz {
	@GeneratedValue
	@Id
	private Long id;
	
	@ManyToOne
	private Allaskereso allaskereso;
	
	private Blob oneletrajz;
	
	private Oneletrajz() {}

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

	public Blob getOneletrajz() {
		return oneletrajz;
	}

	public void setOneletrajz(Blob oneletrajz) {
		this.oneletrajz = oneletrajz;
	}

	@Override
	public String toString() {
		return "Oneletrajz [id=" + id + ", allaskereso=" + allaskereso + ", oneletrajz=" + oneletrajz + "]";
	}
	
	
}
