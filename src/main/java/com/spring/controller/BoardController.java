package com.spring.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		logger.info("test랍니다");
		
		service.main();
		
		return "main";
	}
	
	@RequestMapping(value = "/myWriteList")
	public @ResponseBody HashMap<String, Object> myWriteList(@RequestParam Map<String, String> params) {
		logger.info("myWriteList 요청");
		System.out.println(params.get("sNum") +"/"+params.get("eNum"));
		return service.myWriteList(params);
	}
	
	@RequestMapping(value = "/myReplyList")
	public @ResponseBody HashMap<String, Object> myReplyList(@RequestParam Map<String, String> params) {
		logger.info("myReplyList 요청");
		System.out.println(params.get("sNum") +"/"+params.get("eNum"));
		return service.myWriteList(params);
	}
}
