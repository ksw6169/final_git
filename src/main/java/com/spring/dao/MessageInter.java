package com.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.dto.MessageDTO;

public interface MessageInter {


	ArrayList<MessageDTO> messageList(HashMap<String, Object> map);
	
	ArrayList<MessageDTO> GmessageList(HashMap<String, Object> map);
	
	int listCnt(HashMap<String, Object> map);

	int messagewrite(MessageDTO dto);//쪽지 작성 
	
	MessageDTO UmessageDetail(String message_no); //상세보기
	
	int messagedelete(String del); // 삭제

	int messageCount(String id);//쪽지 총 갯수
	
	int readChk(String message_no); //쪽지 읽음 여부 변경


}
