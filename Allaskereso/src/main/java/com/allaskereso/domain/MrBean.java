package com.allaskereso.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class MrBean {
	
	@GeneratedValue
	@Id
	private Long id;

	private Long value;
	private String megnvezes;
	
	public MrBean() {}

	public Long getValue() {
		return value;
	}

	public void setValue(Long value) {
		this.value = value;
	}

	public String getMegnvezes() {
		return megnvezes;
	}

	public void setMegnvezes(String megnvezes) {
		this.megnvezes = megnvezes;
	}
	
	

}
