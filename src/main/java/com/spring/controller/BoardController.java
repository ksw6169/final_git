package com.spring.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.BoardService;



@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired BoardService service;
	
	/*김대리의 한마디 리스트*/
	@RequestMapping(value = "/kimSayCall")
	public @ResponseBody HashMap<String, Object> kimSayListCall() {
		logger.info("김대리의 한마디 글 리스트 요청");
		return service.kimSay();
	}
	
	/*김대리의 한마디 상세보기
	@RequestMapping(value = "/kimSayDetail")
	public ModelAndView kimSayDetail(@RequestParam("idx") String idx) {		
		logger.info("{} 번 게시물 요청",idx);
		return service.kimSayDetail(idx);
	}*/
	
	
	@RequestMapping(value = "/kimSayDetail")
    public ModelAndView kimSayDetail(@RequestParam("board_no") String board_no, HttpServletRequest request) {
        ModelAndView mav=new ModelAndView();
        logger.info("board_no"+board_no);
        mav.addObject("board_no", board_no);
        mav.setViewName("kimSayDetail");
        return service.kimSayDetail(board_no);
    }

}
