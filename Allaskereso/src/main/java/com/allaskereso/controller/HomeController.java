package com.allaskereso.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Timestamp;
import java.util.*;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Context;
import org.apache.catalina.session.StandardManager;
import org.springframework.boot.web.embedded.tomcat.TomcatContextCustomizer;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;

import org.springframework.context.annotation.Bean;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;

import com.allaskereso.domain.*;
import com.allaskereso.services.DAO;

@Controller
public class HomeController {
	DAO dao = new DAO();

	@PersistenceContext
	private EntityManager manager;

	@RequestMapping("/")
	public String HomePage(HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		session.invalidate();
		return "index";

	}

	@RequestMapping("/index")
	public String HomePageIndex(HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		String valami = (String) session.getAttribute("felhnev");

		
		
		
		if (!valami.equals("null")) {

			return "loggedindex";
		}

		return "index";

	}

	@RequestMapping("/index.html")
	public String HomePageIndexHtml() throws IOException {

		
		return "index";

	}

	@RequestMapping("/loginredirect.html")
	public String LoginRedirect() throws IOException {

		return "loginredirect";

	}

	@RequestMapping("/registrationredirect.html")
	public String RegistrationRedirect() throws IOException {

		return "registrationredirect";

	}

	@RequestMapping("/userlogin.html")
	public String UserLogin(Model model) throws IOException {

		model.addAttribute("allaskereso", new AllaskeresoLogin());
		return "userlogin";

	}

	@RequestMapping("/userreg.html")
	public String UserReg(Model model) throws IOException {

		model.addAttribute("allaskereso", new Allaskeresoreg());
		return "userreg";

	}

	@RequestMapping("/companyreg.html")
	public String CompanyReg(Model model) throws IOException {

		model.addAttribute("ceg", new Cegreg());
		return "companyreg";

	}

	@RequestMapping("/companylogin.html")
	public String CompanyLogin(Model model) throws IOException {

		model.addAttribute("ceg", new CegLogin());
		return "companylogin";

	}

	@RequestMapping("/moderatorlogin.html")
	public String ModeratorLoginHtml(Model model, HttpServletRequest request) throws IOException {

		model.addAttribute("moderator", new ModeratorLogin());
		return "moderatorlogin";

	}

	@RequestMapping("/company.html")
	public String Allceg(Model model) throws IOException {

		List<Ceg> cegek = dao.listCegek(manager);
		model.addAttribute("cegek", cegek);
		return "company";

	}

	@RequestMapping("/allaskert.html")
	public String AllaskeresokertC(Model model) throws IOException {

		List<Allaskereso> allask = dao.listAllaskeresok(manager);
		model.addAttribute("allaskeresok", allask);
		return "allaskert";

	}
	
	@RequestMapping("/allaskeresoertdelete.html")
	public String Allaskeresodelete(Model model) throws IOException {

		List<Allaskereso> allask = dao.listAllaskeresok(manager);
		model.addAttribute("allaskeresok", allask);
		
		return "allaskeresoertdelete";

	}
	@RequestMapping("/allasertdeletem.html")
	public String Allasertdelete(Model model) throws IOException {

		List<Allas> allasok = dao.listAllasok(manager);
		model.addAttribute("allasok", allasok);
		
		return "allasertdeletem";

	}

