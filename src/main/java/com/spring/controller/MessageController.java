package com.spring.controller;

import java.util.HashMap;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.service.MessageService;


@Controller
public class MessageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired MessageService service;
	
	//main페이지 접속
	@RequestMapping(value = "/m", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		logger.info("Message 컨트롤러 접속");
		
		service.main();
		return "main";
	}
	
	/* menubar - 안 읽은 쪽지 개수 알림 */
	@RequestMapping(value = "/messageCount")
	public @ResponseBody HashMap<String, Integer> messageCount(@RequestParam HashMap<String, Object> map) {
		
		return service.messageCount(String.valueOf(map.get("id")));
	}
	
}
