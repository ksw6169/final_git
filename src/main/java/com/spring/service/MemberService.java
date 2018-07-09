package com.spring.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.MemberInter;
import com.spring.dto.MemberDTO;
@Service
public class MemberService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SqlSession sqlSession;
	MemberInter inter  = null;
	String photo = null;

	public void main() {
		
		logger.info("MemberService 접속");
		
	}

	// 회원가입 요청
	public ModelAndView join(HashMap<String, Object> map) {
		int success = 0;	// 회원가입 성공 여부
		ModelAndView mav = new ModelAndView();
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();	
		String hash = encoder.encode(String.valueOf(map.get("pw")));
		
		MemberDTO dto = new MemberDTO();
		dto.setMember_id(String.valueOf(map.get("id")));
		dto.setMember_pw(hash);
		dto.setMember_email(String.valueOf(map.get("email")));
		dto.setMember_family(String.valueOf(map.get("family")));
		
		if(String.valueOf(map.get("member_div")).equals("대리")) {
			
			
		} 
		
		inter = sqlSession.getMapper(MemberInter.class);
		success = inter.join(dto);
		
		mav.addObject("msg", "회원가입에 실패했습니다.");
		
		if(success > 0) {
			mav.setViewName("redirect:/");
			mav.addObject("msg", "회원가입에 성공했습니다.");
		}
		
		return mav;
	}

	/*BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	String hash = encoder.encode(userPw);
	
	inter = sqlSession.getMapper(MemberInter.class);
	int success = 0;
	success = inter.join(userId, hash);
	logger.info("회원가입 성공 여부: "+success);*/
	
}
