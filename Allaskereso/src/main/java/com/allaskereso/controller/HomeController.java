package com.allaskereso.controller;



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
		return "index";
	
		
	}
	
		
}
