package com.spring.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dao.MemberInter;
import com.spring.dao.MessageInter;
@Service
public class MessageService {

	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SqlSession sqlSession;
	
	MessageInter inter  = null;

	public void main() {
		
		logger.info("MessageService 접속");
		
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
}