	@RequestMapping("/allaslistam")
	public String MyAllasaim(Model model, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		String felhasznalo = (String) session.getAttribute("felhnev");

		List<Allas30> allasok = new ArrayList<>();
		allasok = dao.listAllas30(manager, felhasznalo);

		model.addAttribute("allasok", allasok);

		return "allaslistam";

	}
	@RequestMapping("/listakert")
	public String ListAllaskert(Model model, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		String felhasznalo = (String) session.getAttribute("felhnev");

		Allaskereso ak = dao.listAllaskeresokByFnev(manager,felhasznalo);
		
		List<Allaskeresoert> ert = new ArrayList<>();
		ert = dao.listAKErtByUserId(manager, ak.getId());

		model.addAttribute("ert", ert);

		return "allaskert";

	}
	@RequestMapping("/listallert")
	public String ListAllert(Model model, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		String felhasznalo = (String) session.getAttribute("cegfelhnev");

		Ceg ak = dao.listCegByFnev(manager,felhasznalo);
		
		List<Allasert> ert = new ArrayList<>();
		ert = dao.listAllasErtByCegId(manager, ak.getId());

		model.addAttribute("ert", ert);

		return "allasokertekel";

	}
	@RequestMapping("/lisjel")
	public String listJel(Model model, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		String felhasznalo = (String) session.getAttribute("cegfelhnev");

		Ceg ak = dao.listCegByFnev(manager,felhasznalo);
		
		List<Jelentkezes> jel = new ArrayList<>();
		jel = dao.listJelentkezesekByCegId(manager, ak.getId());

		model.addAttribute("jel", jel);

		return "jel";

	}

	@RequestMapping("/jobs.html")
	public String JobsHtml(Model model, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		String valami = (String) session.getAttribute("felhnev");

		// System.out.println(valami);
		// session.invalidate(); Destroy the session.
		return "jobs";

	}

	@RequestMapping("/adatmodositasak.html")
	public String AllaskAdatok(Model model, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		String felhasznalo = (String) session.getAttribute("felhnev");

		// atkuldes
		Allaskereso kereso = dao.listAllaskeresokByFnev(manager, felhasznalo);
		model.addAttribute("allaskereso", kereso);

		model.addAttribute("adataim", new AllaskadatMod());

		return "adatmodositasak";

	}

	@RequestMapping("/loggedindex.html")
	public String LoggedAk(Model model, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		String felhasznalo = "";

		try {

			felhasznalo = (String) session.getAttribute("felhnev");

			// System.out.println(felhasznalo);

			if (felhasznalo.equals("null")) {

				// ceg lehet hogy be van lépve, de önéletrajzot ő nem igen ad fel
				session.invalidate();

				return "alertloginplease";
			}

		} catch (NullPointerException e) {

			return "alertloginplease";

		}

		return "loggedindex";

	}

	@RequestMapping("/loggedindexcompany.html")
	public String LoggedCompany(Model model, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		String felhasznalo = "";

		try {

			felhasznalo = (String) session.getAttribute("cegfelhnev");

			// System.out.println(felhasznalo);

			if (felhasznalo.equals("null")) {

				session.invalidate();

				return "alertloginpleasecompany";
			}

		} catch (NullPointerException e) {

			return "alertloginpleasecompany";

		}

		return "loggedindexcompany";

	}

	@RequestMapping("/alertsucclogout.html")
	public String LogoutAk(Model model, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		session.invalidate();

		return "alertsucclogout";

	}

	@RequestMapping("/upload.html")
	public String UserUpload(Model model, HttpServletRequest request) throws IOException {

		model.addAttribute("obj", new SzakmaOneletrajzUp());

		HttpSession session = request.getSession();

		try {
			String felhasznalo = (String) session.getAttribute("felhnev");

			// System.out.println(felhasznalo);

			if (felhasznalo.equals("null")) {

				// ceg lehet hogy be van lépve, de önéletrajzot ő nem igen ad fel
				session.invalidate();

				return "alertloginplease";
			}
		} catch (NullPointerException e) {

			return "alertloginplease";

		}

		return "upload";

	}

	@RequestMapping("/moderatorlogin")
	public String ModeratorLogin(Model model) throws IOException {

		model.addAttribute("moderator", new ModeratorLogin());
		return "moderatorlogin";

	}

	@RequestMapping("/cegadatmodositas.html")
	public String CegadatModositas(Model model) throws IOException {

		model.addAttribute("ceg", new CegModosit());
		return "cegadatmodositas";

	}

