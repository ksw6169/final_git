package com.spring.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
		return(mav);
	}
	
	//공지사항 리스트 
	public HashMap<String, Object> nBoardList(Map<String, Object> param) {	
		logger.info("공지사항 list 서비스 요청");
		inter = sqlSession.getMapper(BoardInter.class);
		HashMap<String , Object> map = new HashMap<String , Object>();
		ArrayList<BoardDTO> nBoardList = inter.nBoardList(param);
		int listAll = inter.listCnt(param);
		map.put("nBoardList", nBoardList);
		map.put("listAll", listAll);
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
		String page = "noticeWrite";
		
		if(success>0) { //글작성 성공시 
			page = "redirect:./nBoardDetail?board_no="+dto.getBoard_no();
		}
		mav.setViewName(page);
		return mav;
	}

	//내가 쓴 글 리스트
	public HashMap<String, Object> myWriteList(Map<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>(); //담아서 보낼 HashMap 생성
		inter = sqlSession.getMapper(BoardInter.class);
		/*int sNum = Integer.parseInt(params.get("sNum"));
		int eNum = Integer.parseInt(params.get("eNum"));*/
		ArrayList<BoardDTO> list = inter.myWriteList(params); //ArrayList로 해당 아이디가 쓴 글 담기
		logger.info(""+list.size());
		int listCnt = inter.myWriteListCnt(params); //페이징을 위해 글 갯수 가져옴
		map.put("list", list); //보낼 리스트를 담음
		map.put("listCnt", listCnt); //글 갯수 담음
		return map;
	}

	//내가 쓴 댓글리스트
	public HashMap<String, Object> myReplyList(Map<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();//담아서 보낼 HashMap 생성
		inter = sqlSession.getMapper(BoardInter.class);
		ArrayList<BoardDTO> list = inter.myReplyList(params);//ArrayList로 해당 아이디가 쓴 글 담기
		logger.info(""+list.size());
		int listCnt = inter.myReplyListCnt(params);//페이징을 위해 글 갯수 가져옴
		map.put("list", list);//보낼 리스트를 담음
		map.put("listCnt", listCnt);//글 갯수 담음
		return map;
	}

	public ModelAndView nBoardDetail(String board_no) {
		logger.info("공지사항 상세보기 서비스");
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInter.class);
		inter.upHit(board_no);
		mav.addObject("board", inter.nBoardDetail(board_no));
		mav.setViewName("noticeDetail");
		
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
		
		String page = "redirect:/nBoardUpdateForm?board_no="+map.get("board_no");
		int success = inter.nBoardUpdate(map);
		if(success > 0) {
			page = "redirect:/nBoardDetail?board_no="+map.get("board_no"); 
		}		
		logger.info("success : "+success);
		mav.addObject("success", success);
		mav.setViewName(page);
		return mav;
	}






	
}
