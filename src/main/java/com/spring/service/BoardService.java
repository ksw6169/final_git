package com.spring.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.BoardInter;
import com.spring.dto.BoardDTO;
import com.spring.dto.ReplyDTO;
@Service
public class BoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SqlSession sqlSession;
	
	BoardInter inter  = null;
	String photo = null;

	// 김대리의 한마디 글 리스트 요청(페이징 완료)
	public HashMap<String, Object> kimSayList(@RequestParam HashMap<String, Object> params) {
		logger.info("김대리의 한마디 리스트 서비스 접근");
		inter = sqlSession.getMapper(BoardInter.class);
		
		/* 수정 - 0717 성원 */
		int job_no = Integer.parseInt((String) params.get("job_no"));
		int startPage = Integer.parseInt((String) params.get("startPage"));
		int endPage = Integer.parseInt((String) params.get("endPage"));
		String align_div = String.valueOf(params.get("align_div"));
		
		logger.info("변수 확인: "+job_no+"/"+startPage+"/"+endPage+"/"+align_div);
		
		ArrayList<BoardDTO> list = inter.kimSayList(job_no, startPage, endPage, align_div);
		int listCnt = inter.kimSayListCnt(job_no);
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("list", list);
		resultMap.put("listCnt", listCnt);
		
		return resultMap;
	}
	
	//상세보기(조회수 올리기 + 상세보기)
	//트랜잭션 처리 요구 구간
	@Transactional
	public ModelAndView kimSayDetail(String board_no) {
		inter = sqlSession.getMapper(BoardInter.class);	
		logger.info("상세보기");
		ModelAndView mav = new ModelAndView();
		inter.upHit(board_no);
		mav.addObject("board", inter.kimSayDetail(board_no));
		mav.setViewName("kimSayDetail");
		return(mav);
	}
	
	//김대리의 한마디 글 작성
	public ModelAndView kimSayWrite(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView();
		String category = params.get("category");
		String member_id = params.get("member_id");
		String board_content = params.get("board_content");
		String board_title = params.get("board_title");
		int job_no = Integer.parseInt(params.get("job_no"));
		
		logger.info("잡넘버: "+job_no);
		logger.info("ID : "+member_id);
		logger.info(member_id+"/"+category+"/"+board_content+"/"+board_title);//logger는 문자열만 가능, 숫자 뽑아오려면 뒤에 문자열 추가
		inter = sqlSession.getMapper(BoardInter.class);
		String page = "redirect:/";
		//2. 수정 쿼리 실행
		int success = inter.kimSayWrite(category, board_title, board_content, member_id, job_no);
		if(success > 0) {
			page = "kimSayList";
		}
		mav.setViewName(page);
		return mav;
	}
	
	//김대리의 한마디 수정 폼
	public ModelAndView kimSayUpdateForm(String board_no) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInter.class);
		mav.addObject("board", inter.kimSayDetail(board_no));
		mav.setViewName("kimSayUpdate");
		return mav;
	}
	
	//김대리의 한마디 게시글 삭제
	public ModelAndView kimSayDelete(String board_no) {
		logger.info("게시글 삭제 서비스");
		inter = sqlSession.getMapper(BoardInter.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("board", inter.kimSayDelete(board_no));
		mav.setViewName("kimSayList");
		return mav;
	}
	
	//김대리의 한마디 게시글 수정
	public ModelAndView kimSayUpdate(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView();
		//1. 파라메터 값을 받아온다.
		String category = params.get("category");
		String board_no = params.get("board_no");
		String board_content = params.get("board_content");
		String board_title = params.get("board_title");
		logger.info(board_no+"/"+board_content+"/"+board_title);//logger는 문자열만 가능, 숫자 뽑아오려면 뒤에 문자열 추가
		inter = sqlSession.getMapper(BoardInter.class);
		String page = "redirect:/kimSayDetail?board_no="+board_no;
		//2. 수정 쿼리 실행
		int success = inter.kimSayUpdate(category, board_title, board_content, board_no);
		if(success > 1) {
			page = "redirect:/kimSayUpdateForm?board_no="+board_no;
		}
		mav.setViewName(page);
		return mav;
	}
	
	//공지사항 리스트 
	public HashMap<String, Object> nBoardList(Map<String, Object> param) {	
		logger.info("공지사항 list 서비스 요청");
		inter = sqlSession.getMapper(BoardInter.class);
		HashMap<String , Object> map = new HashMap<String , Object>();
		ArrayList<BoardDTO> nBoardList = inter.nBoardList(param);
		int listAll = inter.listCnt(param);
		map.put("nBoardList", nBoardList);
		map.put("listAll", listAll);
		return map;
	}

	public ModelAndView nBoardWrite(HashMap<String, String> map) {
		logger.info("공지사항 작성 서비스 요청");
		inter = sqlSession.getMapper(BoardInter.class);
		ModelAndView mav = new ModelAndView();
		BoardDTO dto = new BoardDTO();
		//아이디, 번호, 제목, 내용 => dto
		dto.setMember_id(map.get("member_id"));
		dto.setBoard_title(map.get("board_title"));
		dto.setBoard_content(map.get("board_content"));
		int success=inter.nBoardWrite(dto);
		String page = "noticeWrite";
		
		if(success>0) { //글작성 성공시 
			page = "noticeList";
		}
		mav.setViewName(page);
		return mav;
	}

	//내가 쓴 글 리스트
	public HashMap<String, Object> myWriteList(Map<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>(); //담아서 보낼 HashMap 생성
		inter = sqlSession.getMapper(BoardInter.class);
		/*int sNum = Integer.parseInt(params.get("sNum"));
		int eNum = Integer.parseInt(params.get("eNum"));*/
		ArrayList<BoardDTO> list = inter.myWriteList(params); //ArrayList로 해당 아이디가 쓴 글 담기
		logger.info(""+list.size());
		int listCnt = inter.myWriteListCnt(params); //페이징을 위해 글 갯수 가져옴
		map.put("list", list); //보낼 리스트를 담음
		map.put("listCnt", listCnt); //글 갯수 담음
		return map;
	}

	//내가 쓴 댓글리스트
	public HashMap<String, Object> myReplyList(Map<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();//담아서 보낼 HashMap 생성
		inter = sqlSession.getMapper(BoardInter.class);
		ArrayList<BoardDTO> list = inter.myReplyList(params);//ArrayList로 해당 아이디가 쓴 글 담기
		logger.info(""+list.size());
		int listCnt = inter.myReplyListCnt(params);//페이징을 위해 글 갯수 가져옴
		map.put("list", list);//보낼 리스트를 담음
		map.put("listCnt", listCnt);//글 갯수 담음
		return map;
	}

	public ModelAndView nBoardDetail(String board_no) {
		logger.info("공지사항 상세보기 서비스");
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInter.class);
		inter.upHit(board_no);
		mav.addObject("board", inter.nBoardDetail(board_no));
		mav.setViewName("noticeDetail");
		
		return mav;
	}

	public ModelAndView nBoardDelete(String board_no) {
		logger.info("공지사항 삭제 서비스");
		inter = sqlSession.getMapper(BoardInter.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("board", inter.nBoardDelete(board_no));
		mav.setViewName("noticeList");
		return mav;
	}

	//수정폼 이동
	public ModelAndView nBoardUpdateForm(String board_no) {
		inter = sqlSession.getMapper(BoardInter.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("board", inter.nBoardDetail(board_no));
		mav.setViewName("noticeUpdate");
		return mav;
	}

	@Transactional
	public ModelAndView nBoardUpdate(HashMap<String, String> map) {
		logger.info("공지사항 수정하기 서비스");
		inter = sqlSession.getMapper(BoardInter.class);
		ModelAndView mav = new ModelAndView();
		
		String page = "redirect:/nBoardUpdateForm?board_no="+map.get("board_no");
		int success = inter.nBoardUpdate(map);
		if(success > 0) {
			page = "redirect:/nBoardDetail?board_no="+map.get("board_no"); 
		}		
		mav.addObject("success", success);
		mav.setViewName(page);
		return mav;
	}

	/* 추천수 요청 */
	public HashMap<String, Object> likeCount(Map<String, String> params) {
		inter = sqlSession.getMapper(BoardInter.class);
		String loginId = String.valueOf(params.get("loginId"));
		int board_no = Integer.parseInt(params.get("board_no"));

		// 1) 내가 추천 했는지 여부
		boolean myLike;
		if(inter.myLikeCount(loginId, board_no) > 0) {
			myLike = true;
		} else {
			myLike = false;
		}
		
		logger.info(loginId+" / "+board_no);
		// 2) 게시글의 추천수 가져오기
		int likeCount = inter.likeCount(board_no);
		
		logger.info("myLike  : "+myLike);
		logger.info("게시물 추천수 : "+likeCount);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("myLike", myLike);
		resultMap.put("likeCount", likeCount);
		
		return resultMap;
	}
	
	
	/* 추천 요청 */
	@Transactional
	public HashMap<String, Object> like(Map<String, String> params) {
		inter = sqlSession.getMapper(BoardInter.class);
		String id = String.valueOf(params.get("loginId"));
		int board_no = Integer.parseInt(params.get("board_no"));
		boolean myLike = Boolean.parseBoolean(params.get("myLike"));
		
		if(myLike != true) {
			logger.info("recommand 테이블에서 생성 "+inter.myLikeUp(id, board_no));
		} else {
			logger.info("recommand 테이블에서 날림 "+inter.myLikeDown(id, board_no));
		}
		
		logger.info("추천수 증가 or 감소: "+inter.upLike(myLike, board_no));

		boolean like;
		if(inter.myLikeCount(id, board_no) > 0) {
			like = true;
		} else {
			like = false;
		}
		int likeCount = inter.likeCount(board_no);
		
		HashMap<String, Object> resultMap = new HashMap<>();

		resultMap.put("likeCount", likeCount);
		resultMap.put("like", like);
		
		return resultMap;
	}

	/* 댓글 작성 */
	@Transactional
	public HashMap<String, Object> replyWrite(Map<String, String> params) {
		inter = sqlSession.getMapper(BoardInter.class);
		String loginId = String.valueOf(params.get("loginId"));
		int board_no = Integer.parseInt(params.get("board_no"));
		String replyContent = String.valueOf(params.get("reply_content"));
		//String reply_content = params.get("reply_content");
		logger.info("아이디 : "+loginId+"/ 게시글 번호 : "+board_no+"/ 댓글 내용 : "+replyContent);
		int success = 0;
		
		// 1) 댓글 수 증가
		success = inter.replyCountUp(board_no);
		logger.info("댓글 수 증가 성공여부 : "+success);
		
		// 2) 댓글 테이블에 등록
		success = inter.replyWrite(loginId, board_no, replyContent);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		logger.info("reply_content : "+replyContent);
		
		resultMap.put("msg", "댓글 작성 실패");
		if(success > 0) {
			resultMap.put("msg", "댓글 작성 성공");
		}
		
		return resultMap;
	}

	/* 댓글 리스트 요청 */
	public HashMap<String, Object> replyList(Map<String, String> params) {
		HashMap<String, Object> resultMap = new HashMap<>();
		inter = sqlSession.getMapper(BoardInter.class);
		
		ArrayList<ReplyDTO> list = inter.replyList(Integer.parseInt(params.get("board_no")));
		resultMap.put("list", list);
		
		return resultMap;
	}

	/* 댓글 수정 요청 */
	public HashMap<String, Object> replyUpdate(Map<String, String> params) {
		HashMap<String, Object> resultMap = new HashMap<>();
		inter = sqlSession.getMapper(BoardInter.class);
		int reply_no = Integer.parseInt(params.get("reply_no"));
		String reply_content = String.valueOf(params.get("reply_content"));
		
		int success = 0;
		
		success = inter.replyUpdate(reply_no, reply_content);

		resultMap.put("msg", "댓글 수정에 실패했습니다.");
		if(success > 0) {
			resultMap.put("msg", "댓글 수정에 성공했습니다.");
		}
		
		return resultMap;
	}

	/* 댓글 삭제 요청 */
	@Transactional
	public HashMap<String, Object> replyDelete(Map<String, String> params) {
		HashMap<String, Object> resultMap = new HashMap<>();
		inter = sqlSession.getMapper(BoardInter.class);
		int reply_no = Integer.parseInt(params.get("reply_no"));
		int board_no = Integer.parseInt(params.get("board_no"));
		
		int success = 0;
		
		// 1) 댓글 수 감소
		success = inter.replyCountDown(board_no);
		logger.info("댓글 수 감소 확인 : "+success);
		
		// 2) 댓글 제거
		success = inter.replyDelete(reply_no);
		
		resultMap.put("msg", "댓글 삭제에 실패했습니다.");
		if(success > 0) {
			resultMap.put("msg", "댓글 삭제에 성공했습니다.");
		}
		
		return resultMap;
	}

	/* 검색 요청 */
	public HashMap<String, Object> kimSaySearchList(Map<String, String> params) {
		HashMap<String, Object> resultMap = new HashMap<>();
		inter = sqlSession.getMapper(BoardInter.class);
		String keyword = String.valueOf(params.get("keyword"));
		String board_category = String.valueOf(params.get("category"));
		int job_no = Integer.parseInt(params.get("job_no"));
		int startPage = Integer.parseInt(params.get("startPage"));
		int endPage = Integer.parseInt(params.get("endPage"));
		String align_div = String.valueOf(params.get("align_div"));
		
		ArrayList<BoardDTO> list = inter.kimSaySearchList(keyword, board_category, job_no, startPage, endPage, align_div);
		int listSearchCnt = inter.kimSaySearchListCnt(keyword, board_category, job_no);
		
		resultMap.put("list", list);
		resultMap.put("listSearchCnt", listSearchCnt);
		
		return resultMap;
	}

	
	
	
	/* 모르면 물어봐 리스트 */
	public HashMap<String, Object> qnaList(HashMap<String, Object> params) {
		logger.info("모르면 물어봐 서비스 접근");
		inter = sqlSession.getMapper(BoardInter.class);
		
		String board_category = String.valueOf(params.get("board_category"));
		int startPage = Integer.parseInt((String) params.get("startPage"));
		int endPage = Integer.parseInt((String) params.get("endPage"));
		String align_div = String.valueOf(params.get("align_div"));
		
		logger.info("변수 확인: "+board_category+"/"+startPage+"/"+endPage+"/"+align_div);
		
		ArrayList<BoardDTO> list = inter.qnaList(board_category, startPage, endPage, align_div);
		int listCnt = inter.qnaListCnt();
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("list", list);
		resultMap.put("listCnt", listCnt);
		
		return resultMap;
	}

	public HashMap<String, Object> qnaSearchList(Map<String, String> params) {
		HashMap<String, Object> resultMap = new HashMap<>();
		inter = sqlSession.getMapper(BoardInter.class);
		String keyword = String.valueOf(params.get("keyword"));
		int startPage = Integer.parseInt(params.get("startPage"));
		int endPage = Integer.parseInt(params.get("endPage"));
		String align_div = String.valueOf(params.get("align_div"));
		
		ArrayList<BoardDTO> list = inter.qnaSearchList(keyword, startPage, endPage, align_div);
		int listSearchCnt = inter.qnaSearchListCnt(keyword);
		
		resultMap.put("list", list);
		resultMap.put("listSearchCnt", listSearchCnt);
		
		return resultMap;
	}
	
	/* 모르면 물어봐 글 작성 */
	public ModelAndView qnaWrite(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView();
		String member_id = params.get("member_id");
		String board_content = params.get("board_content");
		String board_title = params.get("board_title");
		String board_category = params.get("board_category");
		
		logger.info("ID : "+member_id);
		logger.info(member_id+"/"+board_content+"/"+board_title+"/"+board_category);//logger는 문자열만 가능, 숫자 뽑아오려면 뒤에 문자열 추가
		inter = sqlSession.getMapper(BoardInter.class);
		String page = "redirect:/";
		//2. 수정 쿼리 실행
		int success = inter.qnaWrite(board_title, board_content, member_id, board_category);
		if(success > 0) {
			page = "qnaList";
		}
		mav.setViewName(page);
		return mav;
	}
	
	/* 모르면 물어봐 상세보기 */
	public ModelAndView qnaDetail(String board_no) {
		inter = sqlSession.getMapper(BoardInter.class);	
		logger.info("상세보기");
		ModelAndView mav = new ModelAndView();
		inter.upHit(board_no);
		mav.addObject("board", inter.qnaDetail(board_no));
		mav.setViewName("qnaDetail");
		return(mav);
	}
	
	/* 모르면 물어봐 글 수정폼 */
	public ModelAndView qnaUpdateForm(String board_no) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInter.class);
		mav.addObject("board", inter.qnaDetail(board_no));
		mav.setViewName("qnaUpdate");
		return mav;
	}
	
	//모르면 물어봐 게시글 수정
	public ModelAndView qnaUpdate(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView();
		//1. 파라메터 값을 받아온다.
		String board_no = params.get("board_no");
		String board_content = params.get("board_content");
		String board_title = params.get("board_title");
		logger.info(board_no+"/"+board_content+"/"+board_title);//logger는 문자열만 가능, 숫자 뽑아오려면 뒤에 문자열 추가
		inter = sqlSession.getMapper(BoardInter.class);
		String page = "redirect:/qnaDetail?board_no="+board_no;
		//2. 수정 쿼리 실행
		int success = inter.qnaUpdate(board_title, board_content, board_no);
		if(success > 1) {
			page = "redirect:/qnaUpdateForm?board_no="+board_no;
		}
		mav.setViewName(page);
		return mav;
	}

	public ModelAndView qnaDelete(String board_no) {
		logger.info("게시글 삭제 서비스");
		inter = sqlSession.getMapper(BoardInter.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("board", inter.qnaDelete(board_no));
		mav.setViewName("qnaList");
		return mav;
	}
}