	@RequestMapping("/allasfeladas.html")
	public String AllasFeladas(Model model, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		model.addAttribute("obj", new AllasUp());

		try {
			String felhasznalo = (String) session.getAttribute("cegfelhnev");

			// System.out.println(felhasznalo);

			if (felhasznalo.equals("null")) {

				// álláskereső nem ad fel állást
				session.invalidate();

				return "alertlogincompanyplease";
			}
		} catch (NullPointerException e) {

			return "alertlogincompanyplease";

		}

		return "allasfeladas";

	}

	@RequestMapping("/allaslista.html")
	public String MyAllas(Model model, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		String felhasznalo = (String) session.getAttribute("felhnev");
		List<Allas> allasok = new ArrayList<>();
		List<Allas> allasokki = new ArrayList<>();
		Allaskereso kereso = dao.listAllaskeresokByFnev(manager, felhasznalo);
		List<Allaskeresoszakma> szakmaidk = kereso.getAllaskeresoszakmak();

		for (Allaskeresoszakma i : szakmaidk) {
			allasok.addAll(dao.listAllasBySzakmaID(manager, i.getSzakma().getId()));
		}

		for (Allas a : allasok) {
			Timestamp first = new Timestamp(System.currentTimeMillis());
			Timestamp second = a.getFeladas_datuma();

			long milliseconds = first.getTime() - second.getTime();

			long seconds = milliseconds / 1000;

			long hours = seconds / 3600;
			long days = hours / 24;

			int c_days = (int) days;

			if (c_days <= 30) {
				allasokki.add(a);
			}

		}
		// allasokki = dao.listAllasok(manager);
		model.addAttribute("allasok", allasokki);
		model.addAttribute("allasid", new AllasId());
		model.addAttribute("ertkm", new AllaskeresoErtekeles());

		return "allaslista";

	}

	@RequestMapping("/allasokertekel.html")
	public String Allasokertekelesre(Model model, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		String felhasznalo = (String) session.getAttribute("felhnev");
		List<Allas> allasok = dao.listAllasok(manager);

		model.addAttribute("allasok", allasok);

		return "allasokertekel";

	}

	@RequestMapping("/jelentkezettek.html")
	public String JelentkezettekList(Model model, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		String felhasznalo = (String) session.getAttribute("cegfelhnev");
		List<Jelentkezes> jelentkezesek = dao.listJelentkezesek(manager);

		List<Jelentkezes> jel = new ArrayList<>();

		for (Jelentkezes j : jelentkezesek) {

			String ceg1 = j.getAllas().getCeg().getFelh_nev();
			if (ceg1.equals(felhasznalo)) {
				jel.add(j);
			}
			;
		}

		model.addAttribute("jelentkezettek", jel);
		model.addAttribute("allapot", new StatuszModCeg());
		model.addAttribute("ertek", new CegaltalErtekelt());

		return "jelentkezettek";

	}

	@RequestMapping("/alljelentkezeseim.html")
	public String JelentkezesekAllasok(Model model, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		String felhasznalo = (String) session.getAttribute("felhnev");
		List<Jelentkezes> jelentkezesek = dao.listJelentkezesek(manager);

		List<Jelentkezes> jel = new ArrayList<>();

		for (Jelentkezes j : jelentkezesek) {

			String ember = j.getAllaskereso().getFelh_nev();
			if (ember.equals(felhasznalo)) {
				jel.add(j);
			}
			;
		}

		model.addAttribute("jelentkezettek", jel);

		return "alljelentkezeseim";

	}
	@RequestMapping("/moderatorindex.html")
	public String Modindx(Model model, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		
		
		try {
			String felhasznalo = (String) session.getAttribute("modfelhnev");

			

			if (felhasznalo.equals("null")) {

				
				session.invalidate();

				return "alerttiltott";
			}
		} catch (NullPointerException e) {

			return "alerttiltott";

		}
		

		return "moderatorindex";

	}

