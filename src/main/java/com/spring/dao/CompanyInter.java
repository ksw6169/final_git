package com.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.dto.CompanyDTO;
import com.spring.dto.EvaluationDTO;

public interface CompanyInter {

	ArrayList<CompanyDTO> companyList(HashMap<String, String> params);

	CompanyDTO companyDetail(String company_no);

	ArrayList<EvaluationDTO> companyCommentList(String company_no, String pagingEnd);

	int companyWrite(CompanyDTO dto);
	
	int evalWrite(EvaluationDTO dto);
	
	int evalUpdate(HashMap<String,String> params);
	
	EvaluationDTO evalUpdateForm(String evaluation_no); //기업평가 수정 폼 
	
	int evalCnt(int company_no,int plus); //기업평가 수 수정
	
	EvaluationDTO evalChk(HashMap<String,String> params); //기업평가 작성 체크
	
	int evalDelete(String evaluation_no); //기업평가 삭제

	void companyUpHit(String company_no);
}
