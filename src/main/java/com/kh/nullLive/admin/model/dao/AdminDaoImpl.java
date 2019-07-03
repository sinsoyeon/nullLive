package com.kh.nullLive.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	public UserDetail userDetail(SqlSessionTemplate sqlSession, String userId) {
		UserDetail tme = sqlSession.selectOne("Admin.selectUserDetail", userId);
		System.out.println("test"+tme);
		return tme;
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
	public ArrayList<Report> streamerReportList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Admin.selectReportList");
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
	public ArrayList<Question> questionList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Admin.selectQuestion");
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
	public ArrayList<Exchange> exchangeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Admin.selectExchange");
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

}