	@PostMapping("/userreg")
	public String AllaskeresoReg(@ModelAttribute Allaskeresoreg allaskereso, Model model, BindingResult bindingResult) {

		try {
			model.addAttribute("allaskereso", allaskereso);
			if (bindingResult.hasErrors()) {
				return "userreg";
			}
			boolean succ = false;
			boolean uniqueFelhNev = false;
			boolean uniqueEmail = false;
			VarosIDSearch varosom = dao.varosIdByName(manager, allaskereso.getVaros());
			try {
				AllaskeresoIDSearchByFNev unique_felh_nev = dao.allaskeresoIdByFNev(manager, allaskereso.getFelh_nev());
			} catch (javax.persistence.NoResultException ex) {
				uniqueFelhNev = true;
			}
			if (!uniqueFelhNev) {
				return "alertuserregnotuniqueusername";
			}

			try {
				AllaskeresoIDSearchByEmail unique_email = dao.allaskeresoIdByEmail(manager, allaskereso.getEmail());
			} catch (javax.persistence.NoResultException ex) {
				uniqueEmail = true;
			}
			if (!uniqueEmail) {
				return "alertuserregnotuniqueemail";
			}
			succ = dao.insertAllaskereso(manager, allaskereso.getNev(), allaskereso.getSzul_ido(),
					allaskereso.getEmail(), varosom.getId(), allaskereso.getUtca(), allaskereso.getHazszam(),
					allaskereso.getFelh_nev(), allaskereso.getJelszo(), new Timestamp(System.currentTimeMillis()));
			if (succ) {
				return "alertuserregsuccess";
			} else {
				return "userreg";
			}
		} catch (javax.persistence.NoResultException ex) {

			return "alertuserreginvalidtown";
		}

	}

	@PostMapping("/cegreg")
	public String CegReg(@ModelAttribute Cegreg ceg, Model model) {

		try {
			model.addAttribute("ceg", ceg);
			boolean succ = false;
			boolean uniqueFelhNev = false;
			boolean uniqueKapcsTel = false;
			boolean uniqueKapcsEmail = false;
			VarosIDSearch varosom = dao.varosIdByName(manager, ceg.getVaros());
			try {
				CegIDSearchByFNev uniqueTest = dao.cegIdByFNev(manager, ceg.getFelh_nev());
			} catch (javax.persistence.NoResultException ex) {
				uniqueFelhNev = true;
			}
			if (!uniqueFelhNev) {
				return "alertuserregnotuniqueusername";
			}
			try {
				KapcsolattartoIDSearchByEmail uniqueTest = dao.kapcsolattartoIdByEmail(manager, ceg.getKapcs_email());
			} catch (javax.persistence.NoResultException ex) {
				uniqueKapcsEmail = true;
			}
			if (!uniqueKapcsEmail) {
				return "alertcegregnotuniqueemail";
			}
			try {
				KapcsolattartoIDSearchByTel uniqueTest = dao.kapcsolattartoIdByTel(manager, ceg.getKapcs_tel());
			} catch (javax.persistence.NoResultException ex) {
				uniqueKapcsTel = true;
			}
			if (!uniqueKapcsTel) {
				return "alertcegregnotuniquetel";
			}
			succ = dao.insertCeg(manager, ceg.getNev(), varosom.getId(), ceg.getUtca(), ceg.getHazszam(),
					ceg.getFelh_nev(), ceg.getJelszo(), ceg.getKapcs_nev(), ceg.getKapcs_tel(), ceg.getKapcs_email());

			if (succ) {
				return "alertcompanyregsuccess";
			} else {
				return "cegreg";
			}
		} catch (javax.persistence.NoResultException ex) {

			return "alertuserreginvalidtown";
		}
	}

	@PostMapping("/userlogin")
	public String UserLogin(@ModelAttribute AllaskeresoLogin allaskereso, Model model, HttpServletRequest request) {

		try {
			model.addAttribute("allaskereso", allaskereso);
			AllaskeresoLogin login = dao.allaskeresoLogin(manager, allaskereso.getFelh_nev());
			if (login.getFelh_nev().equals(allaskereso.getFelh_nev())
					&& login.getJelszo().equals(allaskereso.getJelszo())) {

				HttpSession session = request.getSession();
				session.setAttribute("felhnev", allaskereso.getFelh_nev());

				String felhasznalo = (String) session.getAttribute("felhnev");

				dao.AllaskBelepLog(manager, felhasznalo, new Timestamp(System.currentTimeMillis()));

				return "loggedindex";
			} else {

				return "alertuserlogin";

			}
		} catch (Exception e) {
			return "alertuserlogin";
		}

	}

