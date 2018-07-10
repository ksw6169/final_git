package com.spring.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.tag.common.fmt.RequestEncodingSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.BoardService;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired BoardService service;
	
	//공지사항리스트 폼
	@RequestMapping(value="/nBoardListForm")
	public String nBoardListForm() {
		logger.info("공지사항 리스트 이동");
		
		return"noticeList";
	}
	
	//공지사항 리스트
	@RequestMapping(value="/nBoardList")
	public @ResponseBody HashMap<String, Object> nBoardList(@RequestParam Map<String, String> map, HttpServletRequest request) {
		logger.info("공지사항 리스트 실행");
		String startPage = map.get("startPage");
		String addPage = map.get("addPage");
		String serch = map.get("serch");
		logger.info(map.get("startPage"));
		logger.info(startPage+"/"+addPage);
		String id = (String) request.getSession().getAttribute("loginId");
		map.put("loginId",id);
		return service.nBoardList(startPage,addPage);
	}
	
	//공지사항 작성
	@RequestMapping(value="/nBoardWrite")
	public ModelAndView nBoardWrite(@RequestParam HashMap<String, String> map, HttpSession session) {
		logger.info("공지사항 작성 실행");
		String id = (String) session.getAttribute("admin");
		map.put("admin", id); //map에 담음
		String board_title = map.get("board_title");
		String board_content = map.get("board_content");
		logger.info(board_title+"/"+board_content+"/"+id);
		return service.nBoardWrite(map);
	}
	
	//공지사항 상세보기
	@RequestMapping(value="/nBoardDetail")
	public ModelAndView nBoardDetail(@RequestParam("board_no") String board_no) {
		logger.info("공지사항 상세보기 실행");
		logger.info("board:{}" , board_no);
		return service.nBoardDetail(board_no);
	}

	//공지사항 삭제,,,
	@RequestMapping(value="/nBoardDelete")
	public ModelAndView nBoardDelete(String board_no) {
		logger.info("공지사항 삭제 실행");
		logger.info("board:{}" , board_no);
		
		return service.nBoardDelete(board_no);
	}
	
	//공지사항 수정폼
	@RequestMapping(value="/nBoardUpdateForm")
	public ModelAndView nBoardUpdateForm(String board_no) {
		logger.info("공지사항 수정폼 이동");
		
		return service.nBoardUpdateForm(board_no);
	}
	
	//공지사항 수정
	@RequestMapping(value="/nBoardUpdate")
	public ModelAndView nBoardUpdate(@RequestParam HashMap<String, String>map) {
		logger.info("공지사항 수정 실행");
		
		return service.nBoardUpdate(map);
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
