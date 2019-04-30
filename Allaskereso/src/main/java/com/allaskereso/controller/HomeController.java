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
import org.springframework.web.bind.annotation.RequestMapping;

import com.allaskereso.domain.*;
import com.allaskereso.services.DAO;


@Controller
public class HomeController {

	@PersistenceContext
    private EntityManager manager;
	
	

	@RequestMapping("/")
	public String print(Model model) throws IOException {
		
		
		DAO dao = new DAO();
		String ret="index";
		
		
		boolean succ;
		Date x = new Date(System.currentTimeMillis());
		//byte[] blob=dao.convertFileContentToBlob("C:\\Users\\CK\\Desktop\\asd.rtf");
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		//Long asdx=(long) 2;
		succ=dao.insertAllaskereso(manager,"alma",x,"alfa@alfac.hu",2,"Strret","2","asdfggxx","asdfghjkl",ts);
		System.out.println(succ);
		
		try {
			List<Allaskereso> allaskereso = dao.listAllaskeresok(manager);
			model.addAttribute("emberek",allaskereso);
			
			if(allaskereso == null) {
				throw new Exception();
			}else {
				ret = "index1";
			}
			
			
		}
		catch(Exception e){
			ret = "index";
		}
		
		return "index";
		
	}
	
	
		
}