	@PostMapping("/companylogin")
	public String CompanyLogin(@ModelAttribute CegLogin ceg, Model model, HttpServletRequest request) {

		try {
			model.addAttribute("ceg", ceg);
			CegLogin login = dao.cegLogin(manager, ceg.getFelh_nev());
			if (login.getFelh_nev().equals(ceg.getFelh_nev()) && login.getJelszo().equals(ceg.getJelszo())) {

				HttpSession session = request.getSession();
				session.setAttribute("cegfelhnev", ceg.getFelh_nev());

				return "loggedindexcompany";
			} else {

				return "alertcompanylogin";

			}
		} catch (Exception e) {
			return "alertcompanylogin";
		}
	}

	@PostMapping("/moderatorlogin1")
	public String ModeratorLogin(@ModelAttribute ModeratorLogin moderator, Model model, HttpServletRequest request) {

		try {
			model.addAttribute("moderator", moderator);
			ModeratorLogin login = dao.moderatorLogin(manager, moderator.getFelh_nev());
			if (login.getFelh_nev().equals(moderator.getFelh_nev())
					&& login.getJelszo().equals(moderator.getJelszo())) {
				
					HttpSession session = request.getSession();
					session.setAttribute("modfelhnev", moderator.getFelh_nev());

				return "moderatorindex";
			} else {

				return "alertmoderatorlogin";

			}
		} catch (Exception e) {
			return "alertmoderatorlogin";
		}
	}

	@PostMapping("/fileupload")
	public String UploadSzakmaOneletrajz(@ModelAttribute SzakmaOneletrajzUp obj, Model model,
			HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();

		String felhasznalo = (String) session.getAttribute("felhnev");

		AllaskeresoIDSearchByFNev kereso = dao.allaskeresoIdByFNev(manager, felhasznalo);

		boolean succ = false;
		boolean succ2 = false;

		String res = "";

		model.addAttribute("obj", obj);

		// System.out.println(obj.getOneletrajz());

		if (!obj.getOneletrajz().equals("")) {

			try {
				byte[] array = dao.convertFileContentToBlob(obj.getOneletrajz());
				succ = dao.insertOneletrajz(manager, kereso.getId(), array);
			} catch (FileNotFoundException e) {
				return "alertnotfound";
			}

		}
		if (!obj.getMegnevezes().equals("")) {
			try {
				SzakmaSearch szakma = dao.szakmaIdByName(manager, obj.getMegnevezes());
			} catch (javax.persistence.NoResultException ex) {
				dao.insertSzakma(manager, obj.getMegnevezes());
			}

			SzakmaSearch szakma = dao.szakmaIdByName(manager, obj.getMegnevezes());
			succ2 = dao.insertAllaskeresoSzakma(manager, kereso.getId(), szakma.getId());

		}

		if (succ || succ2) {
			res = "alertsuccupload";
		} else {
			res = "alertsuccnotupload";
		}

		return res;

	}

