package com.spring.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.service.MessageService;


@Controller
public class MessageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired MessageService service;
	
	//main페이지 접속
	@RequestMapping(value = "/m", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	
}
