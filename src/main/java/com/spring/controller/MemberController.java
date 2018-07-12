package com.spring.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.MemberService;


@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired MemberService service;

	/* 단순 페이지 이동(로그인 체크가 필요없는 홈, 로그인, 회원가입 페이지 제외) */
	@RequestMapping(value="/pageMove") 
	public String pageMove(@RequestParam("page") String pageName) {
		logger.info(pageName+" 페이지 이동");
		return pageName;
	}
	
	/* main 페이지 이동 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main";
	}
	
	/* 로그인 페이지 이동 */
	@RequestMapping(value = "/loginForm")
	public String loginForm() {
		logger.info("로그인 페이지 이동");
		return "login";
	}
	
	/* 회원가입 페이지 이동 */
	@RequestMapping(value = "/joinForm")
	public String joinForm() {
		logger.info("회원가입 페이지 이동");
		return "join";
	}
	
	/* 인턴 회원가입 페이지 이동 */
	@RequestMapping(value = "/iJoinForm")
	public String iJoinForm() {
		logger.info("인턴 회원가입 페이지 이동");
		return "iJoin";
	}
	
	/* 대리 회원가입 페이지 이동 */
	@RequestMapping(value = "/dJoinForm")
	public String dJoinForm() {
		logger.info("대리 회원가입 페이지 이동");
		return "dJoin";
	}
	
	/* 회원가입 요청 */
	@RequestMapping(value = "/join")
	public @ResponseBody HashMap<String, Integer> join(MultipartFile file, HttpSession session, @RequestParam HashMap<String, Object> map) {
		logger.info("회원가입 요청");
		String root = session.getServletContext().getRealPath("/");
		
		return service.join(root, file, map);
	}
	
	/* 로그인 요청 */
	@RequestMapping(value = "/login")
	public ModelAndView memlogin(@RequestParam String id, String pw, HttpSession session) {
		logger.info("로그인 요청");
		return service.memlogin(id, pw, session);
	}
	
	/* 로그아웃 요청 */
	@RequestMapping(value = "/logout")
	public ModelAndView memlogout(HttpSession session) {
		logger.info("로그아웃 요청");
		session.removeAttribute("loginId");
		session.removeAttribute("member_div");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "로그아웃 되었습니다.");
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
	/* 회원가입 시, ID 중복 확인 요청 */
	@RequestMapping(value = "/overlay")
	public @ResponseBody HashMap<String, String> overlay(@RequestParam("id") String id) {
		logger.info("ID 중복 확인 요청");
		
		return service.overlay(id);
	}
	
	/*마이페이지 비밀번호 체크*/
	@RequestMapping(value = "/checkPW")
	public ModelAndView checkPW(HttpServletRequest request, @RequestParam("userPw") String userPw) {
		logger.info("비밀번호 체크 요청");
		
		String userId = (String) request.getSession().getAttribute("loginId");
		return service.checkPW(userId, userPw);
	}
	
	/*마이페이지 개인정보 수정 폼*/
	@RequestMapping(value = "/perUpdateForm")
	public ModelAndView perUpdateForm(HttpServletRequest request) {
		logger.info("개인정보 수정 페이지 요청");
		
		String userId = (String) request.getSession().getAttribute("loginId");
		logger.info(userId);
		return service.perUpdateForm(userId);
	}
	
	/*마이페이지 개인정보 수정*/
	@RequestMapping(value = "/perUpdate")
	public ModelAndView perUpdate(HttpServletRequest request, @RequestParam HashMap<String, String> map) {
		logger.info("개인정보 수정 요청");
		
		String userId = (String) request.getSession().getAttribute("loginId");
		map.put("id", userId);
		logger.info(userId);
		return service.perUpdate(map);
	}
	
	/*마이페이지 회원탈퇴*/
	@RequestMapping(value = "/outMem")
	public ModelAndView outMem(HttpServletRequest request) {
		logger.info("회원탈퇴 요청");
		
		String userId = (String) request.getSession().getAttribute("loginId");
		logger.info(userId);
		return service.outMem(userId);
	}
	
	/*회사 정보 수정*/
	@RequestMapping(value = "/companyUpdate")
	public ModelAndView companyUpdate(MultipartFile file, HttpSession session, @RequestParam("companyName") String companyName, @RequestParam("jobSel") String jobSel) {
		logger.info("회사 정보 수정");
		logger.info(companyName);
		String id = (String) session.getAttribute("loginId");
		String root = session.getServletContext().getRealPath("/");
		return service.companyUpdate(file, root, companyName, jobSel ,id);
	}
	
	/*회사 승인 리스트*/
	@RequestMapping(value = "/memAcceptList")
	public @ResponseBody HashMap<String, Object> memAcceptList(HttpSession session, @RequestParam Map<String, String> params) {
		logger.info("회사 승인 리스트 요청");
		String div = (String) session.getAttribute("member_div");
		if(div.equals("관리자")) {
			return service.memAcceptList(params);
		}else {
			HashMap<String, Object> map = new HashMap<>();
			map.put("msg", "관리자 아이디가 아닙니다.");
			return map;
		}
	}
	
	/*회사 승인 상세보기*/
	@RequestMapping(value = "/memAcceptDetail")
	public ModelAndView memAcceptDetail (HttpSession session, @RequestParam("id") String id) {
		logger.info("회사 승인 상세보기 요청");
		String div = (String) session.getAttribute("member_div");
		if(!div.equals("관리자")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/");
			return mav;
		}else {
			return service.memAcceptDetail(id);
		}
	}
	
	/*회사 승인*/
	@RequestMapping(value = "/memAcceptOk")
	public String memAcceptOk (HttpSession session, @RequestParam("id") String id) {
		logger.info("회사 승인 요청");
		String div = (String) session.getAttribute("member_div");
		if(!div.equals("관리자")) {
			return "/";
		}else {
			String root = session.getServletContext().getRealPath("/");
			return service.memAcceptOk(id, root);
		}
	}
	
	/*회사 승인 거부 페이지*/
	@RequestMapping(value = "/reqEmail")
	public ModelAndView reqEmail (HttpSession session, @RequestParam("id") String id) {
		logger.info("회사 승인 상세보기 요청");
		String div = (String) session.getAttribute("member_div");
		if(!div.equals("관리자")) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/");
			return mav;
		}else {
			return service.reqEmail(id);
		}
	}
	
	/*회사 승인 거부 */
	@RequestMapping(value = "/memAcceptNo")
	public @ResponseBody HashMap<String, Object> memAcceptNo(HttpSession session, @RequestParam Map<String, String> params) {
		logger.info("회사 승인 리스트 요청");
		String div = (String) session.getAttribute("member_div");
		if(div.equals("관리자")) {
			String root = session.getServletContext().getRealPath("/");
			return service.memAcceptNo(params, root);
		}else {
			HashMap<String, Object> map = new HashMap<>();
			map.put("msg", "관리자 아이디가 아닙니다.");
			return map;
		}
	}
}
