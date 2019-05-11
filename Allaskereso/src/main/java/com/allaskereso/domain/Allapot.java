package com.allaskereso.domain;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Allapot {

	
	@GeneratedValue
	@Id
	private Long id;
	private String megnevezes;
	
	@OneToMany(mappedBy = "allapot")
	private List<Jelentkezes> jelentkezesek;
	
	public Allapot() {}

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

	public List<Jelentkezes> getJelentkezesek() {
		return jelentkezesek;
	}

	public void setJelentkezesek(List<Jelentkezes> jelentkezesek) {
		this.jelentkezesek = jelentkezesek;
	}

	@Override
	public String toString() {
		return "Allapot [id=" + id + ", megnevezes=" + megnevezes + ", jelentkezesek=" + jelentkezesek + "]";
	}
	
}
