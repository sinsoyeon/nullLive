package com.kh.nullLive.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.nullLive.admin.model.exception.QuestionAnswerException;
import com.kh.nullLive.admin.model.service.AdminService;
import com.kh.nullLive.admin.model.vo.Exchange;
import com.kh.nullLive.admin.model.vo.Question;
import com.kh.nullLive.admin.model.vo.Report;
import com.kh.nullLive.admin.model.vo.UserDetail;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.common.paging.model.vo.PagingVo;
import com.kh.nullLive.member.model.vo.Member;


@Controller
public class AdminController {
	
	@Autowired
	private AdminService as;

	// ----------------------------------- 관리자 메인
	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment :관리자 메인페이지 뷰 이동(정보가져오기)
	 */
	@RequestMapping("main.ad")
	public String adminMain(Model model ,PagingVo paging) {
		paging.setIndex(0);
		paging.setListCnt(5);
		
		ArrayList<Exchange> ExchangeList = as.exchangeList();
		ArrayList<Report> streamerReportList = as.streamerReportList(paging);
		ArrayList<Question> QuestionList = as.questionList(paging);

		model.addAttribute("ExchangeList", ExchangeList);
		model.addAttribute("streamerReportList", streamerReportList);
		model.addAttribute("QuestionList", QuestionList);
		
		return "admin/adminMain";
	}

	// ----------------------------------- 회원관리
	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment :회원관리 페이지 이동(페이징)
	 */
	@RequestMapping("memberList.ad")
	public String adminMemberList(Model model,PagingVo paging) {
		
		ArrayList<Member> userList = as.memberList(paging); // 페이징된 갯수
	    paging.setTotal(as.totalMemberSelect()); // 전부 갯수
	    model.addAttribute("userList", userList);
	    model.addAttribute("pi", paging);
		
		return "admin/memberManagement";
	}

	// 회원 검색

	/**
	 * @author INHYO
	 * @date : 2019. 6. 27.
	 * @comment : 회원 상세정보 조회
	 */
	@RequestMapping("userDeatil.ad")
	public ResponseEntity<UserDetail> userDeatil(int mno, String statusType) {
		
		
		UserDetail userDetail = new UserDetail();
		
		userDetail.setMno(mno);
		userDetail.setMemStatus(statusType);
		
		userDetail = as.userDetail(userDetail);
		
		return new ResponseEntity<UserDetail>(userDetail, HttpStatus.OK);
	}

	/**
	 * @author INHYO
	 * @date : 2019. 6. 27.
	 * @comment :계정 활동 및 정지
	 */
	
	@RequestMapping("userStatusUpdate.ad")
	public String userStatusUpdate(Model model, int mno, String choiceStatus) {
		
		Member m = new Member();
		m.setMno(mno);
		m.setMstatus(choiceStatus);
		int result = as.userStatusUpdate(m);

		if(result > 0 ) {
			return "redirect:memberList.ad";
		}else {
			String msg = "회원 상태 변경 실패!";
			model.addAttribute("msg", msg);
			return "common/errorPage";
		}
	}

	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment :스트리머 신고 페이지 이동(페이징)
	 */
	@RequestMapping("streamerReportList.ad")
	public String adminStreamerReportList(Model model,PagingVo paging) {
		
		ArrayList<Report> streamerReportList = as.streamerReportList(paging);
		paging.setTotal(as.totalStreamerReport());
		
		model.addAttribute("streamerReportList", streamerReportList);
		model.addAttribute("pi",paging);
		
		return "admin/streamerReport";
	}

	// 검색
	
	/**
	 * @author INHYO
	 * @date : 2019. 6. 21.
	 * @comment : 스트리머 신고 상세보기
	 */
	@RequestMapping("streamerReportDetail.ad")
	public String adminStreamerReportDetail(Model model, int bno) {
		
		String ban = as.selectBan(bno);
		Report reportContent = as.reportDetail(bno);
		model.addAttribute("reportContent", reportContent);
		model.addAttribute("ban", ban);
		
		return "admin/streamerReportDetail";
	}

