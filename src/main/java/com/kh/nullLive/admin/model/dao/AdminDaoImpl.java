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

	@Override
	public ArrayList<Member> memberList(SqlSessionTemplate sqlSession, PagingVo paging) {
		return (ArrayList)sqlSession.selectList("Member.memberSelect", paging);
	}
	
	@Override
	public int totalMemberSelect(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Member.totalMemberSelect");
	}

	@Override
	public ArrayList<Report> streamerReportList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Admin.selectReportList");
	}

	@Override
	public ArrayList<Exchange> exchangeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Admin.selectExchange");
	}

	@Override
	public ArrayList<Question> questionList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Admin.selectQuestion");
	}

	@Override
	public UserDetail userDetail(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("Admin.selectUserDetail", userId);
	}

	@Override
	public int userStatusUpdate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("Admin.userStatusUpdate", m);
	}

	@Override
	public Report reportDetail(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("Admin.selectReportDetail",bno);
	}

	@Override
	public Question questionDetail(SqlSessionTemplate sqlSession, Question q) {
		return sqlSession.selectOne("Admin.selectQuestionDetail",q);
	}

	@Override
	public int updateQuestion(SqlSessionTemplate sqlSession, Question q) {
		return sqlSession.update("Admin.updateBStatus", q);
	}

	@Override
	public int insetAnswer(SqlSessionTemplate sqlSession, Question q) {
		return sqlSession.insert("Admin.insetAnswer", q);
	}

	@Override
	public int exchange(SqlSessionTemplate sqlSession, int excno) {
		return sqlSession.update("Admin.exchangeProcess",excno);
	}

	@Override
	public int allExchange(SqlSessionTemplate sqlSession, int excno) {
		return sqlSession.update("Admin.allExchangeProcess", excno);
	}


	



}
