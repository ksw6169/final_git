package com.spring.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.service.MemberService;


@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired MemberService service;
	
	//main페이지 접속
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Member 컨트롤러 접속");
		
		service.main();
		
		return "main";
	}
	
	/* test method */
	
	
	
	@RequestMapping(value = "/aAnswer", method = RequestMethod.GET)
	public String aAnswer(Locale locale, Model model) {
		
		service.main();
		
		return "aAnswer";
	}
	
	@RequestMapping(value = "/aGetMlist", method = RequestMethod.GET)
	public String aGetMlist(Locale locale, Model model) {
		
		return "aGetMlist";
	}
	
	@RequestMapping(value = "/aMDetail", method = RequestMethod.GET)
	public String aMDetail(Locale locale, Model model) {
		
		return "aMDetail";
	}
	
	@RequestMapping(value = "/aSendMlist", method = RequestMethod.GET)
	public String aSendMlist(Locale locale, Model model) {
		
		return "aSendMlist";
	}
	
	@RequestMapping(value = "/comComment", method = RequestMethod.GET)
	public String comComment(Locale locale, Model model) {
		
		return "comComment";
	}
	
	@RequestMapping(value = "/comDetail", method = RequestMethod.GET)
	public String comDetail(Locale locale, Model model) {
		
		return "comDetail";
	}
	
	@RequestMapping(value = "/companyUpdate", method = RequestMethod.GET)
	public String companyUpdate(Locale locale, Model model) {
		
		return "companyUpdate";
	}
	
	@RequestMapping(value = "/comUpdate", method = RequestMethod.GET)
	public String comUpdate(Locale locale, Model model) {
		
		return "comUpdate";
	}
	
	@RequestMapping(value = "/comWrite", method = RequestMethod.GET)
	public String comWrite(Locale locale, Model model) {
		
		return "comWrite";
	}
	
	@RequestMapping(value = "/dJoin", method = RequestMethod.GET)
	public String dJoin(Locale locale, Model model) {
		
		return "dJoin";
	}
	
	@RequestMapping(value = "/getMlist", method = RequestMethod.GET)
	public String getMlist(Locale locale, Model model) {
		
		return "getMlist";
	}
	
	@RequestMapping(value = "/howComList", method = RequestMethod.GET)
	public String howComList(Locale locale, Model model) {
		
		return "howComList";
	}
	
	@RequestMapping(value = "/iJoin", method = RequestMethod.GET)
	public String iJoin(Locale locale, Model model) {
		
		return "iJoin";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		
		return "join";
	}
	
	@RequestMapping(value = "/kimSayDetail", method = RequestMethod.GET)
	public String kimSayDetail(Locale locale, Model model) {
		
		return "kimSayDetail";
	}
	
	@RequestMapping(value = "/kimSayList", method = RequestMethod.GET)
	public String kimSayList(Locale locale, Model model) {
		
		return "kimSayList";
	}
	
	@RequestMapping(value = "/kimSayUpdate", method = RequestMethod.GET)
	public String kimSayUpdate(Locale locale, Model model) {
		
		return "kimSayUpdate";
	}
	
	@RequestMapping(value = "/kimSayWrite", method = RequestMethod.GET)
	public String kimSayWrite(Locale locale, Model model) {
		
		return "kimSayWrite";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		
		return "login";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		
		return "main";
	}
	
	@RequestMapping(value = "/mDetail", method = RequestMethod.GET)
	public String mDetail(Locale locale, Model model) {
		
		return "mDetail";
	}
	
	@RequestMapping(value = "/mWrite", method = RequestMethod.GET)
	public String mWrite(Locale locale, Model model) {
		
		return "mWrite";
	}
	
	@RequestMapping(value = "/myReplyList", method = RequestMethod.GET)
	public String myReplyList(Locale locale, Model model) {
		
		return "myReplyList";
	}
	
	@RequestMapping(value = "/myWriteList", method = RequestMethod.GET)
	public String myWriteList(Locale locale, Model model) {
		
		return "myWriteList";
	}
	
	@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(Locale locale, Model model) {
		
		return "noticeDetail";
	}
	
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(Locale locale, Model model) {
		
		return "noticeList";
	}
	
	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.GET)
	public String noticeUpdate(Locale locale, Model model) {
		
		return "noticeUpdate";
	}
	
	@RequestMapping(value = "/noticeWrite", method = RequestMethod.GET)
	public String noticeWrite(Locale locale, Model model) {
		
		return "noticeWrite";
	}
	
	@RequestMapping(value = "/outMemForm", method = RequestMethod.GET)
	public String outMemForm(Locale locale, Model model) {
		
		return "outMemForm";
	}
	
	@RequestMapping(value = "/perUpdate", method = RequestMethod.GET)
	public String perUpdate(Locale locale, Model model) {
		
		return "perUpdate";
	}
	
	@RequestMapping(value = "/qnaDetail", method = RequestMethod.GET)
	public String qnaDetail(Locale locale, Model model) {
		
		return "qnaDetail";
	}
	
	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public String qnaList(Locale locale, Model model) {
		
		return "qnaList";
	}
	
	@RequestMapping(value = "/qnaUpdate", method = RequestMethod.GET)
	public String qnaUpdate(Locale locale, Model model) {
		
		return "qnaUpdate";
	}
	
	@RequestMapping(value = "/qnaWrite", method = RequestMethod.GET)
	public String qnaWrite(Locale locale, Model model) {
		
		return "qnaWrite";
	}
	
	@RequestMapping(value = "/reqDetail", method = RequestMethod.GET)
	public String reqDetail(Locale locale, Model model) {
		
		return "reqDetail";
	}
	
	@RequestMapping(value = "/reqEmail", method = RequestMethod.GET)
	public String reqEmail(Locale locale, Model model) {
		
		return "reqEmail";
	}
	
	@RequestMapping(value = "/reqList", method = RequestMethod.GET)
	public String reqList(Locale locale, Model model) {
		
		return "reqList";
	}
	
	@RequestMapping(value = "/sendMlist", method = RequestMethod.GET)
	public String sendMlist(Locale locale, Model model) {
		
		return "sendMlist";
	}
	
	
	
}
