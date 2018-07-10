package com.spring.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.BoardInter;
import com.spring.dto.BoardDTO;
@Service
public class BoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SqlSession sqlSession;
	
	BoardInter inter  = null;
	
	String photo = null;

	public void main() {
		logger.info("BoardService 접속");
		
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
	
	
}
