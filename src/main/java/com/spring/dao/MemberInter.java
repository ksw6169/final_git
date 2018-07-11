package com.spring.dao;

import java.util.HashMap;

import com.spring.dto.MemberDTO;

public interface MemberInter {

	int join(MemberDTO dto);	// 회원가입 요청
	MemberDTO login(String id);			// 로그인 요청
	int overlay(String id);
	MemberDTO member(String userId);	//회원정보
	int perUpdate(HashMap<String, String> map);	//회원 수정
	int outMem(String userId);	//회원 탈퇴
	int companyUpdate(String companyName, String newFileName, String jobSel, String id);	//회사 수정
}
