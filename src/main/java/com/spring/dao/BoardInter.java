package com.spring.dao;

import java.util.ArrayList;
import java.util.Map;

import com.spring.dto.BoardDTO;

public interface BoardInter {
	ArrayList<BoardDTO> nBoardList(String startPage, String addPage); //공지사항 리스트

	int nBoardWrite(BoardDTO dto); //공지사항 작성

	BoardDTO nBoardDetail(String board_no); //공지사항 상세보기 

	int nBoardDelete(String board_no);

	int nBoardUpdate(String board_title, String board_content, String board_no);

	void upHit(String board_no);

	
	ArrayList<BoardDTO> myWriteList(Map<String, String> params);//내가 쓴 글 리스트

	int myWriteListCnt(Map<String, String> params); //내가 쓴 글 리스트 갯수

	ArrayList<BoardDTO> myReplyList(Map<String, String> params);//내가 쓴 댓글 리스트

	int myReplyListCnt(Map<String, String> params); //내가 쓴 댓글 리스트 갯수
}
