package com.kh.nullLive.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.nullLive.admin.model.dao.AdminDao;
import com.kh.nullLive.admin.model.vo.Exchange;
import com.kh.nullLive.admin.model.vo.Question;
import com.kh.nullLive.admin.model.vo.Report;
import com.kh.nullLive.admin.model.vo.UserDetail;
import com.kh.nullLive.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao ad;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private DataSourceTransactionManager transactionManager;

	@Override
	public ArrayList<Member> memberList() {
		
		 ArrayList<Member> userList = ad.memberList(sqlSession);
		
		return userList;
	}

	@Override
	public ArrayList<Report> streamerReportList() {

		ArrayList<Report> streamerReportList = ad.streamerReportList(sqlSession);

		return streamerReportList;
	}

	@Override
	public ArrayList<Exchange> exchangeList() {
		ArrayList<Exchange> ExchangeList = ad.exchangeList(sqlSession);
		return ExchangeList;
	}

	@Override
	public ArrayList<Question> questionList() {
		ArrayList<Question> QuestionList = ad.questionList(sqlSession);
		return QuestionList;
	}

	@Override
	public UserDetail userDetail() {
		UserDetail userDeatil = ad.userDetail(sqlSession);
		return null;
	}
	
	
	

}
