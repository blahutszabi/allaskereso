package com.allaskereso.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class AllasUp {
	
	@GeneratedValue
	@Id
	private Long id;
	
	private String varos;
	private String szakma;
	private String munkakor;
	private String leiras;
	private Integer ber;
	
	public AllasUp() {
		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getVaros() {
		return varos;
	}

	public void setVaros(String varos) {
		this.varos = varos;
	}

	public String getSzakma() {
		return szakma;
	}

	public void setSzakma(String szakma) {
		this.szakma = szakma;
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
	
	

}
