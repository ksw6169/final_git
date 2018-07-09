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

	public HashMap<String, Object> myWriteList(Map<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		inter = sqlSession.getMapper(BoardInter.class);
		/*int sNum = Integer.parseInt(params.get("sNum"));
		int eNum = Integer.parseInt(params.get("eNum"));*/
		String userId = "test";
		params.put("userId", userId);
		ArrayList<BoardDTO> list = inter.myWriteList(params);
		logger.info(""+list.size());
		int listCnt = inter.myWriteListCnt(params);
		map.put("list", list);
		map.put("listCnt", listCnt);
		return map;
	}
	
	
}
