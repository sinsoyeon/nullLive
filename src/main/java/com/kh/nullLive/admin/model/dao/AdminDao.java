package com.kh.nullLive.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.admin.model.vo.Ban;
import com.kh.nullLive.admin.model.vo.Exchange;
import com.kh.nullLive.admin.model.vo.Question;
import com.kh.nullLive.admin.model.vo.Report;
import com.kh.nullLive.admin.model.vo.UserDetail;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.common.paging.model.vo.PagingVo;
import com.kh.nullLive.member.model.vo.Member;

public interface AdminDao {

	// 회원 목록
	ArrayList<Member> memberList(SqlSessionTemplate sqlSession, PagingVo paging);

	// 총 회원수 조회(페이징)
	int totalMemberSelect(SqlSessionTemplate sqlSession);
	
	// 스트리머 신고 목록
	ArrayList<Report> streamerReportList(SqlSessionTemplate sqlSession, PagingVo paging);
	
	// 스트리머 신고 글 수 조회
	int totalStreamerReport(SqlSessionTemplate sqlSession);

	// 일반회원 신고목록
	ArrayList<Report> memberReportList(SqlSessionTemplate sqlSession, PagingVo paging);
	
	// 일반회원 신고 글 수 조회
	int totalMemberReport(SqlSessionTemplate sqlSession);

	// 환전신청 목록
	ArrayList<Exchange> exchangeList(SqlSessionTemplate sqlSession);

	// 문의 목록
	ArrayList<Question> questionList(SqlSessionTemplate sqlSession, PagingVo paging);
	
	// 회원 상세보기
	UserDetail userDetail(SqlSessionTemplate sqlSession, UserDetail ud);

	// 회원 상태 변경
	int userStatusUpdate(SqlSessionTemplate sqlSession, Member m);


	// 신고 상세보기
	Report reportDetail(SqlSessionTemplate sqlSession, int bno);

	// 문의 상세보기
	Question questionDetail(SqlSessionTemplate sqlSession, Question q);

	// 문의 상태 변경
	int updateQuestion(SqlSessionTemplate sqlSession, Question q);

	// 문의 답변
	int insetAnswer(SqlSessionTemplate sqlSession, Question q);

	// 단일 환전
	int exchange(SqlSessionTemplate sqlSession, int excno);

	// BAN 테이블 회원 정지상태 변경
	int updateBan(SqlSessionTemplate sqlSession, Member m);

	// BAN 내역 추가
	int insertBan(SqlSessionTemplate sqlSession, Member m);

	// 다중 환전
	int allExchange(SqlSessionTemplate sqlSession, int integer);

	// FAQ 목록
	ArrayList<Board> FAQList(SqlSessionTemplate sqlSession, PagingVo paging);

	// 공지사항 목록
	ArrayList<Board> noticeList(SqlSessionTemplate sqlSession, PagingVo paging);

	// FAQ/공지사항 상세보기
	Board detail(SqlSessionTemplate sqlSession, int bno);

	// FAQ/공지사항 수정
	int modify(SqlSessionTemplate sqlSession, Board fAQModify);

	// FAQ 작성
	int insertFAQ(SqlSessionTemplate sqlSession, Board b);

	// FAQ/공지사항 삭제
	int deleteContent(SqlSessionTemplate sqlSession, int bno);

	// 공지사항 작성
	int insertNotice(SqlSessionTemplate sqlSession, Board b);

	// 신고 상세보기에 필요한 정지 내역
	String selectBan(SqlSessionTemplate sqlSession, int bno);

	// 신고글 업데이트
	int updateReport(SqlSessionTemplate sqlSession, int bno);

	// 신고관련 BAN 내역 추가
	int insertReportBan(SqlSessionTemplate sqlSession, Member m);

	// 문의 글 수 카운트
	int totalQuestionSelect(SqlSessionTemplate sqlSession);

	//FAQ 글 수 카운트
	int totalFAQSelect(SqlSessionTemplate sqlSession);

	// 공지 글 수 카운트
	int totalNoticeSelect(SqlSessionTemplate sqlSession);

	//월별 회원 유입 통계
	ArrayList<HashMap<String, Object>> memberMonthStatistics(SqlSessionTemplate sqlSession, int year);

	//시간대별 시청인원 통계
	ArrayList<HashMap<String, Object>> hourlyViewingTimeStatistics(SqlSessionTemplate sqlSession);

	


}