	@PostMapping("/allasfelad")
	public String AllasFelad(@ModelAttribute AllasUp allasup, Model model, HttpServletRequest request) {

		String res = "";
		VarosIDSearch varosom;
		SzakmaSearch szakma;

		HttpSession session = request.getSession();
		String felhasznalo = (String) session.getAttribute("cegfelhnev");

		// System.out.println(felhasznalo);

		model.addAttribute("obj", allasup);

		CegIDSearchByFNev ceg = dao.cegIdByFNev(manager, felhasznalo);

		try {
			varosom = dao.varosIdByName(manager, allasup.getVaros());
		} catch (javax.persistence.NoResultException ex) {

			return "alertuserreginvalidtown";
		}

		try {
			szakma = dao.szakmaIdByName(manager, allasup.getSzakma());
		} catch (javax.persistence.NoResultException ex) {
			dao.insertSzakma(manager, allasup.getSzakma());
			szakma = dao.szakmaIdByName(manager, allasup.getSzakma());
		}

		// EntityManager manager, Long ceg_idp, Long varos_idp, Long szakma_idp, String
		// munkakorp,
		// String leirasp, Integer berp, Timestamp feladas_datumap
		try {
			dao.insertAllas(manager, ceg.getId(), varosom.getId(), szakma.getId(), allasup.getMunkakor(),
					allasup.getLeiras(), allasup.getBer(), new Timestamp(System.currentTimeMillis()));
			res = "alertallasfeladva";
		} catch (Exception e) {

		}
		;

		return res;
	}

	@PostMapping("/adatmodositas")
	public String Adatmodosit(@ModelAttribute AllaskadatMod adataim, Model model, HttpServletRequest request) {

		String res = "";
		VarosIDSearch varosom;
		Statusz statuszkeres;
		boolean succ = false;

		HttpSession session = request.getSession();
		String felhasznalo = (String) session.getAttribute("felhnev");

		Allaskereso kereso = dao.listAllaskeresokByFnev(manager, felhasznalo);

		model.addAttribute("adataim", adataim);

		String email = adataim.getEmail();
		String jelszo = adataim.getJelszo();
		String varos = adataim.getVaros();
		String utca = adataim.getUtca();
		String hazszam = adataim.getHazszam();
		String statusz = adataim.getStatusz();

		if (jelszo.equals("")) {
			jelszo = kereso.getJelszo();
		}

		if (varos.equals("")) {
			varos = kereso.getVaros().getNev();
		}

		if (utca.equals("")) {
			utca = kereso.getUtca();
		}

		if (hazszam.equals("")) {
			hazszam = kereso.getHazszam();
		}

		if (statusz.equals("")) {
			statusz = kereso.getStatusz().getMegnevezes();
		}

		try {
			varosom = dao.varosIdByName(manager, varos);
		} catch (javax.persistence.NoResultException ex) {

			return "alertuserreginvalidtown";
		}

		try {

			AllaskeresoIDSearchByEmail unique_email = dao.allaskeresoIdByEmail(manager, email);

		} catch (javax.persistence.NoResultException ex) {
			succ = true;

		}
		if (!succ) {
			return "alertuserregnotuniqueemail";
		}

		if (email.equals("")) {
			email = kereso.getEmail();
		}

		try {
			statuszkeres = dao.statuszIdBynev(manager, statusz);

		} catch (javax.persistence.NoResultException ex) {

			return "alertnotuniquestatusz";
		}

		dao.AllaskeresoAdatmodositas(manager, felhasznalo, email, jelszo, varosom.getId(), utca, hazszam,
				statuszkeres.getId());

		return "alertsuccadatmod";
	}

