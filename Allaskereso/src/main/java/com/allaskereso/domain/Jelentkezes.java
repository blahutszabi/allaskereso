package com.allaskereso.domain;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Jelentkezes implements Serializable {
	
	@ManyToOne
	@Id
	private Allas allas;
	
	@ManyToOne
	private Allapot allapot;
	
	private Timestamp datum;
	
	@ManyToOne
	@Id
	private Allaskereso allaskereso;
	
	private Jelentkezes() {}

	public Allas getAllas() {
		return allas;
	}

	public void setAllas(Allas allas) {
		this.allas = allas;
	}

	public Allapot getAllapot() {
		return allapot;
	}

	public void setAllapot(Allapot allapot) {
		this.allapot = allapot;
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

	@Override
	public String toString() {
		return "Jelentkezes [allas=" + allas + ", allapot=" + allapot + ", datum=" + datum + ", allaskereso="
				+ allaskereso + "]";
	}
	
}
