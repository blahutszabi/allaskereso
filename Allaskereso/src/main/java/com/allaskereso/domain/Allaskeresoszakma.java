package com.allaskereso.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Allaskeresoszakma implements Serializable {

	@ManyToOne
	@Id
	private Allaskereso allaskereso;
	
	@ManyToOne
	@Id
	private Szakma szakma;
	
	private Allaskeresoszakma() {}

	public Allaskereso getAllaskereso() {
		return allaskereso;
	}

	public void setAllaskereso(Allaskereso allaskereso) {
		this.allaskereso = allaskereso;
	}

	public Szakma getSzakma() {
		return szakma;
	}

	public void setSzakma(Szakma szakma) {
		this.szakma = szakma;
	}

	@Override
	public String toString() {
		return "Allaskeresoszakma [allaskereso=" + allaskereso + ", szakma=" + szakma + "]";
	}
	
	
}