	/**
	 * @author INHYO
	 * @date : 2019. 7. 08.
	 * @comment : 스트리머 신고 처리
	 */
	@RequestMapping("streamerRreportProcess.ad")
	public String adminStreamerReportProcess(Model model, int bno, int mno, String choiceStatus) {
		
		Member m = new Member();
		m.setMno(mno);
		m.setMstatus(choiceStatus);
		m.setPoint(bno); // 개시판 고유번호 잠깐 사용...
		
		int result = as.reportProcess(bno,m);
		
		model.addAttribute("bno",bno);
		return "redirect:streamerReportDetail.ad";
	}

	// --------------- 일반회원 신고

	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment :일반회원 신고 페이지 이동(페이징)
	 */
	@RequestMapping("memberReportList.ad")
	public String adminMemberReportList(Model model, PagingVo paging) {
		
		ArrayList<Report> memberReportList = as.memberReportList(paging);
		paging.setTotal(as.totalMemberReport());
		model.addAttribute("memberReportList", memberReportList);
		model.addAttribute("pi",paging);
		
		return "admin/memberReport";
	}

	// 검색

	/**
	 * @author INHYO
	 * @date : 2019. 6. 21.
	 * @comment : 일반회원 신고 상세보기
	 */
	@RequestMapping("memberReportDetail.ad")
	public String adminMemberReportDetail(Model model, int bno) {
		String ban = as.selectBan(bno);
		Report reportContent = as.reportDetail(bno);
		model.addAttribute("reportContent", reportContent);
		model.addAttribute("ban", ban);
		
		return "admin/memberReportDetail";
	}

	/**
	 * @author INHYO
	 * @date : 2019. 7. 08.
	 * @comment : 일반 회원 신고 처리
	 */
	@RequestMapping("memberReportProcess.ad")
	public String adminMemberReportProcess(Model model, int bno, int mno, String choiceStatus) {
		
		Member m = new Member();
		m.setMno(mno);
		m.setMstatus(choiceStatus);
		m.setPoint(bno); // 개시판 고유번호 잠깐 사용...
		int result = as.reportProcess(bno,m);
		
		model.addAttribute("bno",bno);
		return "redirect:memberReportDetail.ad";
	}

