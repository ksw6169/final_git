package com.spring.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.CompanyService;


@Controller
public class CompanyController {
	
	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);
	
	@Autowired CompanyService service;
	
	//main페이지 접속
	@RequestMapping(value = "/c", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("Company 컨트롤러 접속");
		
		service.main();
		
		return "redirect:./companyListForm";
	}
	
	@RequestMapping(value = "/companyListForm")
	public String companyListForm() {
		logger.info("[companyListForm]");
		return "howComList";
	}
	
	@RequestMapping(value = "/companyList")
	public @ResponseBody HashMap<String, Object> companyList(@RequestParam HashMap<String, String> params){
		String keyword=params.get("keyword");
		String pagingEnd=params.get("pagingEnd");
		logger.info("[companyList] keyword : "+keyword+" / pagingEnd : "+pagingEnd);
	
		return service.companyList(params);
		//companyList[] - company_no, company_name, 조회수, company_eval
	}
	
	@RequestMapping(value = "/companyDetail")
	public ModelAndView companyDetail(@RequestParam("company_no") String company_no) {
		logger.info("[companyDetail] company_no : "+ company_no);
		return service.companyDetail(company_no);
		//companyDTO.company_no, companyDTO.company_name, companyDTO.company_salary, companyDTO.company_user, companyDTO.evaluatino_nightAVG,
		//companyDTO.evaluatino_restAVG, companyDTO.evaluatino_internAVG, companyDTO.evaluatino_vacationAVG
	}
	
	@RequestMapping(value = "/companyCommentView")
	public ModelAndView companyCommentView(@RequestParam("company_no") String company_no, HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("company_no", company_no);
		mav.addObject("userID",request.getSession().getAttribute("userID"));
		mav.setViewName("comComment");
		return mav;
	}
	
	@RequestMapping(value = "/evalDelete")
	public @ResponseBody HashMap<String, Object> companyCommentDelete(@RequestParam("evaluation_no") String evaluation_no){
		logger.info("[evalDelete] evaluation_no : "+ evaluation_no);
		
		return service.evalDelete(evaluation_no);
	}
	
	@RequestMapping(value = "/companyCommentList")
	public @ResponseBody HashMap<String, Object> companyCommentList(@RequestParam HashMap<String, String> params){
		String company_no=params.get("company_no");
		String pagingEnd=params.get("pagingEnd");
		logger.info("[companyCommentView] company_no : "+company_no+" / pagingEnd : "+pagingEnd);
		
		return service.companyCommentList(company_no,pagingEnd);
		//evaluationList[] - evaluation_comment, evaluation_night, evaluation_rest, evaluation_intern, evaluation_vacation
	}
	
	@RequestMapping(value = "/evalForm")
	public ModelAndView evalForm(@RequestParam("company_no") String company_no) {
		logger.info("[evalForm]company_no : "+company_no);
		ModelAndView mav=new ModelAndView();
		mav.addObject("company_no", company_no);
		mav.setViewName("comWrite");
		return mav;
	}
	
	@RequestMapping(value = "/evalWrite")
	public ModelAndView evalWrite(@RequestParam HashMap<String,String> params,  HttpServletRequest request) {
		request.getSession().setAttribute("userID", "worhkddlsp");//나중에 주석처리
		
		String company_no=params.get("company_no");
		
		String member_id= (String) request.getSession().getAttribute("userID");
		params.put("member_id", member_id);
		
		/*String evaluation_year=params.get("evaluation_year");
		String evaluation_salary=params.get("evaluation_salary");*/
		String evaluation_night=params.get("evaluation_night");
		String evaluation_rest=params.get("evaluation_rest");
		String evaluation_intern= params.get("evaluation_intern");
		String evaluation_vacation= params.get("evaluation_vacation");
		String evaluation_comment=params.get("evaluation_comment");
		
		logger.info("[evalWrite] params(9개)");
		logger.info(company_no+"/"+member_id+"/"+evaluation_night+"/"+evaluation_rest+"/"+evaluation_intern+"/"+evaluation_vacation+"/"+evaluation_comment);
		return service.evalWrite(params);
	}
	
	@RequestMapping(value = "/evalUpdateForm")
	public ModelAndView evalUpdateForm (@RequestParam("evaluation_no") String evaluation_no) {
		logger.info("[evalUpdateForm] evaluation_no : "+evaluation_no);
		return service.evalUpdateForm(evaluation_no);
		//companyDTO.company_name, evaluationDTO.evaluation_night, evaluationDTO.evaluation_rest, 
		//evaluationDTO.evaluation_intern, evaluationDTO.evaluation_vacation, evaluationDTO.evaluation_comment
	}
	
	@RequestMapping(value = "/evalUpdate")
	public ModelAndView evalUpdate(@RequestParam HashMap<String,String> params) {
		String evaluation_no=params.get("evaluation_no");
		String evaluation_night=params.get("evaluation_night");
		String evaluation_rest=params.get("evaluation_rest");
		String evaluation_intern=params.get("evaluation_intern");
		String evaluation_vacation=params.get("evaluation_vacation");
		String evaluation_comment=params.get("evaluation_comment");
		
		logger.info("[evalWrite] params(6개)");
		return service.evalUpdate(params);
		//(int)success
	}
	
}
