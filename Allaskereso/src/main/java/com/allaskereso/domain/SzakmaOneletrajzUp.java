package com.allaskereso.domain;

import java.io.File;
import java.sql.Blob;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class SzakmaOneletrajzUp {
	
	@GeneratedValue
	@Id
	private Long id;
	
	private Long allask_id;
	
	private String megnevezes;
	
	public SzakmaOneletrajzUp() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}


	public Long getAllask_id() {
		return allask_id;
	}

	public void setAllask_id(Long allask_id) {
		this.allask_id = allask_id;
	}
	
	
	
	private String oneletrajz;
	
	

	public String getOneletrajz() {
		return oneletrajz;
	}

	public void setOneletrajz(String oneletrajz) {
		this.oneletrajz = oneletrajz;
	}

	public String getMegnevezes() {
		return megnevezes;
	}

	public void setMegnevezes(String megnevezes) {
		this.megnevezes = megnevezes;
	}

	
	
	
	
	

}
