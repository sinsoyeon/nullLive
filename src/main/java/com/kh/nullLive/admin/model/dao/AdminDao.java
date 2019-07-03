package com.kh.nullLive.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.admin.model.vo.Exchange;
import com.kh.nullLive.admin.model.vo.Question;
import com.kh.nullLive.admin.model.vo.Report;
import com.kh.nullLive.admin.model.vo.UserDetail;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.common.paging.model.vo.PagingVo;
import com.kh.nullLive.member.model.vo.Member;

public interface AdminDao {

	ArrayList<Member> memberList(SqlSessionTemplate sqlSession, PagingVo paging);

	ArrayList<Report> streamerReportList(SqlSessionTemplate sqlSession);

	ArrayList<Exchange> exchangeList(SqlSessionTemplate sqlSession);

	ArrayList<Question> questionList(SqlSessionTemplate sqlSession);

	UserDetail userDetail(SqlSessionTemplate sqlSession, String userId);

	int userStatusUpdate(SqlSessionTemplate sqlSession, Member m);

	int totalMemberSelect(SqlSessionTemplate sqlSession);

	Report reportDetail(SqlSessionTemplate sqlSession, int bno);

	Question questionDetail(SqlSessionTemplate sqlSession, Question q);

	int updateQuestion(SqlSessionTemplate sqlSession, Question q);

	int insetAnswer(SqlSessionTemplate sqlSession, Question q);

	int exchange(SqlSessionTemplate sqlSession, int excno);

	int updateBan(SqlSessionTemplate sqlSession, Member m);

	int insertBan(SqlSessionTemplate sqlSession, Member m);

	int allExchange(SqlSessionTemplate sqlSession, int integer);





}
