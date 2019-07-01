package com.kh.nullLive.board.controller;

import java.io.File;
import java.util.ArrayList;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nullLive.board.model.service.BoardService;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.common.CommonUtils;
import com.kh.nullLive.common.Pagination;
import com.kh.nullLive.common.attachment.model.vo.Attachment;
import com.kh.nullLive.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class BoardController {
	/* 소통센터 : job / 고객센터 : service */
	@Autowired
	private BoardService bs;

	/**
	 * @Author : eon
	 * @Date : 2019. 6. 20.
	 * @Comment : 고객센터 메인화면 호출
	 */
	@RequestMapping("serviceMain.bo")
	public String servicePage() { 
		return "board/service/serviceCenterMain";
	}
	/**
	 * @Author : eon
	 * @Date : 2019. 6. 22.
	 * @Comment : 고객센터 문의화면 호출
	 */
	@RequestMapping("question.bo")
	public String questionPage() {		
		return "board/service/questionForm";
	}

	/**
	 * @Author : eon
	 * @Date : 2019. 6. 22.
	 * @Comment : 고객센터 신고화면 호출
	 */
	@RequestMapping("report.bo")
	public String reportPage() {		
		return "board/service/reportForm";
	}

	/**
	 * @Author : eon
	 * @Date : 2019. 6. 22.
	 * @Comment : 고객센터 나의문의내역 호출
	 */
	@RequestMapping("myQuestion.bo")
	public String myQuestionPage() {		
		return "board/service/myQuestionForm";
	}

	/**
	 * @Author : eon
	 * @Date : 2019. 6. 24.
	 * @Comment : 고객센터에서 로그아웃
	 */
	@RequestMapping("logout.bo")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:serviceMain.bo";
	}

	/**
	 * @author : eon
	 * @date : 2019. 6. 27.
	 * @comment : 고객센터 공지사항 리스트 조회용 메소드
	 */
	@RequestMapping("selectNList.bo")
	public ResponseEntity<HashMap<String, Object>> selectNList(HttpServletRequest request) {
		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		//게시글 갯수 가져옴
		int listCount = bs.getNListCount();

		HashMap<String, Object> map = new HashMap<String, Object>();

		PageInfo pi = Pagination.getSPageInfo(currentPage, listCount);

		System.out.println("page info : " + pi);

		ArrayList<Board> list;
		list = bs.selectNBoardList(pi);

		map.put("pi", pi);
		map.put("list", list);

		return new ResponseEntity<HashMap<String, Object>>(map, HttpStatus.OK);
	}

	/**
	 * @author : eon
	 * @date : 2019. 6. 26.
	 * @comment : 고객센터 FAQ 페이징 및 검색 메소드
	 */
	@RequestMapping("searchFaq.bo")
	public ResponseEntity<HashMap<String, Object>> selectFList(HttpServletRequest request) {
		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		HashMap<String, Object> map = new HashMap<String, Object>();

		if(request.getParameter("condition") == null) {
			//게시글 갯수 가져옴
			int listCount = bs.getFListCount();

			PageInfo pi = Pagination.getSPageInfo(currentPage, listCount);

			System.out.println("page info : " + pi);

			ArrayList<Board> list = bs.selectFBoardList(pi);

			map.put("pi", pi);
			map.put("list", list);
		}else {
			int condition = Integer.parseInt(request.getParameter("condition"));

			//검색한 게시글 갯수 가져옴
			int listCount = bs.getSearchFListCount(condition);

			PageInfo pi = Pagination.getSPageInfo(currentPage, listCount);

			ArrayList<Board> list = bs.searchFBoardList(pi, condition);	

			map.put("pi", pi);
			map.put("list", list);
		}

		return new ResponseEntity<HashMap<String, Object>>(map, HttpStatus.OK);
	}

	/**
	 * @author : eon
	 * @date : 2019. 6. 27.
	 * @comment : 고객센터 FAQ 상세조회
	 */
	@RequestMapping("selectOneF.bo")
	public ResponseEntity<ArrayList<Board>> selectOneF(@RequestParam int num) {
		int result = bs.updateFBoardCount(num);

		ArrayList<Board> b = bs.selectOneFBoard(num);

		return new ResponseEntity<ArrayList<Board>>(b, HttpStatus.OK);
	}	  

	/**
	 * @author : eon
	 * @date : 2019. 6. 27.
	 * @comment : 고객센터 공지사항 상세조회
	 */
	@RequestMapping("selectOneN.bo")
	public ResponseEntity<ArrayList<Board>> selectOneN(@RequestParam int num) {
		int result = bs.updateNBoardCount(num);

		ArrayList<Board> b = bs.selectOneNBoard(num);

		return new ResponseEntity<ArrayList<Board>>(b, HttpStatus.OK);
	}

	/**
	 * @author : eon
	 * @date : 2019. 6. 28.
	 * @comment : 고객센터 1:1문의 작성
	 */
	@RequestMapping("insertQuestion.bo")
	public String insertQuestion(HttpSession session, Model model, Board b, @RequestParam(name="qFile", required=false) MultipartFile qFile) {
		Member m = (Member) session.getAttribute("loginUser");

		b.setBWriter(m.getMno());
		b.setBEmail(m.getEmail());

		System.out.println("파일 첨부 여부 : " + qFile.isEmpty());
		
		if(qFile.isEmpty() != true) {
			Attachment att = new Attachment();
			
			String root = session.getServletContext().getRealPath("resources"); //하드 디스크상의 물리적인 경로
			String filePath = root + "\\uploadFiles\\board\\service";
			
			System.out.println("filePath : " + filePath);
			
			String originFileName = qFile.getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			String changeName = CommonUtils.getRandomString();
			
			att.setOriginName(originFileName);
			att.setChangeName(changeName + ext);
			att.setFilePath(filePath);
			
			System.out.println("board : " + b);
			System.out.println("att : "+ att);
			
			try {
				qFile.transferTo(new File(filePath + "\\" + changeName + ext));
				
				int result = bs.insertQuestion(b, att);
				
				System.out.println("1:1 문의 작성 결과 : " + result);
				
				return "redirect:serviceMain.bo";
			} catch (Exception e) {
				//실패 시 파일 삭제
				new File(filePath + "\\" + changeName + ext).delete();
				
				model.addAttribute("msg", "1:1문의 작성 실패!");
				
				return "common/errorPage";
			}
			
		}else {
			int result = bs.insertQuestion2(b);
			
			System.out.println("1:1 문의 작성 결과 : " + result);
			
			return "redirect:serviceMain.bo";
		}

	}
	
	/**
	 * @author : eon
	 * @date : 2019. 6. 29.
	 * @comment : 고객센터 신고하기 작성
	 */
	@RequestMapping("insertReport.bo")
	public String insertReport(HttpSession session, Model model, Board b, @RequestParam("rmid")String rmid, @RequestParam(name="rFile", required=false) MultipartFile rFile) {
		Member m = (Member) session.getAttribute("loginUser");

		b.setBWriter(m.getMno());
		b.setBEmail(m.getEmail());

		System.out.println("파일 첨부 여부 : " + rFile.isEmpty());
		System.out.println("신고자 아이디 : " + rmid);
		
		//신고자 아이디로 mno 가져오기
		int rmno = bs.selectRmno(rmid);
		System.out.println("신고 대상자 번호 : " + rmno);
		
		b.setReportMno(rmno);
		
		if(rFile.isEmpty() != true) {
			Attachment att = new Attachment();
			
			String root = session.getServletContext().getRealPath("resources"); //하드 디스크상의 물리적인 경로
			String filePath = root + "\\uploadFiles\\board\\service";
			
			System.out.println("filePath : " + filePath);
			
			String originFileName = rFile.getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			String changeName = CommonUtils.getRandomString();
			
			att.setOriginName(originFileName);
			att.setChangeName(changeName + ext);
			att.setFilePath(filePath);
			
			System.out.println("board : " + b);
			System.out.println("att : "+ att);
			
			try {
				rFile.transferTo(new File(filePath + "\\" + changeName + ext));
				
				int result = bs.insertReport(b, att);
				
				System.out.println("신고하기 결과 : " + result);
				
				return "redirect:serviceMain.bo";
			} catch (Exception e) {
				//실패 시 파일 삭제
				new File(filePath + "\\" + changeName + ext).delete();
				
				model.addAttribute("msg", "신고하기 실패!");
				
				return "common/errorPage";
			}
			
		}else {
			int result = bs.insertReport2(b);
			
			System.out.println("신고하기 결과 : " + result);
			
			return "redirect:serviceMain.bo";
		}		
	}
	
	/**
	 * @author : eon
	 * @date : 2019. 6. 30.
	 * @comment : 고객센터 나의문의내역 리스트 조회용 메소드
	 */
	@RequestMapping("selectmQList.bo")
	public ResponseEntity<HashMap<String, Object>> selectmQList(HttpServletRequest request) {
		Member m = (Member) request.getSession().getAttribute("loginUser");
		
		int mno = m.getMno();
		
		System.out.println("로그인한 유저 번호 : " + mno);
		
		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		//게시글 갯수 가져옴
		int listCount = bs.getmQListCount(mno);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		System.out.println("page info : " + pi);
		
		ArrayList<HashMap<String, Object>> hmap;
		hmap = bs.selectmQBoardList(pi, mno);

		map.put("pi", pi);
		map.put("list", hmap);

		return new ResponseEntity<HashMap<String, Object>>(map, HttpStatus.OK);
	}
	
	/**
	 * @author : eon
	 * @date : 2019. 7. 01.
	 * @comment : 고객센터 나의문의내역 상세조회
	 */
	@RequestMapping("selectOneMQ.bo")
	public ResponseEntity<HashMap<String, Object>> selectOneMQ(@RequestParam int num) {
		System.out.println("선택된 문의 번호 : " + num);
		
		
		ArrayList<HashMap<String, Object>> hmap = bs.selectOneMQBoard(num);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", hmap);

		int result = bs.updateMQBoardCount(num);
		
		System.out.println("조회수 증가 성공여부 : " + result);

		return new ResponseEntity<HashMap<String, Object>>(map, HttpStatus.OK);
	}
}