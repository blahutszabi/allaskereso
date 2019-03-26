package com.allaskereso.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;

import com.allaskereso.domain.*;

@NamedStoredProcedureQuery(
		name = "listVarosok", 
		procedureName = "listVarosok"
	)

@NamedStoredProcedureQuery(
		name = "listCegek", 
		procedureName = "listCegek"
	)



public class Test {
	
	
	public List<Ceg> listCegek(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listCegek",Ceg.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Ceg> cegek = procedureQuery.getResultList();
	    return cegek;
	}
	
	
	public List<Varos> listVarosok(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listVarosok",Varos.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Varos> varosok = procedureQuery.getResultList();
	    return varosok;
	}
	

}
