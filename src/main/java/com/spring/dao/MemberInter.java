package com.spring.dao;

import com.spring.dto.MemberDTO;

public interface MemberInter {

	int join(MemberDTO dto);	// 회원가입 요청
	String login(String id);			// 로그인 요청
}
