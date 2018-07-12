package com.spring.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.spring.dao.CompanyInter;
import com.spring.dao.MemberInter;
import com.spring.dto.CompanyDTO;
import com.spring.dto.EvaluationDTO;
import com.spring.dto.MemberDTO;

@Service
public class CompanyService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	SqlSession sqlSession;

	CompanyInter inter = null;

	public void main() {
		logger.info("CompanyService 접속");

	}

	public HashMap<String, Object> companyList(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		inter = sqlSession.getMapper(CompanyInter.class);
		ArrayList<CompanyDTO> list = inter.companyList(params);
		map.put("companyList", list);

		return map;
	}

	@Transactional
	public ModelAndView companyDetail(String company_no, String member_id) {
		ModelAndView mav = new ModelAndView();
		if (certCheck(member_id)) {
			mav.addObject("msg", "기업 인증을 진행하지 않으셨습니다.");
			mav.setViewName("howComList");

			return mav;
		}

		inter = sqlSession.getMapper(CompanyInter.class);
		CompanyDTO companyDTO = inter.companyDetail(company_no);
		ArrayList<EvaluationDTO> list = inter.companyCommentList(company_no, null);
		inter.companyUpHit(company_no);

		float night = 0;
		float rest = 0;
		float intern = 0;
		float vacation = 0;
		for (EvaluationDTO dto : list) {
			night += dto.getEvaluation_night();
			rest += dto.getEvaluation_rest();
			intern += dto.getEvaluation_intern();
			vacation += dto.getEvaluation_vacation();
		}

		if (list.size() != 0) {
			companyDTO.setEvaluatino_nightAVG(Math.round(night / list.size()));
			companyDTO.setEvaluatino_restAVG(Math.round(rest / list.size()));
			companyDTO.setEvaluatino_internAVG(Math.round(intern / list.size()));
			companyDTO.setEvaluatino_vacationAVG(Math.round(vacation / list.size()));
		}

		mav.addObject("companyDTO", companyDTO);
		mav.setViewName("comDetail");
		return mav;
	}

	public HashMap<String, Object> companyCommentList(String company_no, String pagingEnd) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		inter = sqlSession.getMapper(CompanyInter.class);
		ArrayList<EvaluationDTO> list = inter.companyCommentList(company_no, pagingEnd);

		map.put("evaluationList", list);
		return map;
	}

	// 회원 기업 평가 여부 추가해야함
	@Transactional
	public ModelAndView evalWrite(HashMap<String, String> params) {
		EvaluationDTO dto = new EvaluationDTO();
		dto.setCompany_no(Integer.parseInt(params.get("company_no")));
		dto.setMember_id(params.get("member_id"));
		/*
		 * dto.setEvaluation_year(Integer.parseInt(params.get("evaluation_year")));
		 * dto.setEvaluation_salary(Integer.parseInt(params.get("evaluation_salary")));
		 */
		dto.setEvaluation_night(Integer.parseInt(params.get("evaluation_night")));
		dto.setEvaluation_rest(Integer.parseInt(params.get("evaluation_rest")));
		dto.setEvaluation_intern(Integer.parseInt(params.get("evaluation_intern")));
		dto.setEvaluation_vacation(Integer.parseInt(params.get("evaluation_vacation")));
		dto.setEvaluation_comment(params.get("evaluation_comment"));

		inter = sqlSession.getMapper(CompanyInter.class);
		int success = inter.evalWrite(dto);
		String page = "comWrite";
		if (success > 0) {
			inter.memberEvalCnt(dto.getMember_id(), 1);
			inter.evalCnt(dto.getCompany_no(), 1);
			page = "redirect:./companyCommentView?company_no=" + dto.getCompany_no();

		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);

		return mav;
	}

	public ModelAndView evalUpdateForm(String evaluation_no) {
		inter = sqlSession.getMapper(CompanyInter.class);
		EvaluationDTO evaluationDTO = inter.evalUpdateForm(evaluation_no);

		ModelAndView mav = new ModelAndView();
		if (evaluationDTO != null) {
			CompanyDTO companyDTO = inter.companyDetail(String.valueOf(evaluationDTO.getCompany_no()));
			mav.addObject("evaluationDTO", evaluationDTO);
			mav.addObject("companyDTO", companyDTO);
		}

		mav.setViewName("comUpdate");

		return mav;
	}

	public ModelAndView evalUpdate(HashMap<String, String> params) {
		inter = sqlSession.getMapper(CompanyInter.class);

		int success = inter.evalUpdate(params);
		String page = "redirect:./evalUpdateForm?evaluation_no=" + params.get("evaluation_no");
		if (success > 0) {
			page = "redirect:./companyCommentView?company_no=" + params.get("company_no");
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("success", success);
		mav.setViewName(page);

		return mav;
	}

	@Transactional
	public HashMap<String, Object> evalDelete(String evaluation_no, String member_id) {
		inter = sqlSession.getMapper(CompanyInter.class);
		EvaluationDTO dto = inter.evalUpdateForm(evaluation_no);
		int success = inter.evalDelete(evaluation_no);

		if (success > 0) {
			inter.memberEvalCnt(member_id, -1);
			inter.evalCnt(dto.getCompany_no(), -1);
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", success);

		return map;
	}

	public HashMap<String, Object> evalCheck(String company_no, String member_id, String member_div) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Boolean success = false;
		String msg = "DB 조회 오류!";
		if (member_div.equals("관리자")) {
			success = true;
		} else {
			
			inter = sqlSession.getMapper(CompanyInter.class);
			CompanyDTO companyDTO = inter.companyDetail(company_no);

			MemberInter memberInter = sqlSession.getMapper(MemberInter.class);
			MemberDTO memberDTO = memberInter.member(member_id);
			if (!memberDTO.getMember_cert().equals("Y")) {
				msg = "기업 인증을 진행하지 않으셨습니다.";
			} else if (Integer.parseInt(memberDTO.getMember_eval()) > 0) {
				msg = "이미 기업평가를 하셨습니다.";
			} else if (!companyDTO.getCompany_name().equals(memberDTO.getMember_company())) {
				msg = "해당 기업의 직원으로 인증되지 않으셨습니다.";
			} else {
				success = true;
			}
		}
		map.put("success", success);
		map.put("msg", msg);
		
		return map;
	}

	public boolean certCheck(String member_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Boolean success = false;

		MemberInter memberInter = sqlSession.getMapper(MemberInter.class);
		MemberDTO memberDTO = memberInter.member(member_id);

		if (memberDTO.getMember_cert() == null || !memberDTO.getMember_cert().equals("Y")) { // 실제 구동시 &조건 삭제 해야함
			success = true;
		}

		return success;
	}

	public HashMap<String, Object> companyWrite(String company_name) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		logger.info("openAPI 실행!");
		CompanyDTO companyDTO = openAPI(company_name, null);
		logger.info("openAPI 종료!");

		if (companyDTO != null) {
			inter = sqlSession.getMapper(CompanyInter.class);
			int success = inter.companyWrite(companyDTO);
			if (success > 0) {
				map.put("success", true);
				map.put("company_name", companyDTO.getCompany_name());
			}
		} else {
			map.put("success", false);
			map.put("msg", "회사명을 재입력해주세요.");
		}

		return map;
	}

	// 회사명이 잘못됬거나 exception 시 null 반환
	public CompanyDTO openAPI(String companyName, String companyNum) { // 회사명, 사업자번호(앞자리6자)
		CompanyDTO dto = null;

		String addr = "http://apis.data.go.kr/B552015/NpsBplcInfoInqireService/getBassInfoSearch";
		String serviceKey = "VthZIBoSyW7Y1PT4scsIWQw5px3VOj1pr5aawkg0Pn3sKP2zNSYuhDR1qN1v7WC0UrNRarwwSFxwQ%2FwMIiNf%2Fg%3D%3D";
		String encodingName = "";
		try {
			encodingName = URLEncoder.encode(companyName, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}

		String param = "wkpl_nm=" + encodingName;
		param = param + "&" + "numOfRows=12"; // 데이터 12개:18초 , 데이터 1개:19초
		param = param + "&" + "serviceKey=" + serviceKey;

		if (!(companyNum == null || companyNum.equals(""))) {
			param = param + "&" + "bzowr_rgst_no=" + companyNum;
		}

		addr = addr + "?" + param;
		// System.out.println("addr : " + addr);

		try {
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder;
			dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(addr);

			// root tag
			doc.getDocumentElement().normalize(); // Dom tree -> XML 정규화
			// System.out.println("Root element: " +
			// doc.getDocumentElement().getNodeName());

			// 파싱할 tag
			NodeList nList = doc.getElementsByTagName("item");
			// System.out.println("파싱할 리스트 수 : "+ nList.getLength());

			int dataCrtYm = 0;// 기준 연월
			String seq = "";// 기준 seq번호
			String company_name = "";// 기준 회사명

			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					if (dataCrtYm < Integer.parseInt(getTagValue("dataCrtYm", eElement))) {
						seq = getTagValue("seq", eElement);
						company_name = getTagValue("wkplNm", eElement);
						dataCrtYm = Integer.parseInt(getTagValue("dataCrtYm", eElement));
					}
				}
			}
			// System.out.println("최종 seq : "+seq);
			// System.out.println("최종 기준년월 : "+dataCrtYm);

			String subAddr = "http://apis.data.go.kr/B552015/NpsBplcInfoInqireService/getDetailInfoSearch";
			String subParam = "seq=" + seq;
			subParam = subParam + "&" + "serviceKey=" + serviceKey;
			subAddr = subAddr + "?" + subParam;

			Document Subdoc = dBuilder.parse(subAddr);
			Subdoc.getDocumentElement().normalize(); // Dom tree -> XML 정규화
			nList = Subdoc.getElementsByTagName("item");
			if (nList.getLength() > 0) {
				Node sub_nNode = nList.item(nList.getLength() - 1);
				Element sub_eElement = (Element) sub_nNode;
				int company_user = Integer.parseInt(getTagValue("jnngpCnt", sub_eElement));
				int company_money = Integer.parseInt(getTagValue("crrmmNtcAmt", sub_eElement));
				int company_code = Integer.parseInt(getTagValue("wkplIntpCd", sub_eElement));
				String company_addr = getTagValue("wkplRoadNmDtlAddr", sub_eElement);

				// 국민연금/가입자수*100/9*12=예상평균연봉
				double salary = company_money / company_user * 100 / 9 * 12;
				int company_salary = (int) salary;

				/*
				 * System.out.println("기업명 : "+company_name);
				 * System.out.println("가입자수 : "+company_user);
				 * System.out.println("예상 평균연봉 : "+company_salary);
				 * System.out.println("당월고지금액(국민연금) : "+company_money);
				 * System.out.println("업종코드 : "+company_code);
				 * System.out.println("기업 주소 : "+company_addr);
				 */

				dto = new CompanyDTO();
				dto.setCompany_name(company_name);
				dto.setCompany_salary(company_salary);
				dto.setCompany_user(company_user);
				dto.setCompany_money(company_money);
				dto.setCompany_code(company_code);
				dto.setCompany_addr(company_addr);
				dto.setCompany_bHit(0);

				logger.info("회사정보 입력 성공");
			} else {
				logger.info("데이터가 존재하지 않습니다.(회사명 재입력 필요)");
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("API 실행 오류");
		}
		return dto;
	}

	private String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}

}
