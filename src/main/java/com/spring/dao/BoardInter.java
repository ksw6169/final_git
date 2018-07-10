package com.spring.dao;

import java.util.ArrayList;

import com.spring.dto.BoardDTO;

public interface BoardInter {

	ArrayList<BoardDTO> nBoardList(String startPage, String addPage); //공지사항 리스트

	int nBoardWrite(BoardDTO dto); //공지사항 작성

	BoardDTO nBoardDetail(String board_no); //공지사항 상세보기 

	int nBoardDelete(String board_no);

	int nBoardUpdate(String board_title, String board_content, String board_no);

	void upHit(String board_no);

	int allCount(); //총 게시물 수 

}
