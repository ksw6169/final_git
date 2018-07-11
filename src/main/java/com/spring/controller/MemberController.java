package com.spring.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	
	/* main 페이지 이동 */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletResponse response) {
		logger.info("메인 페이지 접속");		
		return "main";
	}

	/* 단순 페이지 이동(로그인 체크가 필요없는 홈, 로그인, 회원가입 페이지 제외) */
	@RequestMapping(value="/pageMove") 
	public String pageMove(@RequestParam("page") String pageName) {
		logger.info(pageName+" 페이지 이동");
		return pageName;
	}
	
	/* main 페이지 이동 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "redirect:/main";
	}
	
	/* main 페이지 이동 */
	@RequestMapping(value = "/main")
	public String main() {
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
	// 인자가 추가로 있다면, 대리 회원가입으로
	@RequestMapping(value = "/join")
	public @ResponseBody HashMap<String, Integer> join(@RequestParam HashMap<String, Object> map) {
		logger.info("회원가입 요청");
		// logger.info("파일 테스트 : "+String.valueOf(map.get("file")));
		
		return service.join(map);
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
		logger.info(userId);
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
	
	@RequestMapping(value = "/memUpload")
	public ModelAndView memUpload(MultipartFile file, HttpSession session) {
		logger.info("파일 업로드 요청");
		String root = session.getServletContext().getRealPath("/");
		
		return service.memUpload(file, root);
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
}
