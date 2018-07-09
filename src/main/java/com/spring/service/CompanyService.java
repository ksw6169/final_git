package com.spring.service;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.CompanyInter;
import com.spring.dao.MemberInter;
import com.spring.dto.CompanyDTO;
import com.spring.dto.EvaluationDTO;
import com.spring.dto.MemberDTO;
@Service
public class CompanyService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SqlSession sqlSession;
	
	CompanyInter inter  = null;

	public void main() {
		logger.info("CompanyService 접속");
		
	}

	public HashMap<String, Object> companyList(HashMap<String, String> params) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		inter=sqlSession.getMapper(CompanyInter.class);
		ArrayList<CompanyDTO> list= inter.companyList(params);
		map.put("companyList", list);
		
		return map;
	}

	@Transactional
	public ModelAndView companyDetail(String company_no) {
		inter=sqlSession.getMapper(CompanyInter.class);
		CompanyDTO companyDTO=inter.companyDetail(company_no);
		ArrayList<EvaluationDTO> list= inter.companyCommentList(company_no,null);
		inter.companyUpHit(company_no);
		
		float night=0;
		float rest=0;
		float intern=0;
		float vacation=0;
		for(EvaluationDTO dto:list) {
			night+=dto.getEvaluation_night();
			rest+=dto.getEvaluation_rest();
			intern+=dto.getEvaluation_intern();
			vacation+=dto.getEvaluation_vacation();
		}
		
		if(list.size()!=0) {
		companyDTO.setEvaluatino_nightAVG(Math.round(night/list.size()));
		companyDTO.setEvaluatino_restAVG(Math.round(rest/list.size()));
		companyDTO.setEvaluatino_internAVG(Math.round(intern/list.size()));
		companyDTO.setEvaluatino_vacationAVG(Math.round(vacation/list.size()));
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("companyDTO", companyDTO);
		mav.setViewName("comDetail");
		return mav;
	}

	public HashMap<String, Object> companyCommentList(String company_no, String pagingEnd) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		inter=sqlSession.getMapper(CompanyInter.class);
		ArrayList<EvaluationDTO> list= inter.companyCommentList(company_no,pagingEnd);
		
		map.put("evaluationList", list);
		return map;
	}

	//회원 기업 평가 여부 추가해야함
	@Transactional
	public ModelAndView evalWrite(HashMap<String, String> params) {
		EvaluationDTO dto=new EvaluationDTO();
		dto.setCompany_no(Integer.parseInt(params.get("company_no")));
		dto.setMember_id(params.get("member_id"));
		/*dto.setEvaluation_year(Integer.parseInt(params.get("evaluation_year")));
		dto.setEvaluation_salary(Integer.parseInt(params.get("evaluation_salary")));*/
		dto.setEvaluation_night(Integer.parseInt(params.get("evaluation_night")));
		dto.setEvaluation_rest(Integer.parseInt(params.get("evaluation_rest")));
		dto.setEvaluation_intern(Integer.parseInt(params.get("evaluation_intern")));
		dto.setEvaluation_vacation(Integer.parseInt(params.get("evaluation_vacation")));
		dto.setEvaluation_comment(params.get("evaluation_comment"));
		
		inter=sqlSession.getMapper(CompanyInter.class);
		int success=inter.evalWrite(dto);
		String page="comWrite";
		if(success>0) {
			inter.memberEvalCnt(dto.getMember_id(), 1);
			inter.evalCnt(dto.getCompany_no(),1);
			page="redirect:./companyCommentView?company_no="+dto.getCompany_no();
			
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		
		return mav;
	}

	public ModelAndView evalUpdateForm(String evaluation_no) {
		inter=sqlSession.getMapper(CompanyInter.class);
		EvaluationDTO evaluationDTO=inter.evalUpdateForm(evaluation_no);
		
		ModelAndView mav= new ModelAndView();
		if(evaluationDTO!=null) {
		CompanyDTO companyDTO=inter.companyDetail(String.valueOf(evaluationDTO.getCompany_no()));
		mav.addObject("evaluationDTO", evaluationDTO);
		mav.addObject("companyDTO", companyDTO);
		}
		
		mav.setViewName("comUpdate");
		
		return mav;
	}
	
	public ModelAndView evalUpdate(HashMap<String,String> params) {
		inter=sqlSession.getMapper(CompanyInter.class);
		
		int success=inter.evalUpdate(params);
		String page="redirect:./evalUpdateForm?evaluation_no="+params.get("evaluation_no");
		if(success>0) {
			page="redirect:./companyCommentView?company_no="+params.get("company_no");
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("success", success);
		mav.setViewName(page);
		
		return mav;
	}

	@Transactional
	public HashMap<String, Object> evalDelete(String evaluation_no, String member_id) {
		inter=sqlSession.getMapper(CompanyInter.class);
		EvaluationDTO dto=inter.evalUpdateForm(evaluation_no);
		int success=inter.evalDelete(evaluation_no);
		
		if(success>0){
			inter.memberEvalCnt(member_id, -1);
			inter.evalCnt(dto.getCompany_no(),-1);
			}
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("success",success);
		
		return map;
	}

	public HashMap<String, Object> evalCheck(String company_no, String member_id) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		Boolean success=false;
		String msg="DB 조회 오류!";
		
		inter=sqlSession.getMapper(CompanyInter.class);
		CompanyDTO companyDTO=inter.companyDetail(company_no);
		
		MemberInter memberInter=sqlSession.getMapper(MemberInter.class);
		MemberDTO memberDTO=null;
		if(Integer.parseInt(memberDTO.getMember_cert())>0) {
		msg="기업 인증을 진행하지 않으셨습니다.";	
		}else if(Integer.parseInt(memberDTO.getMember_eval())>0) {
			msg="이미 기업평가를 하셨습니다.";
		}else if(!companyDTO.getCompany_name().equals(memberDTO.getMember_company())) {
			msg="해당 기업의 직원으로 인증되지 않으셨습니다.";
		}else {
			success=true;
		}
		
		map.put("success", success);
		map.put("msg", msg);
		return map;
	}
	
}
