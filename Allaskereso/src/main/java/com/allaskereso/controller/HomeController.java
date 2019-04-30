package com.allaskereso.controller;



import java.io.IOException;
import java.sql.Timestamp;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("/userlogin.html")
	public String UserLogin() throws IOException {
		
		return "userlogin";
		
	}
	
	@RequestMapping("/registrationredirect.html")
	public String RegistrationRedirect() throws IOException {
		
		return "registrationredirect";
		
	}
	
	@RequestMapping("/userreg.html")
	public String UserReg(Model model) throws IOException {
		
		
		model.addAttribute("allaskereso", new Allaskeresoreg());
		return "userreg";
		
	}
	
	
	@RequestMapping("/companyreg.html")
	public String CompanyReg() throws IOException {
		
		return "companyreg";
		
	}
	
	@RequestMapping("/companylogin.html")
	public String CompanyLogin() throws IOException {
		
		return "companylogin";
		
	}
	
	@RequestMapping("/moderatorlogin.html")
	public String ModeratorLogin() throws IOException {
		
		return "moderatorlogin";
		
	}
	
	@PostMapping("/userreg")
	public String AllaskeresoReg(@ModelAttribute Allaskeresoreg allaskereso) {
		
		try {
		boolean succ=false;
		VarosIDSearch varosom = dao.varosIdByName(manager,allaskereso.getVaros());
		succ=dao.insertAllaskereso(manager,allaskereso.getNev(),allaskereso.getSzul_ido(),allaskereso.getEmail(),varosom.getId(),
			allaskereso.getUtca(),allaskereso.getHazszam(),allaskereso.getFelh_nev(),allaskereso.getJelszo(),new Timestamp(System.currentTimeMillis()));
			return "index";	
		}catch(Exception e) {
			
		}
		return "userreg";
			
	}
	
	
	
		
}
