package com.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.spring.dto.BoardDTO;
import com.spring.dto.ReplyDTO;

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

	int kimSayUpdate(String category, String board_title, String board_content, String board_no);

	int kimSayWrite(String category, String board_title, String board_content, String member_id);


	boolean myLikeCount(String loginId);
	
	int likeCount(int board_no);
	
	int myLikeUp(String id, int board_no);	// recommand 테이블에 추가

	int myLikeDown(String id, int board_no);	// recommand 테이블에서 삭제
	
	int upLike(boolean myLike, int board_no);

	int replyWrite(String loginId, int board_no, String replyContent);

	ArrayList<ReplyDTO> replyList(int parseInt);

	int replyUpdate(int reply_no, String reply_content);

	int replyDelete(int reply_no);

	int replyCountUp(int board_no);

	int replyCountDown(int board_no);

	








	
}
