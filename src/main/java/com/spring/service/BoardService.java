package com.spring.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.junit.runner.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.BoardInter;
import com.spring.dao.MemberInter;
import com.spring.dto.BoardDTO;
@Service
public class BoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SqlSession sqlSession;
	
	BoardInter inter  = null;
	String photo = null;

	
	//공지사항 리스트 
	public HashMap<String, Object> nBoardList(String startPage, String addPage) {	
		logger.info("공지사항 list 서비스 요청");
		inter = sqlSession.getMapper(BoardInter.class);
		HashMap<String , Object> map = new HashMap<>();
		map.put("nBoardList", inter.nBoardList(startPage, addPage));
	
		return map;
	}

	public ModelAndView nBoardWrite(HashMap<String, String> map) {
		logger.info("공지사항 작성 서비스 요청");
		inter = sqlSession.getMapper(BoardInter.class);
		ModelAndView mav = new ModelAndView();
		BoardDTO dto = new BoardDTO();
		dto.setMember_id(map.get("member_id"));
		dto.setBoard_title(map.get("board_title"));
		dto.setBoard_content(map.get("board_content"));
		int success=inter.nBoardWrite(dto);
		
		String msg ="글 작성 실패!";
		logger.info("실패");
		if(success==0) {
			msg = "글 작성 성공 .";
			logger.info("성공");
		}
		mav.addObject("msg", msg);
		return mav;
		
	
	}

	public ModelAndView nBoardDetail(String board_no) {
		logger.info("공지사항 상세보기 서비스");
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInter.class);
		inter.upHit(board_no);
		mav.addObject("board", inter.nBoardDetail(board_no));
		mav.setViewName("noticDetail");
		
		return mav;
	}

	public ModelAndView nBoardDelete(String board_no) {
		logger.info("공지사항 삭제 서비스");
		inter = sqlSession.getMapper(BoardInter.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("board", inter.nBoardDelete(board_no));
		mav.setViewName("redirect:/");
		return mav;
	}

	//수정폼 이동
	public ModelAndView nBoardUpdateForm(String board_no) {
		inter = sqlSession.getMapper(BoardInter.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("board", inter.nBoardDetail(board_no));
		mav.setViewName("noticeUpdate");
		return mav;
	}

	@Transactional
	public ModelAndView nBoardUpdate(HashMap<String, String> map) {
		logger.info("공지사항 수정하기 서비스");
		inter = sqlSession.getMapper(BoardInter.class);
		ModelAndView mav = new ModelAndView();
		//1. 파라메터 값 가져오기 
		String board_no = map.get("board_no");
		String board_subject = map.get("board_subject");
		String board_content = map.get("board_content");
		logger.info(board_no+"/"+board_subject+"/"+board_content);
		String page = "redirect:/nBoardUpdateForm?board_no="+board_no;
		// 2. 수정 쿼리 실행
		int success = inter.nBoardUpdate(board_subject,board_content,board_no);
		logger.info("success : "+success);
		if(success > 0) {
			page = "redirect:/nBoardDetail?board_no="+board_no; 
		}	
		
		mav.setViewName(page);
		return mav;
	}


	
}
