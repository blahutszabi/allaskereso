package com.allaskereso.controller;



import java.io.IOException;
import java.sql.Timestamp;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String HomePage() throws IOException {
		
		return "index";
		
	}
	
	@RequestMapping("/index")
	public String HomePageIndex() throws IOException {
		
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
	public String ModeratorLoginHtml(Model model) throws IOException {
		
		
		model.addAttribute("moderator", new ModeratorLogin());
		return "moderatorlogin";
		
	}
	
	@RequestMapping("/moderatorlogin")
	public String ModeratorLogin(Model model) throws IOException {
		
		
		model.addAttribute("moderator", new ModeratorLogin());
		return "moderatorlogin";
		
	}
	
	@PostMapping("/userreg")
	public String AllaskeresoReg(@ModelAttribute Allaskeresoreg allaskereso,Model model, BindingResult bindingResult){
		
		try {
			model.addAttribute("allaskereso",allaskereso);
			if (bindingResult.hasErrors()) {
				return "userreg";
			}
			boolean succ=false;
			boolean uniqueFelhNev=false;
			boolean uniqueEmail=false;
			VarosIDSearch varosom = dao.varosIdByName(manager,allaskereso.getVaros());
				try {
					AllaskeresoIDSearchByFNev unique_felh_nev=dao.allaskeresoIdByFNev(manager, allaskereso.getFelh_nev());
				}catch(javax.persistence.NoResultException ex) {
					uniqueFelhNev=true;
				}
				if(!uniqueFelhNev) {
					return "alertuserregnotuniqueusername";
				}
				
				
				try {
					AllaskeresoIDSearchByEmail unique_email=dao.allaskeresoIdByEmail(manager, allaskereso.getEmail());
				}catch(javax.persistence.NoResultException ex) {
					uniqueEmail=true;
				}
				if(!uniqueEmail) {
					return "alertuserregnotuniqueemail";
				}
			succ=dao.insertAllaskereso(manager,allaskereso.getNev(),allaskereso.getSzul_ido(),allaskereso.getEmail(),varosom.getId(),
				allaskereso.getUtca(),allaskereso.getHazszam(),allaskereso.getFelh_nev(),allaskereso.getJelszo(),new Timestamp(System.currentTimeMillis()));
			if(succ) {
				return "alertuserregsuccess";	
			} else {
				return "userreg";
			}
		}catch(javax.persistence.NoResultException ex) {
			
			return "alertuserreginvalidtown";
		}
		
		
		
			
	}

	
	@PostMapping("/cegreg")
	public String CegReg(@ModelAttribute Cegreg ceg, Model model) {
		
		try {
		model.addAttribute("ceg", ceg);
		boolean succ=false;
		boolean uniqueFelhNev=false;
		boolean uniqueKapcsTel=false;
		boolean uniqueKapcsEmail=false;
		VarosIDSearch varosom = dao.varosIdByName(manager,ceg.getVaros());
		try {
			CegIDSearchByFNev uniqueTest=dao.cegIdByFNev(manager, ceg.getFelh_nev());
		}catch(javax.persistence.NoResultException ex) {
			uniqueFelhNev=true;
		}
		if(!uniqueFelhNev) {
			return "alertuserregnotuniqueusername";
		}
		try {
			KapcsolattartoIDSearchByEmail uniqueTest=dao.kapcsolattartoIdByEmail(manager, ceg.getKapcs_email());
		}catch(javax.persistence.NoResultException ex) {
			uniqueKapcsEmail=true;
		}
		if(!uniqueKapcsEmail) {
			return "alertcegregnotuniqueemail";
		}
		try {
			KapcsolattartoIDSearchByTel uniqueTest=dao.kapcsolattartoIdByTel(manager, ceg.getKapcs_tel());
		}catch(javax.persistence.NoResultException ex) {
			uniqueKapcsTel=true;
		}
		if(!uniqueKapcsTel) {
			return "alertcegregnotuniquetel";
		}
		succ=dao.insertCeg(manager,ceg.getNev(),varosom.getId(),
			ceg.getUtca(),ceg.getHazszam(),ceg.getFelh_nev(),ceg.getJelszo(),ceg.getKapcs_nev(),ceg.getKapcs_tel(),ceg.getKapcs_email());
		
		if(succ) {
			return "alertuserregsuccess";	
		} else {
			return "cegreg";
		}
		} catch(javax.persistence.NoResultException ex) {
			
			return "alertuserreginvalidtown";
		}
	}
	
	@PostMapping("/userlogin")
	public String UserLogin(@ModelAttribute AllaskeresoLogin allaskereso, Model model) {

		try {
		model.addAttribute("allaskereso", allaskereso);
		AllaskeresoLogin login = dao.allaskeresoLogin(manager, allaskereso.getFelh_nev());
		if(login.getFelh_nev().equals(allaskereso.getFelh_nev()) && login.getJelszo().equals(allaskereso.getJelszo())) {
			
				return "index";	
			} else {
					
		
				return "alertuserlogin";
				
			}
		}catch(Exception e) {
			return "alertuserlogin";
		}
				
	}
	
	@PostMapping("/companylogin")
	public String CompanyLogin(@ModelAttribute CegLogin ceg, Model model) {

		try {
		model.addAttribute("ceg", ceg);
		CegLogin login = dao.cegLogin(manager, ceg.getFelh_nev());
		if(login.getFelh_nev().equals(ceg.getFelh_nev()) && login.getJelszo().equals(ceg.getJelszo())) {
			
				return "index";	
			} else {
				
				return "alertcompanylogin";
				
			}
		}catch(Exception e) {
			return "alertcompanylogin";
		}
	}
	
	@PostMapping("/moderatorlogin")
	public String ModeratorLogin(@ModelAttribute ModeratorLogin moderator, Model model) {

		try {
		model.addAttribute("moderator", moderator);
		ModeratorLogin login = dao.moderatorLogin(manager, moderator.getFelh_nev());
		if(login.getFelh_nev().equals(moderator.getFelh_nev()) && login.getJelszo().equals(moderator.getJelszo())) {
			
				return "index";	
			} else {
				
				return "alertmoderatorlogin";
				
			}
		}catch(Exception e) {
			return "alertmoderatorlogin";
		}
	}
	
	
	
		
}
