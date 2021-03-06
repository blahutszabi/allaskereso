package com.allaskereso.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
@Entity
public class AllaskeresoIDSearchByFNev {
	@GeneratedValue
	@Id
	private Long id;
	private String felh_nev;
	
	
	public AllaskeresoIDSearchByFNev() {}
	

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFelh_nev() {
		return felh_nev;
	}
	public void setFelh_nev(String felh_nev) {
		this.felh_nev = felh_nev;
	}
	
	@Override
	public String toString() {
		return "allaskeresoIDSearchByFNev [id=" + id + ", felh_nev=" + felh_nev + "]";
	}
	
}
