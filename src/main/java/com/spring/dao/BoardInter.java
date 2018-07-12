package com.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.spring.dto.BoardDTO;
import com.spring.dto.MemberDTO;

public interface BoardInter {
	ArrayList<BoardDTO> nBoardList(Map<String, Object> param); //공지사항 리스트

	int nBoardWrite(BoardDTO dto); //공지사항 작성

	BoardDTO nBoardDetail(String board_no); //공지사항 상세보기 

	int nBoardDelete(String board_no);

	int nBoardUpdate(HashMap<String, String> map); //공지사항 수정 

	void upHit(String board_no);
	
	int listCnt(Map<String, Object> param); //공지사항 리스트 수 

	
	ArrayList<BoardDTO> myWriteList(Map<String, String> params);//내가 쓴 글 리스트

	int myWriteListCnt(Map<String, String> params); //내가 쓴 글 리스트 갯수

	ArrayList<BoardDTO> myReplyList(Map<String, String> params);//내가 쓴 댓글 리스트

	BoardDTO kimSayDetail(String board_no);

	int myReplyListCnt(Map<String, String> params); //내가 쓴 댓글 리스트 갯수

	ArrayList<String> kimsaymemberlist();

	ArrayList<BoardDTO> kimsayboardlist(String string);

	int kimSayDelete(String board_no);

	








	
}
