package com.kh.nullLive.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.nullLive.admin.model.exception.QuestionAnswerException;
import com.kh.nullLive.admin.model.vo.Exchange;
import com.kh.nullLive.admin.model.vo.Question;
import com.kh.nullLive.admin.model.vo.Report;
import com.kh.nullLive.admin.model.vo.UserDetail;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.common.paging.model.vo.PagingVo;
import com.kh.nullLive.member.model.vo.Member;

public interface AdminService {

	// 회원 목록
	ArrayList<Member> memberList(PagingVo paging);

	// 총 회원수 조회(페이징)
	int totalMemberSelect();

	// 스트리머 신고목록
	ArrayList<Report> streamerReportList(PagingVo paging);

	// 스트리머 글 수 조회(페이징)
	int totalStreamerReport();

	// 일반회원 신고목록
	ArrayList<Report> memberReportList(PagingVo paging);

	// 일반회원 신고 수 조회
	int totalMemberReport();

	// 환전 신청 목록
	ArrayList<Exchange> exchangeList(PagingVo paging);
	
	//환전 신청 수 조회(페이징)
	int totalExchangeSelect();

	// 1:1문의 목록
	ArrayList<Question> questionList(PagingVo paging);

	// 문의게시판 총 글 수
	int totalQuestionSelect();

	// 회원 상세보기
	UserDetail userDetail(UserDetail userDetail);

	// 회원 상태 변경
	int userStatusUpdate(Member m);

	// 신고 상세보기
	Report reportDetail(int bno);

	// 문의 상세보기
	Question questionDetail(Question q);

	// 문의 답변
	void questionAnswer(Question q) throws QuestionAnswerException;

	// 단일 환전
	int exchange(int excno);

	// 다중 환전
	int allExchange(List<String> allExcList);

	// FAQ 목록
	ArrayList<Board> FAQList(PagingVo paging);

	// FAQ 총 글 수
	int totalFAQSelect();

	// 공지사항 목록
	ArrayList<Board> noticeList(PagingVo paging);

	// 공지사항 총 글 수
	int totalNoticeSelect();

	// FAQ/공지사항 상세보기
	Board detail(int bno);

	// FAQ/공지사항 수정
	int modify(Board fAQModify);

	// FAQ 작성
	int insertFAQ(Board b);

	// 공지사항 작성
	int insertNotice(Board b);

	// FAQ/공지사항 삭제
	int deleteContent(int bno);

	// 신고처리된 글 조회용
	String selectBan(int bno);

	// 신고처리 프로세스
	int reportProcess(int bno, Member m);

	// 월별 회원 유입 통계
	ArrayList<HashMap<String, Object>> memberMonthStatistics(int year);

	// 시간대별 시청인원 통계
	ArrayList<HashMap<String, Object>> hourlyViewingTimeStatistics();

	// 방송 인기 카테고리 통계
	ArrayList<HashMap<String, Object>> bestCategoryStatistics();

	// 충전 금액 통계
	ArrayList<HashMap<String, Object>> chargeAndExchangeStatistics(int year);

	// 수수료  통계
	ArrayList<HashMap<String, Object>> revenueStatistics(int year);

	

}
