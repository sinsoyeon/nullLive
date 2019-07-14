package com.kh.nullLive.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nullLive.admin.model.vo.Ban;
import com.kh.nullLive.admin.model.vo.Exchange;
import com.kh.nullLive.admin.model.vo.Question;
import com.kh.nullLive.admin.model.vo.Report;
import com.kh.nullLive.admin.model.vo.UserDetail;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.common.paging.model.vo.PagingVo;
import com.kh.nullLive.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao{
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :회원리스트 불러오기(페이징)
	 */
	@Override
	public ArrayList<Member> memberList(SqlSessionTemplate sqlSession, PagingVo paging) {
		return (ArrayList)sqlSession.selectList("Member.memberSelect", paging);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :총 멤버수 카운트
	 */
	@Override
	public int totalMemberSelect(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Member.totalMemberSelect");
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :회원 상세보기
	 */
	@Override
	public UserDetail userDetail(SqlSessionTemplate sqlSession, UserDetail ud) {
		return sqlSession.selectOne("Admin.selectUserDetail", ud);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :회원 상태 변경
	 */
	@Override
	public int userStatusUpdate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("Admin.userStatusUpdate", m);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment : BAN 테이블 update
	 */	
	@Override
	public int updateBan(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("Admin.updateBan", m);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :BAN 테이블 insert
	 */	
	@Override
	public int insertBan(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("Admin.insertBan", m);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :스트리머 신고 리스트
	 */
	@Override
	public ArrayList<Report> streamerReportList(SqlSessionTemplate sqlSession, PagingVo paging) {
		return (ArrayList)sqlSession.selectList("Admin.selectStreamerReportList",paging);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 9.
	 * @comment :스트리머 신고글 총 수
	 */
	@Override
	public int totalStreamerReport(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Admin.totalStreamerReport");
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :스트리머 신고 리스트
	 */
	@Override
	public ArrayList<Report> memberReportList(SqlSessionTemplate sqlSession, PagingVo paging) {
		return (ArrayList)sqlSession.selectList("Admin.selectMemberReportList",paging);
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 9.
	 * @comment :일반회원 신고글 총 수
	 */
	@Override
	public int totalMemberReport(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Admin.totalMemberReport");
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :신고 상세보기
	 */
	@Override
	public Report reportDetail(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("Admin.selectReportDetail",bno);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :문의 리스트
	 */
	@Override
	public ArrayList<Question> questionList(SqlSessionTemplate sqlSession,PagingVo paging) {
		return (ArrayList)sqlSession.selectList("Admin.selectQuestion",paging);
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :문의 상세보기
	 */
	@Override
	public Question questionDetail(SqlSessionTemplate sqlSession, Question q) {
		return sqlSession.selectOne("Admin.selectQuestionDetail",q);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment : 문의 상태 변경
	 */
	@Override
	public int updateQuestion(SqlSessionTemplate sqlSession, Question q) {
		return sqlSession.update("Admin.updateBStatus", q);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment : 문의 답변달기
	 */
	@Override
	public int insetAnswer(SqlSessionTemplate sqlSession, Question q) {
		return sqlSession.insert("Admin.insetAnswer", q);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :환전 리스트
	 */
	@Override
	public ArrayList<Exchange> exchangeList(SqlSessionTemplate sqlSession, PagingVo paging) {
		return (ArrayList)sqlSession.selectList("Admin.selectExchange",paging);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 14.
	 * @comment :환전 카운트
	 */
	@Override
	public int totalExchange(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Admin.totalExchange");
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :환전하기
	 */
	@Override
	public int exchange(SqlSessionTemplate sqlSession, int excno) {
		return sqlSession.update("Admin.exchangeProcess",excno);
	}

	@Override
	public int allExchange(SqlSessionTemplate sqlSession, int excno) {
		return sqlSession.update("Admin.allExchangeProcess", excno);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :FAQ 목록 조회
	 */
	@Override
	public ArrayList<Board> FAQList(SqlSessionTemplate sqlSession,PagingVo paging) {
		return  (ArrayList)sqlSession.selectList("Board.selectFAQList",paging);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :FAQ 작성
	 */
	@Override
	public int insertFAQ(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("Board.insertFAQ",b);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :FAQ/공지사항 상세보기
	 */
	@Override
	public Board detail(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("Board.adminSelectDetail", bno);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :FAQ/공지사항 수정
	 */
	@Override
	public int modify(SqlSessionTemplate sqlSession, Board fAQModify) {
		return sqlSession.update("Board.adminModifyUpdate",fAQModify);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :FAQ/공지사항 삭제
	 */
	@Override
	public int deleteContent(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.delete("Board.deleteContent",bno);
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :공지사항 목록 조회
	 */
	@Override
	public ArrayList<Board> noticeList(SqlSessionTemplate sqlSession, PagingVo paging) {
		return  (ArrayList)sqlSession.selectList("Board.selectNoticeList", paging);
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :공지사항 작성
	 */
	@Override
	public int insertNotice(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("Board.insertNotice",b);
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 8.
	 * @comment : 정지 내역 찾기
	 */
	@Override
	public String selectBan(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("Admin.selectBan", bno);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 8.
	 * @comment : 신고글 처리 변경
	 */
	@Override
	public int updateReport(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("Admin.updateReport",bno);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 8.
	 * @comment : BAN 테이블 내역 추가
	 */
	@Override
	public int insertReportBan(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("Admin.insertReportBan", m);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 13.
	 * @comment : 페이징용 문의글 수
	 */
	@Override
	public int totalQuestionSelect(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Admin.totalQuestionSelect");
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 13.
	 * @comment :페이징용 FAQ글 수
	 */
	@Override
	public int totalFAQSelect(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Board.totalFAQSelect");
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 13.
	 * @comment : 페이징용 공지사항 글 수
	 */
	@Override
	public int totalNoticeSelect(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Board.totalNoticeSelect");
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 13.
	 * @comment : 월별 회원 유입 통계
	 */
	@Override
	public ArrayList<HashMap<String, Object>> memberMonthStatistics(SqlSessionTemplate sqlSession, int year) {
		return (ArrayList)sqlSession.selectList("Admin.memberMonthStatistics",year);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 13.
	 * @comment : 시간대별 시청시간대 통계
	 */
	@Override
	public ArrayList<HashMap<String, Object>> hourlyViewingTimeStatistics(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Admin.hourlyViewingTimeStatistics");
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 13.
	 * @comment : 방송 인기 카테고리 통계
	 */
	@Override
	public ArrayList<HashMap<String, Object>> bestCategoryStatistics(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Admin.bestCategoryStatistics");
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 13.
	 * @comment : 충전 금액 통계
	 */
	@Override
	public ArrayList<HashMap<String, Object>> chargeAndExchangeStatistics(SqlSessionTemplate sqlSession,int year) {
		return (ArrayList)sqlSession.selectList("Admin.chargeAndExchangeStatistics",year);
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 14.
	 * @comment : 수수료 통계
	 */
	@Override
	public ArrayList<HashMap<String, Object>> revenueStatistics(SqlSessionTemplate sqlSession,int year) {
		return (ArrayList)sqlSession.selectList("Admin.revenueStatistics",year);
	}
	
	
	
}
