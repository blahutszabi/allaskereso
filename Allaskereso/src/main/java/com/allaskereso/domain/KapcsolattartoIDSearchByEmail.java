package com.allaskereso.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
@Entity
public class KapcsolattartoIDSearchByEmail {
	@GeneratedValue
	@Id
	private Long id;
	private String email;
	
	public KapcsolattartoIDSearchByEmail() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "KapcsolattartoIDSearchByEmail [id=" + id + ", email=" + email + "]";
	}
	
	
}
