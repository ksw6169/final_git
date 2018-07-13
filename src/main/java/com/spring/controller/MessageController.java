package com.spring.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.MessageService;


@Controller
public class MessageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired MessageService service;
	
	//main페이지 접속
	@RequestMapping(value = "/messageListForm")
	public String messageListForm() {
		logger.info("받은 쪽지함 컨트롤러 실행");

		return "getMlist";
	}
	
	//사용자가 보낸 쪽지함 리스트 
	@RequestMapping(value = "/UmessageList")
	public @ResponseBody HashMap<String, Object> messageList(@RequestParam HashMap<String, Object> map, HttpServletRequest request){
		logger.info("사용자가 보낸 쪽지함 리스트 실행");
		String member_id = (String) request.getSession().getAttribute("loginId");
		map.put("loginId", member_id);
		logger.info(member_id +" : 접속 중" );
		return service.messageList(map);
	}
	
	//사용자가 받은 쪽지함 리스트 
	@RequestMapping(value = "/UgetmessageList")
	public @ResponseBody HashMap<String, Object> GmessageList(@RequestParam HashMap<String, Object> map, HttpServletRequest request){
		logger.info("사용자가 보낸 쪽지함 리스트 실행");
		String member_id = (String) request.getSession().getAttribute("loginId");
		map.put("loginId", member_id);
		logger.info(member_id +" : 접속 중" );
		return service.GmessageList(map);
	}
	
	//사용자 쪽지 보내기 => 완료 
	@RequestMapping(value="/messagewrite")
	public ModelAndView messagewrite(@RequestParam HashMap<String, String> map,HttpServletRequest request) {
		logger.info("쪽지 작성 컨트롤러");
		//접속중인 아이디 
		String member_id = (String) request.getSession().getAttribute("loginId");
		map.put("loginId", member_id);
		//쪽지 작성시 저장될 내용 
		String message_content = map.get("message_content");
		logger.info(member_id +" : 접속 중" );
		logger.info("쪽지 내용 : " +message_content );
		return service.messagewrite(map);
	}
	
	@RequestMapping(value="/UmessageDetail")
	public ModelAndView UmessageDetail(@RequestParam("message_no") String message_no) {
		logger.info("쪽지 상세보기 실행");
		return service.UmessageDetail(message_no);

	}
	
	@RequestMapping(value="/messagedetail")
	public ModelAndView messagedetail(String message_no) {
		logger.info("쪽지 선택 삭제 ");

		return service.messagedetail(message_no);
	}
	
	
}
