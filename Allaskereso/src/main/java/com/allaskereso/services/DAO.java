package com.allaskereso.services;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;

import com.allaskereso.domain.*;

public class DAO {

	public List<Ceg> listCegek(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listCegek", Ceg.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Ceg> cegek = procedureQuery.getResultList();
		return cegek;
	}

	public List<Varos> listVarosok(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listVarosok", Varos.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Varos> varosok = procedureQuery.getResultList();
		return varosok;
	}

	public List<Allaskereso> listAllaskeresok(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listAllaskeresok", Allaskereso.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Allaskereso> allaskeresok = procedureQuery.getResultList();
		return allaskeresok;
	}

	public Allaskereso listAllaskeresokByFnev(EntityManager manager, String fnev) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listAllaskeresoByFnev",
				Allaskereso.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);

		procedureQuery.registerStoredProcedureParameter("fnev", String.class, ParameterMode.IN);
		procedureQuery.setParameter("fnev", fnev);

		procedureQuery.execute();

		Allaskereso allaskereso = (Allaskereso) procedureQuery.getSingleResult();
		return allaskereso;
	}

	public Ceg listCegByFnev(EntityManager manager, String fnev) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listCegByFnev", Ceg.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);

		procedureQuery.registerStoredProcedureParameter("fnev", String.class, ParameterMode.IN);
		procedureQuery.setParameter("fnev", fnev);

		procedureQuery.execute();

		Ceg ceg = (Ceg) procedureQuery.getSingleResult();
		return ceg;
	}

	public List<Allas> listAllasBySzakmaID(EntityManager manager, Long szid) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listAllasBySzakmaId", Allas.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);

		procedureQuery.registerStoredProcedureParameter("szid", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("szid", szid);

		procedureQuery.execute();

		List<Allas> allasok = procedureQuery.getResultList();

		return allasok;
	}

	public List<Szakma> listSzakmak(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listSzakmak", Szakma.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Szakma> szakmak = procedureQuery.getResultList();
		return szakmak;
	}

	public List<Allapot> listAllapotok(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listAllapotok", Allapot.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Allapot> allapotok = procedureQuery.getResultList();
		return allapotok;
	}

	public List<Jelentkezes> listJelentkezesek(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listJelentkezesek",
				Jelentkezes.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Jelentkezes> jelentkezesek = procedureQuery.getResultList();
		return jelentkezesek;
	}

	public List<Allasert> listAllasertekelesek(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listAllasertekelesek",
				Allasert.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Allasert> allasertekelesek = procedureQuery.getResultList();
		return allasertekelesek;
	}

	public List<Allaskeresoert> listAllaskeresoertekelesek(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listAllaskeresoertekelesek",
				Allaskeresoert.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Allaskeresoert> allaskeresoertekelesek = procedureQuery.getResultList();
		return allaskeresoertekelesek;
	}

	public List<Oneletrajz> listOneletrajzok(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listOneletrajzok", Oneletrajz.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Oneletrajz> oneletrajzok = procedureQuery.getResultList();
		return oneletrajzok;
	}

	public List<Allaskeresoszakma> listAllaskeresoszakmak(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listAllaskeresoszakmak",
				Allaskeresoszakma.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Allaskeresoszakma> allaskeresoszakmak = procedureQuery.getResultList();
		return allaskeresoszakmak;
	}

	public List<Allas> listAllasok(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listAllasok", Allas.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Allas> allasok = procedureQuery.getResultList();
		return allasok;
	}

	public List<Moderator> listModeratorok(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listModeratorok", Moderator.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Moderator> moderatorok = procedureQuery.getResultList();
		return moderatorok;
	}

	public List<Kapcsolattarto> listKapcsolattartok(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listKapcsolattartok",
				Kapcsolattarto.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Kapcsolattarto> kapcsolattartok = procedureQuery.getResultList();
		return kapcsolattartok;
	}

	public List<Statusz> listStatuszok(EntityManager manager) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listStatuszok", Statusz.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();
		List<Statusz> statuszok = procedureQuery.getResultList();
		return statuszok;
	}

	public AllaskeresoLogin allaskeresoLogin(EntityManager manager, String username) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("allaskeresoLogin",
				AllaskeresoLogin.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.registerStoredProcedureParameter("username", String.class, ParameterMode.IN);
		procedureQuery.setParameter("username", username);
		procedureQuery.execute();
		AllaskeresoLogin firstrow = (AllaskeresoLogin) procedureQuery.getSingleResult();
		return firstrow;
	}

	public CegLogin cegLogin(EntityManager manager, String username) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("cegLogin", CegLogin.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.registerStoredProcedureParameter("username", String.class, ParameterMode.IN);
		procedureQuery.setParameter("username", username);
		procedureQuery.execute();
		CegLogin firstrow = (CegLogin) procedureQuery.getSingleResult();
		return firstrow;
	}

	public ModeratorLogin moderatorLogin(EntityManager manager, String username) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("moderatorLogin",
				ModeratorLogin.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.registerStoredProcedureParameter("username", String.class, ParameterMode.IN);
		procedureQuery.setParameter("username", username);
		procedureQuery.execute();
		ModeratorLogin firstrow = (ModeratorLogin) procedureQuery.getSingleResult();
		return firstrow;
	}

	public VarosIDSearch varosIdByName(EntityManager manager, String vnev) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("varosIdByNev", VarosIDSearch.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.registerStoredProcedureParameter("vnev", String.class, ParameterMode.IN);
		procedureQuery.setParameter("vnev", vnev);
		procedureQuery.execute();
		VarosIDSearch firstrow = (VarosIDSearch) procedureQuery.getSingleResult();
		return firstrow;
	}

	public SzakmaSearch szakmaIdByName(EntityManager manager, String sznev) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("szakmaIdByNev", SzakmaSearch.class);
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

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

	// file to BLOB
	public static byte[] convertFileContentToBlob(String path) throws IOException {
		// create file object
		File file = new File(path);

		byte[] bytesArray = new byte[(int) file.length()];

		FileInputStream fis = new FileInputStream(file);
		fis.read(bytesArray); // read file into bytes[]
		fis.close();

		return bytesArray;

		/*
		 * // initialize a byte array of size of the file byte[] fileContent = new
		 * byte[(int) file.length()]; FileInputStream inputStream = null; try { //
		 * create an input stream pointing to the file inputStream = new
		 * FileInputStream(file); // read the contents of file into byte array
		 * inputStream.read(fileContent); } catch (IOException e) { throw new
		 * IOException("Unable to convert file to byte array. " + e.getMessage()); }
		 * finally { // close input stream if (inputStream != null) {
		 * inputStream.close(); } }
		 * 
		 * 
		 * return fileContent;
		 */

	}

	public boolean insertAllaskereso(EntityManager manager, String anev, Date szul, String emailc, Long varosid,
			String utcap, String hazszamp, String felh_nevp, String jelszop, Timestamp utolso_belepesp) {

		try {

			StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("ujAllaskereso");

			procedureQuery.registerStoredProcedureParameter("anev", String.class, ParameterMode.IN);
			procedureQuery.setParameter("anev", anev);

			procedureQuery.registerStoredProcedureParameter("szul", Date.class, ParameterMode.IN);
			procedureQuery.setParameter("szul", szul);

			procedureQuery.registerStoredProcedureParameter("emailc", String.class, ParameterMode.IN);
			procedureQuery.setParameter("emailc", emailc);

			procedureQuery.registerStoredProcedureParameter("varosid", Long.class, ParameterMode.IN);
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
			/*
			 * procedureQuery.registerStoredProcedureParameter("szakmap", Long.class,
			 * ParameterMode.IN); procedureQuery.setParameter("szakmap", id);
			 * 
			 * procedureQuery.registerStoredProcedureParameter("oneletrajzp", byte[].class,
			 * ParameterMode.IN); procedureQuery.setParameter("oneletrajzp", asd);
			 */
			procedureQuery.execute();

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

	public boolean insertCeg(EntityManager manager, String cnev, Long varosid, String utcap, String hazszamp,
			String felh_nevp, String jelszop, String kapcs_nev, String kapcs_tel, String kapcs_email) {

		try {

			StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("ujCeg");

			procedureQuery.registerStoredProcedureParameter("cnev", String.class, ParameterMode.IN);
			procedureQuery.setParameter("cnev", cnev);

			procedureQuery.registerStoredProcedureParameter("varosid", Long.class, ParameterMode.IN);
			procedureQuery.setParameter("varosid", varosid);

			procedureQuery.registerStoredProcedureParameter("utcap", String.class, ParameterMode.IN);
			procedureQuery.setParameter("utcap", utcap);

			procedureQuery.registerStoredProcedureParameter("hazszamp", String.class, ParameterMode.IN);
			procedureQuery.setParameter("hazszamp", hazszamp);

			procedureQuery.registerStoredProcedureParameter("felh_nevp", String.class, ParameterMode.IN);
			procedureQuery.setParameter("felh_nevp", felh_nevp);

			procedureQuery.registerStoredProcedureParameter("jelszop", String.class, ParameterMode.IN);
			procedureQuery.setParameter("jelszop", jelszop);

			procedureQuery.registerStoredProcedureParameter("kapcs_nev", String.class, ParameterMode.IN);
			procedureQuery.setParameter("kapcs_nev", kapcs_nev);

			procedureQuery.registerStoredProcedureParameter("kapcs_tel", String.class, ParameterMode.IN);
			procedureQuery.setParameter("kapcs_tel", kapcs_tel);

			procedureQuery.registerStoredProcedureParameter("kapcs_email", String.class, ParameterMode.IN);
			procedureQuery.setParameter("kapcs_email", kapcs_email);

			procedureQuery.execute();

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

	public AllaskeresoIDSearchByFNev allaskeresoIdByFNev(EntityManager manager, String anev) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("allaskeresoIdByFNev",
				AllaskeresoIDSearchByFNev.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.registerStoredProcedureParameter("anev", String.class, ParameterMode.IN);
		procedureQuery.setParameter("anev", anev);
		procedureQuery.execute();
		AllaskeresoIDSearchByFNev firstrow = (AllaskeresoIDSearchByFNev) procedureQuery.getSingleResult();
		return firstrow;
	}

	public AllaskeresoIDSearchByEmail allaskeresoIdByEmail(EntityManager manager, String emailc) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("allaskeresoIdByEmail",
				AllaskeresoIDSearchByEmail.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.registerStoredProcedureParameter("emailc", String.class, ParameterMode.IN);
		procedureQuery.setParameter("emailc", emailc);
		procedureQuery.execute();
		AllaskeresoIDSearchByEmail firstrow = (AllaskeresoIDSearchByEmail) procedureQuery.getSingleResult();
		return firstrow;
	}

	public KapcsolattartoIDSearchByEmail kapcsolattartoIdByEmail(EntityManager manager, String emailc) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("kapcsolattartoIdByEmail",
				KapcsolattartoIDSearchByEmail.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.registerStoredProcedureParameter("emailc", String.class, ParameterMode.IN);
		procedureQuery.setParameter("emailc", emailc);
		procedureQuery.execute();
		KapcsolattartoIDSearchByEmail firstrow = (KapcsolattartoIDSearchByEmail) procedureQuery.getSingleResult();
		return firstrow;
	}

	public KapcsolattartoIDSearchByTel kapcsolattartoIdByTel(EntityManager manager, String tel) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("kapcsolattartoIdByTel",
				KapcsolattartoIDSearchByTel.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.registerStoredProcedureParameter("tel", String.class, ParameterMode.IN);
		procedureQuery.setParameter("tel", tel);
		procedureQuery.execute();
		KapcsolattartoIDSearchByTel firstrow = (KapcsolattartoIDSearchByTel) procedureQuery.getSingleResult();
		return firstrow;
	}

	public CegIDSearchByFNev cegIdByFNev(EntityManager manager, String fnev) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("cegIdByFNev",
				CegIDSearchByFNev.class);
		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.registerStoredProcedureParameter("fnev", String.class, ParameterMode.IN);
		procedureQuery.setParameter("fnev", fnev);
		procedureQuery.execute();
		CegIDSearchByFNev firstrow = (CegIDSearchByFNev) procedureQuery.getSingleResult();
		return firstrow;
	}

	public boolean insertOneletrajz(EntityManager manager, Long allaskid, byte[] oneletrajz) {

		try {

			StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("insertOneletrajz");

			procedureQuery.registerStoredProcedureParameter("allaskeresop", Long.class, ParameterMode.IN);
			procedureQuery.setParameter("allaskeresop", allaskid);

			procedureQuery.registerStoredProcedureParameter("oneletrajzp", byte[].class, ParameterMode.IN);
			procedureQuery.setParameter("oneletrajzp", oneletrajz);

			procedureQuery.execute();

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;

	}

	public boolean insertAllaskeresoSzakma(EntityManager manager, Long allaskid, Long szakmaid) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("insertAllaskeresoSzakma");

		procedureQuery.registerStoredProcedureParameter("allask_id", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("allask_id", allaskid);

		procedureQuery.registerStoredProcedureParameter("szakmaid", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("szakmaid", szakmaid);

		procedureQuery.execute();

		return true;

	}

	public boolean insertAllas(EntityManager manager, Long ceg_idp, Long varos_idp, Long szakma_idp, String munkakorp,
			String leirasp, Integer berp, Timestamp feladas_datumap) {

		try {

			StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("ujAllas");

			procedureQuery.registerStoredProcedureParameter("ceg_idp", Long.class, ParameterMode.IN);
			procedureQuery.setParameter("ceg_idp", ceg_idp);

			procedureQuery.registerStoredProcedureParameter("varos_idp", Long.class, ParameterMode.IN);
			procedureQuery.setParameter("varos_idp", varos_idp);

			procedureQuery.registerStoredProcedureParameter("szakma_idp", Long.class, ParameterMode.IN);
			procedureQuery.setParameter("szakma_idp", szakma_idp);

			procedureQuery.registerStoredProcedureParameter("munkakorp", String.class, ParameterMode.IN);
			procedureQuery.setParameter("munkakorp", munkakorp);

			procedureQuery.registerStoredProcedureParameter("leirasp", String.class, ParameterMode.IN);
			procedureQuery.setParameter("leirasp", leirasp);

			procedureQuery.registerStoredProcedureParameter("berp", Integer.class, ParameterMode.IN);
			procedureQuery.setParameter("berp", berp);

			procedureQuery.registerStoredProcedureParameter("feladas_datumap", Timestamp.class, ParameterMode.IN);
			procedureQuery.setParameter("feladas_datumap", feladas_datumap);

			procedureQuery.execute();

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

	public void AllaskBelepLog(EntityManager manager, String fnev, Timestamp new_date) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("allaskeresoLogUpdate");

		procedureQuery.registerStoredProcedureParameter("fnev", String.class, ParameterMode.IN);
		procedureQuery.registerStoredProcedureParameter("new_date", Timestamp.class, ParameterMode.IN);

		procedureQuery.setParameter("fnev", fnev);
		procedureQuery.setParameter("new_date", new_date);

		procedureQuery.execute();

	}

	public void AllaskAllastErtekel(EntityManager manager, Long allaskid, Long allasid, String szovegp, Integer ertekp,
			Timestamp datump) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("allasErtekeles");

		procedureQuery.registerStoredProcedureParameter("allaskid", Long.class, ParameterMode.IN);
		procedureQuery.registerStoredProcedureParameter("allasid", Long.class, ParameterMode.IN);
		procedureQuery.registerStoredProcedureParameter("szovegp", String.class, ParameterMode.IN);
		procedureQuery.registerStoredProcedureParameter("ertekp", Integer.class, ParameterMode.IN);
		procedureQuery.registerStoredProcedureParameter("datump", Timestamp.class, ParameterMode.IN);

		procedureQuery.setParameter("allaskid", allaskid);
		procedureQuery.setParameter("allasid", allasid);
		procedureQuery.setParameter("szovegp", szovegp);
		procedureQuery.setParameter("ertekp", ertekp);
		procedureQuery.setParameter("datump", datump);

		procedureQuery.execute();

	}

	public void AllaskeresoAdatmodositas(EntityManager manager, String fnev, String emailp, String jelszop, Long varosp,
			String utcap, String hazszamp, Long statuszp) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("allaskeresoAdatmodositas");

		procedureQuery.registerStoredProcedureParameter("fnev", String.class, ParameterMode.IN);
		procedureQuery.setParameter("fnev", fnev);

		procedureQuery.registerStoredProcedureParameter("emailp", String.class, ParameterMode.IN);
		procedureQuery.setParameter("emailp", emailp);

		procedureQuery.registerStoredProcedureParameter("jelszop", String.class, ParameterMode.IN);
		procedureQuery.setParameter("jelszop", jelszop);

		procedureQuery.registerStoredProcedureParameter("varosp", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("varosp", varosp);

		procedureQuery.registerStoredProcedureParameter("utcap", String.class, ParameterMode.IN);
		procedureQuery.setParameter("utcap", utcap);

		procedureQuery.registerStoredProcedureParameter("hazszamp", String.class, ParameterMode.IN);
		procedureQuery.setParameter("hazszamp", hazszamp);

		procedureQuery.registerStoredProcedureParameter("statuszp", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("statuszp", statuszp);

		procedureQuery.execute();

	}

	public void CegemAdatmodositas(EntityManager manager, String fnev, Long kapcsp, String nevp, String jelszop,
			Long varosp, String utcap, String hazszamp, String kapcsnev, String kapcsemail, String kapcstel) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("cegAdatmodositas");

		procedureQuery.registerStoredProcedureParameter("fnev", String.class, ParameterMode.IN);
		procedureQuery.setParameter("fnev", fnev);

		procedureQuery.registerStoredProcedureParameter("kapcsp", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("kapcsp", kapcsp);

		procedureQuery.registerStoredProcedureParameter("nevp", String.class, ParameterMode.IN);
		procedureQuery.setParameter("nevp", nevp);

		procedureQuery.registerStoredProcedureParameter("jelszop", String.class, ParameterMode.IN);
		procedureQuery.setParameter("jelszop", jelszop);

		procedureQuery.registerStoredProcedureParameter("varosp", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("varosp", varosp);

		procedureQuery.registerStoredProcedureParameter("utcap", String.class, ParameterMode.IN);
		procedureQuery.setParameter("utcap", utcap);

		procedureQuery.registerStoredProcedureParameter("hazszamp", String.class, ParameterMode.IN);
		procedureQuery.setParameter("hazszamp", hazszamp);

		procedureQuery.registerStoredProcedureParameter("kapcsnev", String.class, ParameterMode.IN);
		procedureQuery.setParameter("kapcsnev", kapcsnev);

		procedureQuery.registerStoredProcedureParameter("kapcsemail", String.class, ParameterMode.IN);
		procedureQuery.setParameter("kapcsemail", kapcsemail);

		procedureQuery.registerStoredProcedureParameter("kapcstel", String.class, ParameterMode.IN);
		procedureQuery.setParameter("kapcstel", kapcstel);

		procedureQuery.execute();

	}

	public void AllasJelentkezesem(EntityManager manager, Long allaskid, Long allasid, Timestamp datump) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("ujJelentkezes");

		procedureQuery.registerStoredProcedureParameter("allaskid", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("allaskid", allaskid);

		procedureQuery.registerStoredProcedureParameter("allasid", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("allasid", allasid);

		procedureQuery.registerStoredProcedureParameter("datump", Timestamp.class, ParameterMode.IN);
		procedureQuery.setParameter("datump", datump);

		procedureQuery.execute();

	}

	public void updateJelentkezesAllapot(EntityManager manager, Long allaskid, Long allasid, Long allapotid) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("updateJelentkezesAllapot");

		procedureQuery.registerStoredProcedureParameter("allaskid", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("allaskid", allaskid);

		procedureQuery.registerStoredProcedureParameter("allasid", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("allasid", allasid);

		procedureQuery.registerStoredProcedureParameter("allapotid", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("allapotid", allapotid);

		procedureQuery.execute();

	}

	public void allasKeresoErtekeles(EntityManager manager, Long allaskid, Long allasid, String ert, Timestamp datump) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("allasKeresoErtekeles");

		procedureQuery.registerStoredProcedureParameter("allaskid", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("allaskid", allaskid);

		procedureQuery.registerStoredProcedureParameter("allasid", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("allasid", allasid);

		procedureQuery.registerStoredProcedureParameter("ert", String.class, ParameterMode.IN);
		procedureQuery.setParameter("ert", ert);

		procedureQuery.registerStoredProcedureParameter("datump", Timestamp.class, ParameterMode.IN);
		procedureQuery.setParameter("datump", datump);

		procedureQuery.execute();

	}

	public Allapot searchAllapotIdbyName(EntityManager manager, String allapotp) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("searchAllapotIdbyName",
				Allapot.class);

		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);

		procedureQuery.registerStoredProcedureParameter("allapotp", String.class, ParameterMode.IN);
		procedureQuery.setParameter("allapotp", allapotp);

		procedureQuery.execute();

		Allapot firstrow = (Allapot) procedureQuery.getSingleResult();

		return firstrow;
	}

	public List<Allas30> listAllas30(EntityManager manager, String felh_nev) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listSzakmak30", Allas30.class);

		procedureQuery.registerStoredProcedureParameter("username", String.class, ParameterMode.IN);
		procedureQuery.setParameter("username", felh_nev);

		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();

		List<Allas30> allasok30 = procedureQuery.getResultList();
		return allasok30;
	}

	public Statusz statuszIdBynev(EntityManager manager, String snev) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("statuszIdBynev", Statusz.class);

		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);

		procedureQuery.registerStoredProcedureParameter("snev", String.class, ParameterMode.IN);
		procedureQuery.setParameter("snev", snev);

		procedureQuery.execute();

		Statusz firstrow = (Statusz) procedureQuery.getSingleResult();

		return firstrow;
	}

	public List<Allaskeresoert> listAKErtByUserId(EntityManager manager, Long allaskid) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listAKErtByUserId",
				Allaskeresoert.class);

		procedureQuery.registerStoredProcedureParameter("allaskid", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("allaskid", allaskid);

		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();

		List<Allaskeresoert> alkert = procedureQuery.getResultList();
		return alkert;
	}

	public List<Allasert> listAllasErtByCegId(EntityManager manager, Long cegid) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listAllasErtByCegId", Allasert.class);

		procedureQuery.registerStoredProcedureParameter("cegid", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("cegid", cegid);

		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();

		List<Allasert> allasert = procedureQuery.getResultList();
		return allasert;
	}

	public List<Jelentkezes> listJelentkezesekByCegId(EntityManager manager, Long cegid) {
		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("listJelentkezesekByCegId",
				Jelentkezes.class);

		procedureQuery.registerStoredProcedureParameter("cegid", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("cegid", cegid);

		procedureQuery.registerStoredProcedureParameter("ret", void.class, ParameterMode.REF_CURSOR);
		procedureQuery.execute();

		List<Jelentkezes> jel = procedureQuery.getResultList();
		return jel;
	}

	public List<MrBean> atlagFizetesSzakmankent(EntityManager manager) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("atlagFizetesSzakmankent",
				MrBean.class);

		procedureQuery.execute();

		List<MrBean> stat = procedureQuery.getResultList();
		return stat;
	}

	public List<MrBean> legkeresettebbSzakmak(EntityManager manager) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("legkeresettebbSzakmak", MrBean.class);

		procedureQuery.execute();

		List<MrBean> stat = procedureQuery.getResultList();
		return stat;
	}
	
	public List<MrBean> maxFizetesSzakmankent(EntityManager manager) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("maxFizetesSzakmankent", MrBean.class);

		procedureQuery.execute();

		List<MrBean> stat = procedureQuery.getResultList();
		return stat;
	}
	
	//amugy ez város
	public List<MrBean> allasokDarabszamOrszagonkent(EntityManager manager) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("allasokDarabszamOrszagonkent", MrBean.class);

		procedureQuery.execute();

		List<MrBean> stat = procedureQuery.getResultList();
		return stat;
	}
	
	public List<MrBean> allaskeresokDarabszamVarosonkent(EntityManager manager) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("allaskeresokDarabszamVarosonkent", MrBean.class);

		procedureQuery.execute();

		List<MrBean> stat = procedureQuery.getResultList();
		return stat;
	}
	
	public List<MrBean> cegekDarabszamaVarosonkent(EntityManager manager) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("allaskeresokDarabszamVarosonkent", MrBean.class);

		procedureQuery.execute();

		List<MrBean> stat = procedureQuery.getResultList();
		return stat;
	}
	
	public List<MrBean> allasjelentkezesekDarabszamAllapotokszerint(EntityManager manager) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("allasjelentkezesekDarabszamAllapotokszerint", MrBean.class);

		procedureQuery.execute();

		List<MrBean> stat = procedureQuery.getResultList();
		return stat;
	}
	
	public List<MrBean> allaskeresokDarabszamStatuszokszerint(EntityManager manager) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("allaskeresokDarabszamStatuszokszerint", MrBean.class);

		procedureQuery.execute();

		List<MrBean> stat = procedureQuery.getResultList();
		return stat;
	}
	
	public void deleteAllaskeresoert(EntityManager manager, Long allaskid, Long allasid) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("deleteAllaskeresoert");

		procedureQuery.registerStoredProcedureParameter("allaskeresoidp", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("allaskeresoidp", allaskid);

		procedureQuery.registerStoredProcedureParameter("allasidp", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("allasidp", allasid);
			
		

		procedureQuery.execute();
		
	}
	
	public void deleteAllasertekeles(EntityManager manager, Long idp) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("deleteAllasertekeles");

		procedureQuery.registerStoredProcedureParameter("idp", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("idp", idp);
			

		procedureQuery.execute();
		
	}
	
	public void updateStatusz(EntityManager manager, Long allaskid) {

		StoredProcedureQuery procedureQuery = manager.createStoredProcedureQuery("updateStatusz");

		procedureQuery.registerStoredProcedureParameter("allaskid", Long.class, ParameterMode.IN);
		procedureQuery.setParameter("allaskid", allaskid);
			

		procedureQuery.execute();
		
	}

}
