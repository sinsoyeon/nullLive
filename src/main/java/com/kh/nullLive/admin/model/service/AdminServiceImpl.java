package com.kh.nullLive.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.nullLive.admin.model.dao.AdminDao;
import com.kh.nullLive.admin.model.vo.Exchange;
import com.kh.nullLive.admin.model.vo.Question;
import com.kh.nullLive.admin.model.vo.Report;
import com.kh.nullLive.admin.model.vo.UserDetail;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.common.paging.model.vo.PagingVo;
import com.kh.nullLive.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao ad;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private DataSourceTransactionManager transactionManager;

	@Override
	public ArrayList<Member> memberList(PagingVo paging) {
		ArrayList<Member> userList = ad.memberList(sqlSession, paging);
		return userList;
	}

	@Override
	public int totalMemberSelect() {
		int totalMember = ad.totalMemberSelect(sqlSession);
		return totalMember;
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
	public UserDetail userDetail(String userId) {
		UserDetail userDetail = ad.userDetail(sqlSession, userId);
		return userDetail;
	}

	@Override
	public int userStatusUpdate(Member m) {
		int result = ad.userStatusUpdate(sqlSession, m);
		return result;
	}

	@Override
	public Report reportDetail(int bno) {
		Report reportDetail = ad.reportDetail(sqlSession, bno);
		return reportDetail;
	}

	@Override
	public Question questionDetail(Question q) {
		Question questionDetail = ad.questionDetail(sqlSession, q);
		return questionDetail;
	}

	@Override
	public int questionAnswer(Question q) {
	int result = 0;
	int result1 = ad.updateQuestion(sqlSession,q);
	int result2 = ad.insetAnswer(sqlSession,q);
	
	if (result1 > 0 && result2 > 0) {
		result = 1;
		}
		return result;
	}

	
	//소연 : 인효오빠꺼 이어받아서 환전처리
	@Override
	public int exchange(int excno) {
		return ad.exchange(sqlSession, excno);
	}

	//소연 : 다중환전
	@Override
	public int allExchange(List<String> allExcList) {
		int result = 0;
		int temp = 0;
		
		for(int i=0;i<allExcList.size();i++) {
			temp += ad.allExchange(sqlSession,Integer.parseInt(allExcList.get(i)));
		}
		
		System.out.println("allExcList size : " + allExcList.size());
		System.out.println("result : " + temp);
		
		if(temp == allExcList.size()) {
			result = 1;
		}
		
		System.out.println("returnResult : " + result);
		
		return result;
	}

	




}
