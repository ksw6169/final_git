package com.spring.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	
	/*내가 쓴 글 리스트 - ajax*/
	@RequestMapping(value = "/myWriteList")
	public @ResponseBody HashMap<String, Object> myWriteList(@RequestParam Map<String, String> params, HttpServletRequest request) {
		logger.info("myWriteList 요청");
		String userId = (String) request.getSession().getAttribute("loginId");//세션에서 로그인 한 아이디 값 가져와
		params.put("userId", userId);//map 에 담음
		return service.myWriteList(params); //담은 map을 서비스로 넘김
	}
	
	/*내가 쓴 댓글 리스트 - ajax*/
	@RequestMapping(value = "/myReplyList")
	public @ResponseBody HashMap<String, Object> myReplyList(@RequestParam Map<String, String> params, HttpServletRequest request) {
		logger.info("myReplyList 요청");
		String userId = (String) request.getSession().getAttribute("loginId");//세션에서 로그인 한 아이디 값 가져와
		params.put("userId", userId); //map에 담음
		return service.myReplyList(params); //담은 map을 서비스로 넘김
	}
}
