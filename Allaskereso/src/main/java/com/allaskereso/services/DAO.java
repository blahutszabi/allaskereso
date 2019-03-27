package com.allaskereso.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;

import com.allaskereso.domain.*;


public class DAO {
	
	
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
	
	public List<Allaskereso> listAllaskeresok(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listAllaskeresok",Allaskereso.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Allaskereso> allaskeresok = procedureQuery.getResultList();
	    return allaskeresok;
	}
	
	public List<Szakma> listSzakmak(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listSzakmak",Szakma.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Szakma> szakmak = procedureQuery.getResultList();
	    return szakmak;
	}
	
	public List<Allapot> listAllapotok(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listAllapotok",Allapot.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Allapot> allapotok = procedureQuery.getResultList();
	    return allapotok;
	}
	
	public List<Jelentkezes> listJelentkezesek(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listJelentkezesek",Jelentkezes.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Jelentkezes> jelentkezesek = procedureQuery.getResultList();
	    return jelentkezesek;
	}
	
	public List<Allasert> listAllasertekelesek(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listAllasertekelesek",Allasert.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Allasert> allasertekelesek = procedureQuery.getResultList();
	    return allasertekelesek;
	}
	
	public List<Allaskeresoert> listAllaskeresoertekelesek(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listAllaskeresoertekelesek",Allaskeresoert.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Allaskeresoert> allaskeresoertekelesek = procedureQuery.getResultList();
	    return allaskeresoertekelesek;
	}
	
	public List<Oneletrajz> listOneletrajzok(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listOneletrajzok",Oneletrajz.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Oneletrajz> oneletrajzok = procedureQuery.getResultList();
	    return oneletrajzok;
	}
	public List<Allaskeresoszakma> listAllaskeresoszakmak(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listAllaskeresoszakmak",Allaskeresoszakma.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Allaskeresoszakma> allaskeresoszakmak = procedureQuery.getResultList();
	    return allaskeresoszakmak;
	}
	
	public List<Allas> listAllasok(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listAllasok",Allas.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Allas> allasok = procedureQuery.getResultList();
	    return allasok;
	}
	
	public List<Moderator> listModeratorok(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listModeratorok",Moderator.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Moderator> moderatorok = procedureQuery.getResultList();
	    return moderatorok;
	}
	
	public List<Kapcsolattarto> listKapcsolattartok(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listKapcsolattartok",Kapcsolattarto.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Kapcsolattarto> kapcsolattartok = procedureQuery.getResultList();
	    return kapcsolattartok;
	}
	
	public List<Statusz> listStatuszok(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listStatuszok",Statusz.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Statusz> statuszok = procedureQuery.getResultList();
	    return statuszok;
	}
	
	
	
	

}
