package com.spring.service;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.CompanyInter;
import com.spring.dao.MemberInter;
@Service
public class CompanyService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SqlSession sqlSession;
	
	CompanyInter inter  = null;

	public void main() {
		logger.info("CompanyService 접속");
		
	}
	
	
}