	@PostMapping("/cegadatmodositas")
	public String AdatmodositCegP(@ModelAttribute CegModosit adataim, Model model, HttpServletRequest request) {

		String res = "";
		VarosIDSearch varosom;

		boolean succ = false;

		HttpSession session = request.getSession();
		String felhasznalo = (String) session.getAttribute("cegfelhnev");

		Ceg kereso = dao.listCegByFnev(manager, felhasznalo);

		model.addAttribute("ceg", adataim);

		String jelszo = adataim.getJelszo();
		String varos = adataim.getVaros();
		String utca = adataim.getUtca();
		String hazszam = adataim.getHazszam();
		String kapcs_email = adataim.getKapcs_email();
		String nev = adataim.getNev();
		String kapcs_nev = adataim.getKapcs_nev();
		String kapcs_tel = adataim.getKapcs_tel();

		if (jelszo.equals("")) {
			jelszo = kereso.getJelszo();
		}

		if (varos.equals("")) {
			varos = kereso.getVaros().getNev();
		}

		if (utca.equals("")) {
			utca = kereso.getUtca();
		}

		if (hazszam.equals("")) {
			hazszam = kereso.getHazszam();
		}

		if (nev.equals("")) {
			nev = kereso.getNev();
		}

		if (kapcs_nev.equals("")) {
			kapcs_nev = kereso.getKapcsolattarto().getNev();
		}

		if (kapcs_tel.equals("")) {
			kapcs_tel = kereso.getKapcsolattarto().getTelefonszam();
		}

		try {
			varosom = dao.varosIdByName(manager, varos);
		} catch (javax.persistence.NoResultException ex) {

			return "alertuserreginvalidtown";
		}

		try {

			KapcsolattartoIDSearchByEmail unique_email = dao.kapcsolattartoIdByEmail(manager, kapcs_email);

		} catch (javax.persistence.NoResultException ex) {
			succ = true;

		}
		if (kapcs_email.equals("")) {
			kapcs_email = kereso.getKapcsolattarto().getEmail();
		}
		if (!succ) {
			return "alertcegregnotuniqueemail";
		}

		dao.CegemAdatmodositas(manager, felhasznalo, kereso.getKapcsolattarto().getId(), nev, jelszo, varosom.getId(),
				utca, hazszam, kapcs_nev, kapcs_email, kapcs_tel);

		return "alertsuccadatmodceg";
	}

	@PostMapping("/jelentkezes")
	public String AllasJelentkezes(@ModelAttribute AllasId allasid, Model model, HttpServletRequest request) {

		String res = "";

		HttpSession session = request.getSession();
		String felhasznalo = (String) session.getAttribute("felhnev");

		Allaskereso kereso = dao.listAllaskeresokByFnev(manager, felhasznalo);

		model.addAttribute("allasid", allasid);

		Long felhid = kereso.getId();

		try {
			dao.AllasJelentkezesem(manager, felhid, allasid.getId(), new Timestamp(System.currentTimeMillis()));
		} catch (Exception e) {
			return "alertjelentkeztelmar";
		}

		return "succjel";
	}

	@PostMapping("/allaskertekelesm")
	public String Allaskeresoertekel(@ModelAttribute AllaskeresoErtekeles ertekeles, Model model,
			HttpServletRequest request) {

		String res = "";

		HttpSession session = request.getSession();
		String felhasznalo = (String) session.getAttribute("felhnev");

		List<Allas> allasok = new ArrayList<>();
		List<Allas> allasokki = new ArrayList<>();
		Allaskereso kereso = dao.listAllaskeresokByFnev(manager, felhasznalo);
		List<Allaskeresoszakma> szakmaidk = kereso.getAllaskeresoszakmak();

		for (Allaskeresoszakma i : szakmaidk) {
			allasok.addAll(dao.listAllasBySzakmaID(manager, i.getSzakma().getId()));
		}

		for (Allas a : allasok) {
			Timestamp first = new Timestamp(System.currentTimeMillis());
			Timestamp second = a.getFeladas_datuma();

			long milliseconds = first.getTime() - second.getTime();

			long seconds = milliseconds / 1000;

			long hours = seconds / 3600;
			long days = hours / 24;

			int c_days = (int) days;

			if (c_days <= 30) {
				allasokki.add(a);
			}

		}

		List<Long> idk = new ArrayList<>();

		for (Allas a : allasokki) {
			idk.add(a.getId());

		}

		model.addAttribute("ertkm", ertekeles);

		Long allaskid = kereso.getId();
		Long allasid = ertekeles.getAllasid();
		String szoveg = ertekeles.getSzovegp();
		Integer ertek = ertekeles.getErtekp();

		boolean match = false;

		for (Long i : idk) {
			if (allasid.equals(i)) {
				match = true;
			}

		}

		if (!match) {
			return "alertfakeid";
		}

		dao.AllaskAllastErtekel(manager, allaskid, allasid, szoveg, ertek, new Timestamp(System.currentTimeMillis()));

		return "succallaskeresoertekel";
	}

