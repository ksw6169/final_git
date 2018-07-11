package com.spring.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.BoardInter;
import com.spring.dto.BoardDTO;
@Service
public class BoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SqlSession sqlSession;
	
	BoardInter inter  = null;
	
	String photo = null;

	// 김대리의 한마디 글 리스트 요청
	public HashMap<String, Object> kimSay() {
		logger.info("김대리의 한마디 리스트 서비스 접근");
		inter = sqlSession.getMapper(BoardInter.class);
		ArrayList<BoardDTO> list = inter.kimSayList();
		ModelAndView mav = new ModelAndView();
		logger.info("list : "+list.size());
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}
	
	/*// 김대리의 한마디 상세보기 요청
	public ModelAndView kimSayDetail(String board_no) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInter.class);
		mav.addObject("dto", inter.kimSayDetail(Integer.parseInt(board_no)));
		mav.setViewName("kimSayDetail");
		return mav;
	}*/
	
	//상세보기(조회수 올리기 + 상세보기)
	//트랜잭션 처리 요구 구간
	@Transactional
	public ModelAndView kimSayDetail(String board_no) {
		logger.info("조회수 올리기");
		inter = sqlSession.getMapper(BoardInter.class);	
		//inter.upHit(idx);
		logger.info("상세보기");		
		ModelAndView mav = new ModelAndView();
		mav.addObject("board", inter.kimSayDetail(board_no));
		mav.setViewName("kimSayDetail");		
		return mav;
	}
	
	
}
