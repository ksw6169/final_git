package com.spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.service.BoardService;


@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired BoardService service;
	
	//main페이지 접속
	@RequestMapping(value = "/b", method = RequestMethod.GET)
	public String home() {
		logger.info("Board 컨트롤러 접속");
		logger.info("test");
		
		service.main();
		
		return "home";
	}
	
}
