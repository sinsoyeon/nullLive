package com.kh.nullLive.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.admin.model.vo.Exchange;
import com.kh.nullLive.admin.model.vo.Question;
import com.kh.nullLive.admin.model.vo.Report;
import com.kh.nullLive.admin.model.vo.UserDetail;
import com.kh.nullLive.member.model.vo.Member;

public interface AdminDao {

	ArrayList<Member> memberList(SqlSessionTemplate sqlSession);

	ArrayList<Report> streamerReportList(SqlSessionTemplate sqlSession);

	ArrayList<Exchange> exchangeList(SqlSessionTemplate sqlSession);

	ArrayList<Question> questionList(SqlSessionTemplate sqlSession);

	UserDetail userDetail(SqlSessionTemplate sqlSession);



}
