package com.allaskereso.controller;



import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.allaskereso.domain.*;
import com.allaskereso.services.DAO;

@Controller
public class HomeController {

	@PersistenceContext
    private EntityManager manager;
	
	
	
	@RequestMapping("/")
	public String print(Model model) {
		
		
		DAO dao = new DAO();
		String ret;
		
		/*
		boolean succ;
		Date x = new Date(1998,10,1);
		
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		
		List<Integer> ls = new ArrayList<>();
		ls.add(2);
		ls.add(3);
		
		List<Blob> bls = new ArrayList();
		
		
		succ = dao.insertAllaskereso(manager,"alma",x,"alfa@alfa.hu",2,"Strret","2","asdfgg","asdfghjkl",ts,ls, bls );
		*/
		
		try {
			List<Allaskereso> allaskereso = dao.listAllaskeresok(manager);
			model.addAttribute("emberek",allaskereso);
			
			if(allaskereso == null) {
				throw new Exception();
			}else {
				ret = "index";
			}
			
			
		}
		catch(Exception e){
			ret = "index";
		}
		
		return ret;
		
	}
	
	
		
}
