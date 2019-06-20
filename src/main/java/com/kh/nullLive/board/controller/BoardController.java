package com.kh.nullLive.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.nullLive.board.model.service.BoardService;

@SessionAttributes("loginUser")
@Controller
public class BoardController {
	/* 소통센터 : job / 고객센터 : service */
	
	/**
	 * @Author : eon
	 * @Date : 2019. 6. 20.
	 * @Comment : 고객센터 화면 호출
	 */
	@RequestMapping("serviceMain.bo")
	public String servicePage() {		
		return "board/service/serviceCenterMain";
	}
	
	@Autowired
	private BoardService bs;
	
	

	/**
	 * @author : uukk
	 * @date : 2019. 6. 18.
	 * @comment : 구인구직 공지사항 리스트 조회용 메소드
	 */
	public String selectListJobNotice() {
		
		bs.selectListJobNotice();
		
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 공지사항 상세조회용 메소드
	 */
	public String selectOneJobNotice() {
		
		bs.selectOneJobNotice();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 공지사항 글쓰기용 메소드
	 */
	@RequestMapping("insertJobNotice.bd")
	public String insertJobNotice() {
		System.out.println("도착");
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 공지사항 업데이트용 메소드
	 */
	public String updateJobNotice() {
		bs.updateJobNotice();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 공지사항 삭제용 메소드
	 */
	public String deleteJobNotice() {
		bs.deleteJobNotice();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 리스트 조회용 메소드
	 */
	public String selectListJobBoard() {
		bs.selectListJobBoard();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 내가쓴글 조회용 메소드
	 */
	public String selectListJobMyBoard() {
		bs.selectListJobMyBoard();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 글쓰기
	 */
	public String insertJobBoard() {
		bs.insertJobBoard();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 검색
	 */
	public String searchJobBoard() {
		bs.searchJobBoard();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 상세조회용 
	 */
	public String selectOneJobBoard() {
		bs.selectOneJobBoard();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 지원현황 조회용
	 */
	public String SelectListApply() {
		
		bs.SelectListApply();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 수정용
	 */
	public String updateJobBoard() {
		bs.updateJobBoard();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 지원하기 메소드
	 */
	public String insertApply() {
		bs.insertApply();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 승낙하기(계약)
	 */
	public String insertContract() {
		bs.insertContract();
		return null;
	}
	
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 신고하기
	 */
	public String insertJobBoardReport() {
		bs.insertJobBoardReport();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 쪽지보내기
	 */
	public String insertJobBoardNote() {
		bs.insertJobBoardNote();
		return null;
	}
	
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 20.
	 * @comment : 구인구직 메인으로 이동
	 */
	@RequestMapping("jobMain.bd")
	public String showJobBoardMain() {
		return "board/job/jobMain";
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 20.
	 * @comment : 구인구직 매니저 게시판 리스트
	 */
	@RequestMapping("jobMngList.bd")
	public String showJobBoardMngList() {
		return "board/job/jobMngList";
	}
	/**
	 * @author : uukk
	 * @date : 2019. 6. 20.
	 * @comment : 구인구직 공지사항 리스트
	 */
	@RequestMapping("jobNoticeList.bd")
	public String showJobNoticeList() {
		return "board/job/jobNoticeList";
	}
	/**
	 * @author : uukk
	 * @date : 2019. 6. 20.
	 * @comment : 구인구직 콘텐츠제작자 리스트
	 */
	@RequestMapping("jobContentList.bd")
	public String showJobBoardContentList() {
		return "board/job/jobContentList";
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 20.
	 * @comment : 구인구직 공지사항 입력폼 보이기
	 */
	@RequestMapping("jobNoticeInsertForm.bd")
	public String showJobNoitceInsertForm() {
		return "board/job/jobNoticeInsertForm";
	}
	/**
	 * @author : uukk
	 * @date : 2019. 6. 20.
	 * @comment : 구인구직 매니저 입력폼 보이기
	 */
	@RequestMapping("jobMngInsertForm.bd")
	public String showJobMngInsertForm() {
		return "board/job/jobMngInsertForm";
	}
	/**
	 * @author : uukk
	 * @date : 2019. 6. 20.
	 * @comment : 구인구직 콘텐츠제작자 입력폼 보이기
	 */
	@RequestMapping("jobContentInsertForm.bd")
	public String showJobContentInsertForm() {
		return "board/job/jobContentInsertForm";
	}
}
