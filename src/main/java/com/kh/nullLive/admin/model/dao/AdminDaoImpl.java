package com.kh.nullLive.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nullLive.admin.model.vo.Exchange;
import com.kh.nullLive.admin.model.vo.Question;
import com.kh.nullLive.admin.model.vo.Report;
import com.kh.nullLive.admin.model.vo.UserDetail;
import com.kh.nullLive.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Override
	public ArrayList<Member> memberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Member.memberSelect");
	}

	@Override
	public ArrayList<Report> streamerReportList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Board.selectReportList");
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



}
