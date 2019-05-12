package com.allaskereso.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;


public class MrBean {
	

	private int value;
	private String megnevezes;
	
	public MrBean() {}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public String getMegnevezes() {
		return megnevezes;
	}

	public void setMegnevezes(String megnvezes) {
		this.megnevezes = megnvezes;
	}
	
	

}
