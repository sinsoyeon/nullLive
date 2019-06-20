package com.kh.nullLive.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class AdminController {

	// ----------------------------------- 관리자 메인
	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment :관리자 메인페이지 뷰 이동(정보가져오기)
	 */
	@RequestMapping("main.ad")
	public String adminMain() {
		return "admin/adminMain";
	}

	// ----------------------------------- 회원관리
	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment :회원관리 페이지 이동(페이징)
	 */
	@RequestMapping("memberList.ad")
	public String adminMemberList() {
		return "admin/memberManagement";
	}

	// 회원 검색

	// 회원 상세정보 조회

	// 계정 활동 및 정지

	// 회원 상세정보 조회 닫기

	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment :스트리머 신고 페이지 이동(페이징)
	 */
	@RequestMapping("streamerReportList.ad")
	public String adminStreamerReportList() {
		return "admin/streamerReport";
	}

	// 검색

	// 신고 상세보기

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
	public String adminMemberReportList() {
		return "admin/memberReport";
	}

	// 검색

	// 신고 상세보기

	// 신고 처리 상태 적용

	// 상세보기 닫기

	// ----------------------------------- 통계

	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment :회원 통합 통계 페이지 이동
	 */
	@RequestMapping("memberStatisticsList.ad")
	public String adminMemberStatisticsList() {
		return "admin/memberStatistics";
	}

	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment : 사이트 통계 페이지 이동
	 */
	@RequestMapping("sitesStatisticsList.ad")
	public String adminSitesStatisticsList() {
		return "admin/sitesStatistics";
	}

	// ----------------------------------- 정산

	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment : 정산 페이지 이동 (페이징)
	 */
	@RequestMapping("calculateList.ad")
	public String adminCalculateList() {
		return "admin/calculate";
	}

	// 검색

	// 다중 정산

	// 단일 정산

	// ----------------------------------- 고객센터

	/**
	 * @author INHYO
	 * @date : 2019. 6. 20.
	 * @comment : 고객센터 페이지 이동(페이징)
	 */
	@RequestMapping("questionList.ad")
	public String adminQuestionList() {
		return "admin/question";
	}

	// 검색

	// 상세보기

	// 상세보기 닫기

	// 답변 달기

}
