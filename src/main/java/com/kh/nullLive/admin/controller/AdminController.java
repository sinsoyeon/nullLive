package com.kh.nullLive.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.nullLive.admin.model.service.AdminService;
import com.kh.nullLive.admin.model.vo.Exchange;
import com.kh.nullLive.admin.model.vo.Question;
import com.kh.nullLive.admin.model.vo.Report;
import com.kh.nullLive.admin.model.vo.UserDetail;
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
	public String adminMain(Model model) {
		
		ArrayList<Exchange> ExchangeList = as.exchangeList();
		ArrayList<Report> streamerReportList = as.streamerReportList();
		ArrayList<Question> QuestionList = as.questionList();

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
	public String adminMemberList(Model model) {
		
		ArrayList<Member> userList = as.memberList();
		
		model.addAttribute("userList", userList);
		
		return "admin/memberManagement";
	}

	// 회원 검색

	/**
	 * @author INHYO
	 * @date : 2019. 6. 27.
	 * @comment : 회원 상세정보 조회
	 */
	@RequestMapping("userDeatil.ad")
	public ResponseEntity<UserDetail> userDeatil(String userId) {
		
		UserDetail userDetail = as.userDetail(userId);
		
		return new ResponseEntity<UserDetail>(userDetail, HttpStatus.OK);
	}

	/**
	 * @author INHYO
	 * @date : 2019. 6. 27.
	 * @comment :계정 활동 및 정지
	 */
	@RequestMapping("userStatusUpdate.ad")
	public String userStatusUpdate(Model model, String memberId, String choiceStatus) {
		
		Member m = new Member();
		m.setMid(memberId);
		m.setMstatus(choiceStatus);
		int result = as.userStatusUpdate(m);

		if(result >0 ) {
			ArrayList<Member> userList = as.memberList();
			
			model.addAttribute("userList", userList);
			return "admin/memberManagement";
		}else {
			String msg = "회원 상태 변경 실패!";
			model.addAttribute("msg", msg);
			return "common/errorPage";
		}
	}

	// 회원 상세정보 조회 닫기

	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment :스트리머 신고 페이지 이동(페이징)
	 */
	@RequestMapping("streamerReportList.ad")
	public String adminStreamerReportList(Model model) {
		
		ArrayList<Report> streamerReportList = as.streamerReportList();
		
		model.addAttribute("streamerReportList", streamerReportList);
		
		return "admin/streamerReport";
	}

	// 검색
	
	/**
	 * @author INHYO
	 * @date : 2019. 6. 21.
	 * @comment : 신고 상세보기
	 */
	@RequestMapping("streamerReportDetail.ad")
	public String adminStreamerReportDetail(Model model) {
		return "admin/streamerReportDetail";
	}

	// 신고 처리 상태 적용

	// 상세보기 닫기

	// --------------- 일반회원 신고

	// 일반회원 신고 페이지 이동(페이징)
	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment :
	 */
	@RequestMapping("memberReportList.ad")
	public String adminMemberReportList(Model model) {
		
		ArrayList<Report> streamerReportList = as.streamerReportList();
		
		model.addAttribute("streamerReportList", streamerReportList);
		
		return "admin/memberReport";
	}

	// 검색

	/**
	 * @author INHYO
	 * @date : 2019. 6. 21.
	 * @comment : 신고 상세보기
	 */
	@RequestMapping("memberReportDetail.ad")
	public String adminMemberReportDetail(Model model) {
		return "admin/memberReportDetail";
	}

	// 신고 처리 상태 적용

	// 상세보기 닫기

	// ----------------------------------- 통계

	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment :회원 통합 통계 페이지 이동
	 */
	@RequestMapping("memberStatisticsList.ad")
	public String adminMemberStatisticsList(Model model) {
		return "admin/memberStatistics";
	}

	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment : 사이트 통계 페이지 이동
	 */
	@RequestMapping("sitesStatisticsList.ad")
	public String adminSitesStatisticsList(Model model) {
		return "admin/sitesStatistics";
	}

	// ----------------------------------- 정산

	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment : 환전 페이지 이동 (페이징)
	 */
	@RequestMapping("calculateList.ad")
	public String adminCalculateList(Model model) {
		
		ArrayList<Exchange> ExchangeList = as.exchangeList();
		
		model.addAttribute("ExchangeList", ExchangeList);
		
		return "admin/exchange";
	}

	// 검색

	// 다중 정산

	// 단일 정산

	// ----------------------------------- 고객센터

	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment : 1:1문의 페이지 이동(페이징)
	 */
	@RequestMapping("questionList.ad")
	public String adminQuestionList(Model model) {
		
		ArrayList<Question> QuestionList = as.questionList();

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
	public String adminQuestionDetail(Model model) {
		return "admin/questionDetail";
	}

	// 상세보기 닫기

	// 답변 달기

}
