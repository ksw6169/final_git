package com.spring.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	
	/*김대리의 한마디 리스트*/
	@RequestMapping(value = "/kimSayCall")
	public @ResponseBody HashMap<String, Object> kimSayCall(@RequestParam Map<String, Object> params) {
		logger.info("김대리의 한마디 글 리스트 요청");
		
		return service.kimSayCall(params);
	}
	
	/*김대리의 한마디 리스트*/
	@RequestMapping(value = "/kimSaySearchList")
	public @ResponseBody HashMap<String, Object> kimSaySearchList(@RequestParam Map<String, String> params) {
		logger.info("김대리의 한마디 검색 기능 요청");
		
		return service.kimSaySearchList(params);
	}
	
	/*김대리의 한마디 상세보기*/
	@RequestMapping(value = "/kimSayDetail")
    public ModelAndView kimSayDetail(@RequestParam("board_no") String board_no, HttpServletRequest request) {
        ModelAndView mav=new ModelAndView();
        logger.info("board_no"+board_no);
        mav.addObject("board_no", board_no);
        mav.setViewName("kimSayDetail");
        return service.kimSayDetail(board_no);
    }
	
	//김대리의 한마디 글쓰기 폼
	@RequestMapping(value="/kimSayWrite")
	public ModelAndView kimSayWrite(@RequestParam HashMap<String, String> map, HttpServletRequest request) {
		logger.info("게시글 작성 실행");
		String loginId = (String) request.getSession().getAttribute("loginId");
		map.put("loginId", loginId);
		
		return service.kimSayWrite(map);
	}
	
	/*김대리의 한마디 수정 폼*/
	@RequestMapping(value = "/kimSayUpdateForm")
    public ModelAndView kimSayUpdate(@RequestParam("board_no") String board_no, HttpServletRequest request) {
        ModelAndView mav=new ModelAndView();
        logger.info("board_no"+board_no);
        mav.addObject("board_no", board_no);
        mav.setViewName("kimSayUpdateForm");
        return service.kimSayUpdateForm(board_no);
    }
	
	//김대리의 한마디 게시글 수정
	@RequestMapping(value="/kimSayUpdate")
	public ModelAndView kimSayUpdate(@RequestParam HashMap<String,String> params) {
		logger.info("게시글 수정 요청");
		return service.kimSayUpdate(params);
	}
	
	//김대리의 한마디 게시글 삭제
	@RequestMapping(value="/kimSayDelete")
	public ModelAndView kimSayDelete(@RequestParam("board_no") String board_no, HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("board_no", board_no);
		logger.info("김대리의 한마디 삭제 실행");
		logger.info("board:{}" , board_no);
		return service.kimSayDelete(board_no);
		
	}

	//공지사항리스트 폼
	@RequestMapping(value="/nBoardListForm")
	public String nBoardListForm() {
		logger.info("공지사항 리스트 이동");
		
		return"noticeList";
	}
	
	//공지사항 리스트
	@RequestMapping(value="/nBoardList")
	public @ResponseBody HashMap<String, Object> nBoardList(@RequestParam Map<String, Object> map, HttpServletRequest request) {
		logger.info("공지사항 리스트 실행");

		String loginId = (String) request.getSession().getAttribute("loginId");
		map.put("loginId",loginId);
		String keyword = (String) map.get("keyword");
		return service.nBoardList(map);
	}
	
	//공지사항 작성
	@RequestMapping(value="/nBoardWrite")
	public ModelAndView nBoardWrite(@RequestParam HashMap<String, String> map, HttpServletRequest reqeust) {
		logger.info("공지사항 작성 실행");
		String loginId = (String) reqeust.getSession().getAttribute("loginId");
		map.put("loginId", loginId);
		// 작성시 저장되어야할 값,   아이디, 번호, 제목, 내용 
		String member_id = map.get("loginId");
		String board_title = map.get("board_title");
		String board_content = map.get("board_content");
		logger.info(board_title+"/"+board_content+"/"+member_id);
		return service.nBoardWrite(map);
	}
	
	//공지사항 상세보기 => mav => 완성됨 
	@RequestMapping(value="/nBoardDetail")
	public ModelAndView nBoardDetail(@RequestParam("board_no") String board_no) {
		logger.info("공지사항 상세보기 실행");
		logger.info("board:{}" , board_no);
		return service.nBoardDetail(board_no);
	}

	//공지사항 삭제
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
	public ModelAndView nBoardUpdate(@RequestParam HashMap<String, String> map, HttpServletRequest request) {
		logger.info("공지사항 수정 실행");
		//아이디 가져옴 
		String userId = (String) request.getSession().getAttribute("loginId");//세션에서 로그인 한 아이디 값 가져와
		map.put("userId", userId);//map 에 담음
		String board_no = map.get("board_no");
		String board_title = map.get("board_title");
		String board_content = map.get("board_content");
		logger.info(board_no+"/"+board_title+"/"+board_content);
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
	
	@RequestMapping(value = "/likeCount")
	public @ResponseBody HashMap<String, Object> likeCount(@RequestParam Map<String, String> params) {
		logger.info("추천수 요청");
		
		return service.likeCount(params);
	}
	
	@RequestMapping(value = "/like")
	public @ResponseBody HashMap<String, Object> like(@RequestParam Map<String, String> params) {
		logger.info("추천 요청");
		
		return service.like(params);
	}
	
	/* 댓글 작성 */
	@RequestMapping(value = "/replyWrite")
	public @ResponseBody HashMap<String, Object> replyWrite(@RequestParam Map<String, String> params) {
		logger.info("댓글 작성 요청");
		
		return service.replyWrite(params);
	}
	
	/* 댓글 리스트 불러오기 */
	@RequestMapping(value = "/replyList")
	public @ResponseBody HashMap<String, Object> replyList(@RequestParam Map<String, String> params) {
		logger.info("댓글 리스트 요청");
		
		return service.replyList(params);
	}
	
	/* 댓글 수정 */
	@RequestMapping(value = "/replyUpdate")
	public @ResponseBody HashMap<String, Object> replyUpdate(@RequestParam Map<String, String> params) {
		logger.info("댓글 수정 요청");
		
		return service.replyUpdate(params);
	}
	
	/* 댓글 삭제 */
	@RequestMapping(value = "/replyDelete")
	public @ResponseBody HashMap<String, Object> replyDelete(@RequestParam Map<String, String> params) {
		logger.info("댓글 삭제 요청");
		
		return service.replyDelete(params);
	}
}
