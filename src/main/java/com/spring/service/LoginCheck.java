package com.spring.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheck extends HandlerInterceptorAdapter {

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("Controller 요청 전에 실행 - 로그인 체크");
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("loginId");
		String requestUrl = request.getRequestURL().toString();
		System.out.println(requestUrl);
		// 비 로그인 시 메인 화면으로 이동
		if(obj == null) {
			response.sendRedirect("./");
			return false;
		}
		
		return true;
	}
}
