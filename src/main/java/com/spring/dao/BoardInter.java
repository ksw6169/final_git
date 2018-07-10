package com.spring.dao;

import java.util.ArrayList;
import java.util.Map;

import com.spring.dto.BoardDTO;

public interface BoardInter {

	ArrayList<BoardDTO> myWriteList(Map<String, String> params);//내가 쓴 글 리스트

	int myWriteListCnt(Map<String, String> params); //내가 쓴 글 리스트 갯수

	ArrayList<BoardDTO> myReplyList(Map<String, String> params);//내가 쓴 댓글 리스트

	int myReplyListCnt(Map<String, String> params); //내가 쓴 댓글 리스트 갯수

}
