package com.kh.nullLive.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nullLive.board.model.service.BoardService;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.common.Pagination;
import com.kh.nullLive.member.model.service.MemberService;

@SessionAttributes("loginUser")
@Controller
public class BoardController {
	/* 소통센터 : job / 고객센터 : service */
	@Autowired
	private BoardService bs;
	@Autowired
	private MemberService ms;

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
	 * @date : 2019. 6. 25.
	 * @comment : 고객센터 FAQ 리스트 조회용 메소드
	 */
	@RequestMapping("selectFList.bo")
	public ModelAndView selectFList(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		response.setContentType("text/html; charset=UTF-8");

		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		//게시글 갯수 가져옴
		int listCount = bs.getFListCount();

		PageInfo pi = Pagination.getSPageInfo(currentPage, listCount);

		System.out.println("page info : " + pi);

		ArrayList<Board> list;
		list = bs.selectFBoardList(pi);

		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("jsonView");
		return mv;

	}

	/**
	 * @author : eon
	 * @date : 2019. 6. 26.
	 * @comment : 고객센터 FAQ 페이징 및 검색 메소드
	 */
	@RequestMapping("searchFaq.bo")
	public ModelAndView searchFList(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		response.setContentType("text/html; charset=UTF-8");

		int condition = Integer.parseInt(request.getParameter("condition"));

		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//게시글 갯수 가져옴
		int listCount = bs.getFListCount();

		PageInfo pi = Pagination.getSPageInfo(currentPage, listCount);

		System.out.println("page info : " + pi);

		ArrayList<Board> list = bs.selectFBoardList(pi);
		
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		
		if(condition != 1) {
			//검색한 게시글 갯수 가져옴
			int searchlistCount = bs.getSearchFListCount(condition);
			
			PageInfo spi = Pagination.getSPageInfo(currentPage, searchlistCount);
			
			ArrayList<Board> slist = bs.searchFBoardList(spi, condition);	
			
			mv.addObject("list", slist);
			mv.addObject("pi", spi);
		}
		
		mv.setViewName("jsonView");
		return mv;
	}
}