	@PostMapping("/cegertekelem")
	public String CegertekelAllaskt(@ModelAttribute CegaltalErtekelt ertekeles, Model model,
			HttpServletRequest request) {

		String res = "";

		HttpSession session = request.getSession();
		String felhasznalo = (String) session.getAttribute("cegfelhnev");

		model.addAttribute("ertek", ertekeles);
		
		Long allaskid = ertekeles.getAllaskid();
		Long allasid = ertekeles.getAllasid();
		String ert = ertekeles.getErtekeles();
		
		List<Jelentkezes> jelentkezesek = dao.listJelentkezesek(manager);
		List<Jelentkezes> jel = new ArrayList<>();

		for (Jelentkezes j : jelentkezesek) {

			String ceg1 = j.getAllas().getCeg().getFelh_nev();
			if (ceg1.equals(felhasznalo)) {
				jel.add(j);
			}
			;
		}

		List<Long> allasID = new ArrayList<>();
		List<Long> allkerID = new ArrayList<>();

		for (Jelentkezes j : jel) {

			allasID.add(j.getAllas().getId());
			allkerID.add(j.getAllaskereso().getId());
		}
		
		boolean succAllasID = false;
		boolean succAllkerID = false;
		
		for (Long j : allasID) {

			if(j.equals(allasid)) {
				succAllasID = true;
			}
			
			
		}
		for (Long j : allkerID) {

			if(j.equals(allaskid)) {
				succAllkerID = true;
			}
			
			
		}
		
		if(!succAllasID) {
			return "alertfakeallasid";
		}
		if(!succAllkerID) {
			return "alertfakeallkerid";
		}
		
		try {
			dao.allasKeresoErtekeles(manager,allaskid,allasid,ert,new Timestamp(System.currentTimeMillis()));
		}
		catch(Exception e){
			
				return "alertmarertekelt";
			
		}
		
		return "succcegertekelt";
	}

	@PostMapping("/cegstatuszm")
	public String CegStatuszModosit(@ModelAttribute StatuszModCeg allapot, Model model, HttpServletRequest request) {

		String res = "";
		Allapot all = new Allapot();

		HttpSession session = request.getSession();
		String felhasznalo = (String) session.getAttribute("cegfelhnev");

		model.addAttribute("allapot", allapot);

		Long allaskid = allapot.getAllaskid();
		Long allasid = allapot.getAllasid();
		String allapotn = allapot.getAllapotn();

		
		List<Jelentkezes> jelentkezesek = dao.listJelentkezesek(manager);
		List<Jelentkezes> jel = new ArrayList<>();

		for (Jelentkezes j : jelentkezesek) {

			String ceg1 = j.getAllas().getCeg().getFelh_nev();
			if (ceg1.equals(felhasznalo)) {
				jel.add(j);
			}
			;
		}

		List<Long> allasID = new ArrayList<>();
		List<Long> allkerID = new ArrayList<>();

		for (Jelentkezes j : jel) {

			allasID.add(j.getAllas().getId());
			allkerID.add(j.getAllaskereso().getId());
		}
		
		boolean succAllasID = false;
		boolean succAllkerID = false;
		
		for (Long j : allasID) {

			if(j.equals(allasid)) {
				succAllasID = true;
			}
			
			
		}
		for (Long j : allkerID) {

			if(j.equals(allaskid)) {
				succAllkerID = true;
			}
			
			
		}
		
		if(!succAllasID) {
			return "alertfakeallasid";
		}
		if(!succAllkerID) {
			return "alertfakeallkerid";
		}
		

		try {
			all = dao.searchAllapotIdbyName(manager, allapotn);
		} catch (Exception e) {
			return "alertinvalidallapot";
		}
		
		
		dao.updateJelentkezesAllapot(manager,allaskid,allasid,all.getId());
		
		
			
		
		
		return "succstatuszmod";
	}

}
