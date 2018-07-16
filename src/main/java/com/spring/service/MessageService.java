package com.spring.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.MessageInter;
import com.spring.dto.MessageDTO;
@Service
public class MessageService {

	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SqlSession sqlSession;
	
	MessageInter inter  = null;

	// 사용자가 보낸 쪽지함 리스트
	public HashMap<String, Object> messageList(HashMap<String, Object> map) {
		inter = sqlSession.getMapper(MessageInter.class);
		HashMap<String, Object> param = new HashMap<>();
		ArrayList<MessageDTO> messageList = inter.messageList(map);
		int listAll = inter.listCnt(map);
		param.put("listAll", listAll);
		param.put("messageList",messageList);
		return param;
	}
	
	// 사용자가 받은 쪽지함 리스트
	public HashMap<String, Object> GmessageList(HashMap<String, Object> map) {
		inter = sqlSession.getMapper(MessageInter.class);
		HashMap<String, Object> param = new HashMap<>();
		ArrayList<MessageDTO> GmessageList = inter.GmessageList(map);
		int listAll = inter.listCnt(map);
		param.put("listAll", listAll);
		param.put("GmessageList",GmessageList);
		return param;
	}
	
	//쪽지 작성
	public ModelAndView messagewrite(HashMap<String, String> map) {
		logger.info("쪽지 작성 서비스");
		inter = sqlSession.getMapper(MessageInter.class);
		ModelAndView mav = new ModelAndView();
		MessageDTO dto = new MessageDTO();
		//세션값 가져와 member_id에 지정 
		dto.setMember_id(map.get("loginId"));
		dto.setMessage_content(map.get("message_content"));
		dto.setMessage_receive(map.get("message_receive"));
		int success = inter.messagewrite(dto);
		logger.info(dto.getMember_id());
		String page = "pageMove?page=mWrite";
		if(success>0) {
			page = "sendMlist";
		}
		mav.setViewName(page);
		return mav;
	}

	//user 쪽지 상세보기
	@Transactional
	public ModelAndView UmessageDetail(String message_no) {
		inter = sqlSession.getMapper(MessageInter.class);
		ModelAndView mav = new ModelAndView();
		if(inter.readChk(message_no) >0) {
			mav.addObject("message", inter.UmessageDetail(message_no));
		}
		mav.setViewName("mDetail");
		return mav;
	}

	//쪽지 선택 삭제 
	public HashMap<String, Object> messagedelete(String[] delList) {
		inter = sqlSession.getMapper(MessageInter.class);
		boolean success = false;
		int cnt = 0;
		for (String del : delList) {
			inter.messagedelete(del);
			cnt++;
		}
		if(delList.length == cnt) {
			success = true;
		}
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("success", success);
		return map;
	}
	


	/* menubar - 안 읽은 쪽지 개수 알림 */
	public @ResponseBody HashMap<String, Integer> messageCount(String id) {
		inter = sqlSession.getMapper(MessageInter.class);
		
		HashMap<String, Integer> resultMap = new HashMap<>();
		
		int msgCnt = inter.messageCount(id);
		resultMap.put("msgCnt", msgCnt);
		
		logger.info("메시지 개수 : "+msgCnt);
		
		return resultMap;
	}

	public ModelAndView messagereplyForm(String message_no) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(MessageInter.class);
		mav.addObject("message", inter.UmessageDetail(message_no));
		mav.setViewName("aAnswer");
		return mav;
	}


}