	// ----------------------------------- 통계

	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment :회원 통계 페이지 이동
	 */
	@RequestMapping("memberStatisticsList.ad")
	public String adminMemberStatisticsList(Model model) {
		return "admin/memberStatistics";
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 11.
	 * @comment : 회원 유입 통계 ajax
	 */
	@RequestMapping("memberMonthStatistics.ad")
	public ResponseEntity memberMonthStatistics(int year) {
		
		ArrayList<HashMap<String, Object>> monthChart = as.memberMonthStatistics(year);
		
		return new ResponseEntity<ArrayList<HashMap<String, Object>>>(monthChart, HttpStatus.OK);
	}

	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment : 방송 통계 페이지 이동
	 */
	@RequestMapping("streamingStatisticsList.ad")
	public String adminStreamingStatisticsList(Model model) {
		return "admin/streamingStatistics";
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 12.
	 * @comment : 시간대별 시청 수 Ajax
	 */
	@RequestMapping("hourlyViewingTime.ad")
	public ResponseEntity hourlyViewingTimeStatistics() {
		
		ArrayList<HashMap<String, Object>> HVTChart = as.hourlyViewingTimeStatistics();
		
		return new ResponseEntity<ArrayList<HashMap<String, Object>>>(HVTChart, HttpStatus.OK);
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 13.
	 * @comment : 방송 인기 카테고리 Ajax
	 */
	@RequestMapping("bestCategory.ad")
	public ResponseEntity bestCategoryStatistics() {
		
		ArrayList<HashMap<String, Object>> bestCategoryChart = as.bestCategoryStatistics();
		
		return new ResponseEntity<ArrayList<HashMap<String, Object>>>(bestCategoryChart, HttpStatus.OK);
	}
	
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 11.
	 * @comment : 수익 통계 페이지 이동
	 */
	@RequestMapping("revenueStatisticsList.ad")
	public String adminRevenueStatisticsList(Model model) {
		return "admin/revenueStatistics";
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 13.
	 * @comment : 충전 금액 Ajax
	 */
	@RequestMapping("amountCharge.ad")
	public ResponseEntity amountChargeStatistics() {
		
		ArrayList<HashMap<String, Object>> amountChargeChart = as.amountChargeStatistics();
		
		return new ResponseEntity<ArrayList<HashMap<String, Object>>>(amountChargeChart, HttpStatus.OK);
	}
	
	
	
	

	// ----------------------------------- 정산

	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment : 환전 페이지 이동 (페이징)
	 */
	@RequestMapping("exchangeList.ad")
	public String adminExchangeList(Model model) {
		
		ArrayList<Exchange> ExchangeList = as.exchangeList();
		
		model.addAttribute("ExchangeList", ExchangeList);
		
		return "admin/exchange";
	}

	// 검색

	// 다중 정산

	// 단일 정산
	/* 맵핑 에러나서 주석 처리 (소연)
	 * @RequestMapping("exchange.ad") public String adminExchange(Model model ,int
	 * excno) {
	 * 
	 * int result = as.exchange(excno);
	 * 
	 * return "admin/exchange"; }
	 */
	// ----------------------------------- 고객센터

	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment : 1:1문의 페이지 이동(페이징)
	 */
	@RequestMapping("questionList.ad")
	public String adminQuestionList(Model model,PagingVo paging) {
		
		ArrayList<Question> QuestionList = as.questionList(paging);
		paging.setTotal(as.totalQuestionSelect()); // 전부 갯수
	    model.addAttribute("pi", paging);
		model.addAttribute("QuestionList", QuestionList);
		
		return "admin/question";
	}

	// 검색

	/**
	 * @author INHYO
	 * @date : 2019. 6. 24.
	 * @comment : 1:1문의 상세보기 
	 */
	@RequestMapping("questionDetail.ad")
	public String adminQuestionDetail(Model model, int bno, int bStatus) {
		Question q = new Question();
		q.setBno(bno);
		q.setBStatus(bStatus);
		
		Question questionContent = as.questionDetail(q);
		model.addAttribute("questionContent", questionContent);
		System.out.println("questionContent : " + questionContent);
		
		return "admin/questionDetail";
	}

	/**
	 * @author INHYO
	 * @date : 2019. 7. 2.
	 * @comment : 1:1문의 답변 달기
	 */
	@RequestMapping(value="questionAnswer.ad", method=RequestMethod.POST)
	public String adminQuestionAnswer(Model model, String bTitle, String bContent, String questionType, int bno) {
		Question q = new Question();
		q.setBTitle(bTitle);
		q.setBContent(bContent);
		q.setQuestionType(questionType);
		q.setBno(bno);
		
		try {
			as.questionAnswer(q);
			int bStatus = 3;
			model.addAttribute("bno", bno);
			model.addAttribute("bStatus", bStatus);
			return "redirect:questionDetail.ad";
		} catch (QuestionAnswerException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :FAQ 목록 조회
	 */
	@RequestMapping("FAQList.ad")
	public String adminFAQList(Model model, PagingVo paging) {
		
		ArrayList<Board> FAQList = as.FAQList(paging);
		paging.setTotal(as.totalFAQSelect()); // 전부 갯수
	    model.addAttribute("pi", paging);
		model.addAttribute("FAQList",FAQList);
		
		return "admin/FAQ";
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :FAQ 작성폼 이동
	 */
	@RequestMapping("FAQWrite.ad")
	public String adminFAQWrit(Model model) {
		return "admin/FAQWrite";
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :FAQ 작성
	 */
	@RequestMapping("insertFAQ.ad")
	public String adminFAQWrit(Model model, String bTitle, String bContent, String type) {
		Board b = new Board();
		b.setBTitle(bTitle);
		b.setBContent(bContent);
		b.setQuestionType(type);
		
		int result = as.insertFAQ(b);
		if(result > 0) {
			return "redirect:FAQList.ad";
		}else {
			String msg = "작성 실패!";
			model.addAttribute("msg", msg);
			return "common/errorPage";
		}
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 6. 24.
	 * @comment : FAQ상세보기
	 */
	@RequestMapping("FAQDetail.ad")
	public String adminFAQDetail(Model model, int bno) {
		
		Board FAQDetail = as.detail(bno);
		model.addAttribute("FAQDetail", FAQDetail);
		
		return "admin/FAQDetail";
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 6. 24.
	 * @comment : FAQ 수정
	 */
	@RequestMapping("FAQModify.ad")
	public String adminFAQModify(Model model, int bno,String bTitle, String bContent) {
		
		Board b = new Board();
		b.setBno(bno);
		b.setBTitle(bTitle);
		b.setBContent(bContent);
		
		int result = as.modify(b);
		
		if(result > 0) {
			model.addAttribute("bno", bno);
			return "redirect:FAQDetail.ad";
		}else {
			String msg = "수정 실패!";
			model.addAttribute("msg", msg);
			return "common/errorPage";
		}
	}
	/**
	 * @author INHYO
	 * @date : 2019. 6. 24.
	 * @comment : FAQ 삭제
	 */
	@RequestMapping("deleteFAQ.ad")
	public String adminDeleteFAQ(Model model, int bno) {
		
		int result = as.deleteContent(bno);
		
		if(result > 0) {
			return "redirect:FAQList.ad";
		}else {
			String msg = "삭제 실패!";
			model.addAttribute("msg", msg);
			return "common/errorPage";
		}
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :공지사항 목록 조회
	 */
	@RequestMapping("noticeList.ad")
	public String adminNoticeList(Model model, PagingVo paging) {
		
		ArrayList<Board> noticeList = as.noticeList(paging);
		paging.setTotal(as.totalNoticeSelect()); // 전부 갯수
	    model.addAttribute("pi", paging);
		model.addAttribute("noticeList",noticeList);
		
		return "admin/notice";
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :공지사항 작성폼 이동
	 */
	@RequestMapping("noticeWrite.ad")
	public String adminNoticeWrite(Model model) {
		return "admin/noticeWrite";
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :공지사항 작성
	 */
	@RequestMapping("insertNotice.ad")
	public String adminInsertNotice(Model model, String bTitle, String bContent) {
		Board b = new Board();
		b.setBTitle(bTitle);
		b.setBContent(bContent);
		
		int result = as.insertNotice(b);
		if(result > 0) {
			return "redirect:noticeList.ad";
		}else {
			String msg = "작성 실패!";
			model.addAttribute("msg", msg);
			return "common/errorPage";
		}
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 6. 24.
	 * @comment : 공지사항상세보기
	 */
	@RequestMapping("noticeDetail.ad")
	public String adminNoticeDetail(Model model, int bno) {
		
		Board noticeDetail = as.detail(bno);
		model.addAttribute("noticeDetail", noticeDetail);
		
		return "admin/noticeDetail";
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 6. 24.
	 * @comment : 공지사항 수정
	 */
	@RequestMapping("noticeModify.ad")
	public String adminNoticeModify(Model model, int bno,String bTitle, String bContent) {
		
		Board b = new Board();
		b.setBno(bno);
		b.setBTitle(bTitle);
		b.setBContent(bContent);
		
		int result = as.modify(b);
		
		if(result > 0) {
			model.addAttribute("bno", bno);
			return "redirect:noticeDetail.ad";
		}else {
			String msg = "수정 실패!";
			model.addAttribute("msg", msg);
			return "common/errorPage";
		}
	}
	/**
	 * @author INHYO
	 * @date : 2019. 6. 24.
	 * @comment : 공지사항 삭제
	 */
	@RequestMapping("deleteNotice.ad")
	public String adminDeleteNotice(Model model, int bno) {
		
		int result = as.deleteContent(bno);
		
		if(result > 0) {
			return "redirect:noticeList.ad";
		}else {
			String msg = "삭제 실패!";
			model.addAttribute("msg", msg);
			return "common/errorPage";
		}
	}
	
}