package com.allaskereso.controller;



import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

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
	Allaskeresoreg regi=new Allaskeresoreg();
	
	@PersistenceContext
    private EntityManager manager;
	
	

	@RequestMapping("/")
	public String HomePageD() throws IOException {
		
		
		return "index";
		
	}
	
	@RequestMapping("/index.html")
	public String HomePage1() throws IOException {
		
		
		
		return "index";
		
	}
	@RequestMapping("/login.html")
	public String Login(Model model) throws IOException {
		
		model.addAttribute("allaskereso", regi);
		
		return "login";
		
	}
	
	
	
	@PostMapping("/reg")
	public String AllaskeresoReg(@ModelAttribute Allaskeresoreg allaskereso) {
		
		VarosIDSearch varosom = dao.varosIdByName(manager,allaskereso.getVaros());
		
		dao.insertAllaskereso(manager,allaskereso.getNev(),allaskereso.getSzul_ido(),allaskereso.getEmail(),varosom.getId(),
				allaskereso.getUtca(),allaskereso.getHazszam(),allaskereso.getFelh_nev(),allaskereso.getJelszo(),new Timestamp(System.currentTimeMillis()));
		
		System.out.println("Kész");
		
		return "index";
	}
	
	
	
	@RequestMapping("/jobs.html")
	public String JobsPage(Model model) throws IOException {
		
		
		
		
		return "jobs";
		
	}
	
		
}
