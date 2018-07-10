package com.spring.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

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
			dto.setJob_no(Integer.parseInt(String.valueOf(map.get("job_no"))));
			dto.setMember_company(String.valueOf(map.get("company")));
		} 
		
		dto.setMember_div(String.valueOf(map.get("member_div")));
		
		inter = sqlSession.getMapper(MemberInter.class);
		success = inter.join(dto);
		
		mav.addObject("msg", "회원가입에 실패했습니다.");
		
		if(success > 0) {
			mav.setViewName("redirect:/");
			mav.addObject("msg", "회원가입에 성공했습니다.");
		}
		
		return mav;
	}

	/* 로그인 요청 */
	public ModelAndView memlogin(String id, String pw, HttpSession session) {
		inter = sqlSession.getMapper(MemberInter.class);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		MemberDTO dto = new MemberDTO();
		
		dto = inter.login(id);
		String hash = dto.getMember_pw();				// 암호화된 pw 가져옴
		String member_div = dto.getMember_div();	// 사용자 권한 가져옴
		
		boolean success = encoder.matches(pw, hash);		// 입력한 pw와 암호화된 pw 비교

		ModelAndView mav = new ModelAndView();
		String msg = "로그인 실패";
		
		if(success) {
			msg = "로그인 성공";
			mav.setViewName("redirect:/");
			session.setAttribute("loginId", id);
			session.setAttribute("member_div", member_div);
		}
		
		mav.addObject("msg", msg);
		
		return mav;
	}

	public ModelAndView checkPW(String userId, String userPw) {
		inter = sqlSession.getMapper(MemberInter.class);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		String hash = inter.login(userId);
		boolean success = encoder.matches(userPw, hash);
		
		ModelAndView mav = new ModelAndView();
		String msg = "비밀번호를 다시 입력해 주세요.";
		
		if(success) {
			mav.setViewName("redirect:/pageMove?page=perUpdate");
		}
		return mav;
	}
}
