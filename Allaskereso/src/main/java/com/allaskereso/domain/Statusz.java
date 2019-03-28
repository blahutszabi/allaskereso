package com.allaskereso.domain;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Statusz {
	
	@GeneratedValue
	@Id
	private Long id;
	private String megnevezes;
	
	@OneToMany(mappedBy="statusz")
	private List<Allaskereso> allaskeresok;
	
	private Statusz() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMegnevezes() {
		return megnevezes;
	}

	public void setMegnevezes(String megnevezes) {
		this.megnevezes = megnevezes;
	}

	public List<Allaskereso> getAllaskeresok() {
		return allaskeresok;
	}

	public void setAllaskeresok(List<Allaskereso> allaskeresok) {
		this.allaskeresok = allaskeresok;
	}

	@Override
	public String toString() {
		return "Statusz [id=" + id + ", megnevezes=" + megnevezes + ", allaskeresok=" + allaskeresok + "]";
	}
	
}
