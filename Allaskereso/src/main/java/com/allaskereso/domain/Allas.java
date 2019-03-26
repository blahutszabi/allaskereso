package com.allaskereso.domain;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Allas {
	@GeneratedValue
	@Id
	private Long id;
	
	@ManyToOne
	private Ceg ceg;
	
	@ManyToOne
	private Varos varos;
	
	@ManyToOne
	private Szakma szakma;
	
	@OneToMany(mappedBy="allas")
	private List<Jelentkezes> jelentkezesek;
	
	@OneToMany(mappedBy="allas")
	private List<Allasert> allasertekelesek;
	
	@OneToMany(mappedBy="allas")
	private List<Allaskeresoert> allaskeresoertekelesek;
	
	private String munkakor;
	private String leiras;
	private Integer ber;
	private Timestamp feladas_datuma;
	
	private Allas() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Ceg getCeg() {
		return ceg;
	}

	public void setCeg(Ceg ceg) {
		this.ceg = ceg;
	}

	public Varos getVaros() {
		return varos;
	}

	public void setVaros(Varos varos) {
		this.varos = varos;
	}

	public Szakma getSzakma() {
		return szakma;
	}

	public void setSzakma(Szakma szakma) {
		this.szakma = szakma;
	}

	public List<Jelentkezes> getJelentkezesek() {
		return jelentkezesek;
	}

	public void setJelentkezesek(List<Jelentkezes> jelentkezesek) {
		this.jelentkezesek = jelentkezesek;
	}

	public List<Allasert> getAllasertekelesek() {
		return allasertekelesek;
	}

	public void setAllasertekelesek(List<Allasert> allasertekelesek) {
		this.allasertekelesek = allasertekelesek;
	}

	public List<Allaskeresoert> getAllaskeresoertekelesek() {
		return allaskeresoertekelesek;
	}

	public void setAllaskeresoertekelesek(List<Allaskeresoert> allaskeresoertekelesek) {
		this.allaskeresoertekelesek = allaskeresoertekelesek;
	}

	public String getMunkakor() {
		return munkakor;
	}

	public void setMunkakor(String munkakor) {
		this.munkakor = munkakor;
	}

	public String getLeiras() {
		return leiras;
	}

	public void setLeiras(String leiras) {
		this.leiras = leiras;
	}

	public Integer getBer() {
		return ber;
	}

	public void setBer(Integer ber) {
		this.ber = ber;
	}

	public Timestamp getFeladas_datuma() {
		return feladas_datuma;
	}

	public void setFeladas_datuma(Timestamp feladas_datuma) {
		this.feladas_datuma = feladas_datuma;
	}

	@Override
	public String toString() {
		return "Allas [id=" + id + ", ceg=" + ceg + ", varos=" + varos + ", szakma=" + szakma + ", jelentkezesek="
				+ jelentkezesek + ", allasertekelesek=" + allasertekelesek + ", allaskeresoertekelesek="
				+ allaskeresoertekelesek + ", munkakor=" + munkakor + ", leiras=" + leiras + ", ber=" + ber
				+ ", feladas_datuma=" + feladas_datuma + "]";
	}
	
}
