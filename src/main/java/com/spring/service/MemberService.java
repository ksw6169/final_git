package com.spring.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.MemberInter;
import com.spring.dto.MemberDTO;

@Service
public class MemberService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SqlSession sqlSession;
	MemberInter inter  = null;
	String photo = null;
	HashMap<String, String> fileList = new HashMap<String, String>();
	
	/* 인턴, 대리 회원가입 요청 */
	public @ResponseBody HashMap<String, Integer> join(String root, MultipartFile file, HashMap<String, Object> map) {
		int success = 0;	// 회원가입 성공 여부
		HashMap<String, Integer> resultMap = new HashMap<String, Integer>();
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();	
		String hash = encoder.encode(String.valueOf(map.get("pw")));
		
		/* Member Table에 담기 위해 dto에 회원가입 시 입력 받은 사항들 전부 담음 */
		MemberDTO dto = new MemberDTO();
		
		dto.setMember_id(String.valueOf(map.get("id")));
		dto.setMember_pw(hash);
		dto.setMember_email(String.valueOf(map.get("email")));
		dto.setMember_family(String.valueOf(map.get("family")));
		dto.setMember_div(String.valueOf(map.get("member_div")));
		dto.setDiv(String.valueOf(map.get("div")));
		
		/* test - job_no는 대리 회원가입에서만 있으므로, */
		if(String.valueOf(map.get("div")).equals("대리 회원가입 요청")) {
			logger.info("job_no: "+String.valueOf(map.get("job_no")));
			logger.info("되나 안되나..");
			dto.setJob_no(Integer.parseInt(String.valueOf(map.get("job_no"))));
			dto.setMember_company(String.valueOf(map.get("company")));
			
			/* 파일 처리 */
			String fullPath = root+"resources/upload/";
			logger.info("fullPath: " + fullPath);
			
			// 1. 폴더가 없을 경우 폴더 생성
			File dir = new File(fullPath);
			
			if(!dir.exists()) {
				logger.info("폴더 없음 - 폴더 생성");
				dir.mkdir();
			}
			
			// 2. 파일명 추출
			String oriFileName = file.getOriginalFilename();	
			
			// 3. 새로운 파일명 생성(새 파일명 + 확장자)
			String newFileName = System.currentTimeMillis()+oriFileName.substring(oriFileName.lastIndexOf("."));	
			
			// 4. 파일 추출
			try {
				byte[] bytes = file.getBytes();												// MultipartFile에서부터 바이트 추출
				Path filePath = Paths.get(fullPath+newFileName);				// 파일 생성 경로 추출
				Files.write(filePath,  bytes);													// 파일 생성
				fileList.put(newFileName, oriFileName);								// 새 경로, 원 경로 담음
				map.put("path", "resources/upload/"+newFileName);		// test
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			dto.setMember_capture(newFileName);
		} 
		
		
		inter = sqlSession.getMapper(MemberInter.class);
		success = inter.join(dto);
		
		resultMap.put("success", success);
		
		return resultMap;
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

	/*마이페이지 비밀번호 체크*/
	public ModelAndView checkPW(String userId, String userPw) {
		inter = sqlSession.getMapper(MemberInter.class);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		MemberDTO dto = new MemberDTO();
		dto = inter.login(userId);
		String hash = dto.getMember_pw();
		
		boolean success = encoder.matches(userPw, hash);
		
		ModelAndView mav = new ModelAndView();
		String msg = "비밀번호를 다시 입력해 주세요.";
		
		if(success) {
			mav.setViewName("redirect:/perUpdateForm");
		} else {
			mav.addObject("msg", msg);
		}
		
		return mav;
	}

	/* ID 중복 체크 */
	public HashMap<String, String> overlay(String id) {
		inter = sqlSession.getMapper(MemberInter.class);
		int chk = 0;	// 중복 체크 여부
		chk = inter.overlay(id);
		
		String msg = "사용 가능한 ID 입니다."; 	// 중복 체크 메시지
		if(chk == 1) {
			msg = "중복된 ID 입니다.";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("msg", msg);
		
		return map;
	}
	
	/*마이페이지-회원수정페이지*/
	public ModelAndView perUpdateForm(String userId) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(MemberInter.class);
		MemberDTO dto = new MemberDTO();
		dto = inter.member(userId);
		mav.addObject("member", dto);
		mav.setViewName("perUpdate");
		logger.info(dto.getMember_id());
		return mav;
	}

	/*마이페이지 - 회원 수정*/
	public ModelAndView perUpdate(HashMap<String, String> map) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(MemberInter.class);
		if(map.get("pw") != "") { //들어온 비밀번호가 있다면 암호화 해서 map에 다시 넣음
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();	
			String hash = encoder.encode(String.valueOf(map.get("pw")));
			map.put("pw", hash);
		}
		int success = inter.perUpdate(map);
		mav.setViewName("redirect:/perUpdateForm");
		return mav;
	}

	/*회원탈퇴*/
	public ModelAndView outMem(String userId) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(MemberInter.class);
		int success = inter.outMem(userId);
		
		String msg = "회원탈퇴 실패";
		if(success >0) {
			mav.setViewName("redirect:/logout");
			msg = "회원탈퇴 성공";
		}
		mav.addObject("msg", msg);
		return mav;
	}
	
	//회사 정보 수정
	@Transactional
	public ModelAndView companyUpdate(MultipartFile file, String root, String companyName,String jobSel, String id) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(MemberInter.class);
		int success = 0;
		
		String fullPath = root+"resources/upload/"; //세션의 경로와 내가 사진을 넣을 폴더 위치 합치기
		
		//1. 폴더가 없을 경우 폴더를 생성
		File dir = new File(fullPath);//만든 폴더명 넣기
		if(!dir.exists()) {//폴더가 없다면
			logger.info("폴더 없음, 생성 시작");
			dir.mkdir(); //폴더를 생성
		}
		
		//2. 파일명을 추출
		String fileName = file.getOriginalFilename(); //확장자를 뽑기 위해
		
		//3. 새로운 파일명 생성(시간)
		//시스템상의 시간을 밀리세컨트로 한 글과 원래 파일명에서 확장자만을 추출해 합친다(맨뒤의 .이 있는곳)
		String newFileName = System.currentTimeMillis()+fileName.substring(fileName.lastIndexOf(".")); 
		
		//혹시 회원이 관리자가 승인을 하기 전에 파일 업로드를 했는 지 확인
		MemberDTO dto = inter.member(id);
		//만약 있다면
		if(dto.getMember_capture() != null) {
			try {
				String delFile = root+"resources/upload/"+dto.getMember_capture();
				//D:\Spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\09_FileService\resources
				File del = new File(delFile);
				if(del.exists()) { //삭제할 파일이 있으면
					del.delete();
				}else{
					logger.info("이미 삭제된 사진");
				}
			}catch (Exception e) {
				System.out.println(e);
				success = 0;
			}
		}
		//4. 파일 추출
		try {
			byte[] bytes = file.getBytes();//MutipartFile에서부터 바이트 추출
			Path filePath = Paths.get(fullPath+newFileName);
			Files.write(filePath, bytes); //파일을 써줌(자바 7부터 사용가능)
			fileName = newFileName;
			logger.info("저장할 파일 이름  : "+fileName);
			success = inter.companyUpdate(companyName, newFileName,jobSel, id);
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(success >0) {
			mav.setViewName("redirect:/perUpdateForm");
		}
		
		return mav;
	}
}
