package com.spring.service;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
}
