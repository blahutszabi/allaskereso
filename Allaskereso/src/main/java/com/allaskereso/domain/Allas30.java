package com.allaskereso.domain;

import java.sql.Timestamp;

import javax.persistence.*;



@Entity
public class Allas30 {
	
	@GeneratedValue
	@Id
	private Long id;
	
	
	private String cegnev;
	private String varosnev;
	private String szakmanev;
	private String munkakor;
	private String leiras;
	private Integer ber;
	private Timestamp feladas;
	
	public Allas30() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCegnev() {
		return cegnev;
	}

	public void setCegnev(String cegnev) {
		this.cegnev = cegnev;
	}

	public String getVarosnev() {
		return varosnev;
	}

	public void setVarosnev(String varosnev) {
		this.varosnev = varosnev;
	}

	public String getSzakmanev() {
		return szakmanev;
	}

	public void setSzakmanev(String szakmanev) {
		this.szakmanev = szakmanev;
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

	public Timestamp getFeladas() {
		return feladas;
	}

	public void setFeladas(Timestamp feladas) {
		this.feladas = feladas;
	}

	@Override
	public String toString() {
		return "Allas30 [id=" + id + ", cegnev=" + cegnev + ", varosnev=" + varosnev + ", szakmanev=" + szakmanev
				+ ", munkakor=" + munkakor + ", leiras=" + leiras + ", ber=" + ber + ", feladas=" + feladas + "]";
	}
	
	
	

}
