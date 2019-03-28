package com.allaskereso.services;

import java.sql.Array;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;

import com.allaskereso.domain.*;

import oracle.sql.TIMESTAMP;


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
	
	public AllaskeresoLogin allaskeresoLogin(EntityManager manager, String username) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("allaskeresoLogin",AllaskeresoLogin.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.registerStoredProcedureParameter("username", String.class, ParameterMode.IN);
		procedureQuery.setParameter("username", username);
		procedureQuery.execute();
		AllaskeresoLogin firstrow = (AllaskeresoLogin) procedureQuery.getSingleResult();
	    return firstrow;
	}
	
	public CegLogin cegLogin(EntityManager manager, String username) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("cegLogin",CegLogin.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.registerStoredProcedureParameter("username", String.class, ParameterMode.IN);
		procedureQuery.setParameter("username", username);
		procedureQuery.execute();
		CegLogin firstrow = (CegLogin) procedureQuery.getSingleResult();
	    return firstrow;
	}
	
	public ModeratorLogin moderatorLogin(EntityManager manager, String username) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("moderatorLogin",ModeratorLogin.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.registerStoredProcedureParameter("username", String.class, ParameterMode.IN);
		procedureQuery.setParameter("username", username);
		procedureQuery.execute();
		ModeratorLogin firstrow = (ModeratorLogin) procedureQuery.getSingleResult();
	    return firstrow;
	}
	
	public VarosIDSearch varosIdByName(EntityManager manager, String vnev) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("varosIdByNev",VarosIDSearch.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.registerStoredProcedureParameter("vnev", String.class, ParameterMode.IN);
		procedureQuery.setParameter("vnev", vnev);
		procedureQuery.execute();
		VarosIDSearch firstrow = (VarosIDSearch) procedureQuery.getSingleResult();
	    return firstrow;
	}
	
	public SzakmaSearch szakmaIdByName(EntityManager manager, String sznev) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("szakmaIdByNev",SzakmaSearch.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.registerStoredProcedureParameter("sznev", String.class, ParameterMode.IN);
		procedureQuery.setParameter("sznev", sznev);
		procedureQuery.execute();
		SzakmaSearch firstrow = (SzakmaSearch) procedureQuery.getSingleResult();
	    return firstrow;
	}
	
	public boolean insertSzakma(EntityManager manager, String sznev) {
		
		try {
			
			StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("ujSzakma");
			
			procedureQuery.registerStoredProcedureParameter("sznev", String.class, ParameterMode.IN);
			procedureQuery.setParameter("sznev", sznev);
			
			procedureQuery.execute();
			
			
		}
		catch (Exception e) {
			return false;
		}
		
		return true;
	}
	
	public boolean insertAllaskereso(EntityManager manager, String anev, Date szul, String emailc, int varosid, String utcap, String hazszamp,
			String felh_nevp, String jelszop, Timestamp utolso_belepesp, List<Integer> szakmap, List<Blob> oneletrajzp ) {
		
		try {
			
			StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("ujAllaskereso");
			
			procedureQuery.registerStoredProcedureParameter("anev", String.class, ParameterMode.IN);
			procedureQuery.setParameter("anev", anev);
			
			procedureQuery.registerStoredProcedureParameter("szul", Date.class, ParameterMode.IN);
			procedureQuery.setParameter("szul", szul);
			
			procedureQuery.registerStoredProcedureParameter("emailc", String.class, ParameterMode.IN);
			procedureQuery.setParameter("emailc", emailc);
			
			
			procedureQuery.registerStoredProcedureParameter("varosid", Integer.class, ParameterMode.IN);
			procedureQuery.setParameter("varosid", varosid);
			
			procedureQuery.registerStoredProcedureParameter("utcap", String.class, ParameterMode.IN);
			procedureQuery.setParameter("utcap", utcap);
			
			procedureQuery.registerStoredProcedureParameter("hazszamp", String.class, ParameterMode.IN);
			procedureQuery.setParameter("hazszamp", hazszamp);
			
			procedureQuery.registerStoredProcedureParameter("felh_nevp", String.class, ParameterMode.IN);
			procedureQuery.setParameter("felh_nevp", felh_nevp);
			
			procedureQuery.registerStoredProcedureParameter("jelszop", String.class, ParameterMode.IN);
			procedureQuery.setParameter("jelszop", jelszop);
			
			procedureQuery.registerStoredProcedureParameter("utolso_belepesp", Timestamp.class, ParameterMode.IN);
			procedureQuery.setParameter("utolso_belepesp", utolso_belepesp);
			
			procedureQuery.registerStoredProcedureParameter("szakmap", List.class, ParameterMode.IN);
			procedureQuery.setParameter("szakmap", szakmap);
			
			procedureQuery.registerStoredProcedureParameter("oneletrajzp", List.class, ParameterMode.IN);
			procedureQuery.setParameter("oneletrajzp", oneletrajzp);
			
			procedureQuery.execute();
			
			
		}
		catch (Exception e) {
			return false;
		}
		
		return true;
	}
	
	

}
