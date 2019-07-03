package com.kh.nullLive.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.nullLive.admin.model.dao.AdminDao;
import com.kh.nullLive.admin.model.exception.QuestionAnswerException;
import com.kh.nullLive.admin.model.vo.Exchange;
import com.kh.nullLive.admin.model.vo.Question;
import com.kh.nullLive.admin.model.vo.Report;
import com.kh.nullLive.admin.model.vo.UserDetail;
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

	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :회원리스트 불러오기(페이징)
	 */
	@Override
	public ArrayList<Member> memberList(PagingVo paging) {
		ArrayList<Member> userList = ad.memberList(sqlSession, paging);
		return userList;
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :총 멤버수 카운트
	 */
	@Override
	public int totalMemberSelect() {
		int totalMember = ad.totalMemberSelect(sqlSession);
		return totalMember;
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :회원 상세보기
	 */
		@Override
		public UserDetail userDetail(String userId) {
			UserDetail userDetail = ad.userDetail(sqlSession, userId);
			return userDetail;
		}

		/**
		 * @author INHYO
		 * @date : 2019. 7. 3.
		 * @comment :회원 상태 변경
		 */
	@Override
	public int userStatusUpdate(Member m) {
		int result = 0;
		int updateBan=0;
		int insertBan=0;

		int result1 = ad.userStatusUpdate(sqlSession, m);

		if(m.getMstatus().equals("Y")) {
			updateBan = ad.updateBan(sqlSession, m);
		}else {
			insertBan = ad.insertBan(sqlSession, m);
		}
		if(result1 > 0 && updateBan > 0) {
			result=1;
		}
		if(result1 > 0 && insertBan > 0) {
			result=1;
		}
		return result;
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :스트리머 신고 리스트
	 */
	@Override
	public ArrayList<Report> streamerReportList() {
		ArrayList<Report> streamerReportList = ad.streamerReportList(sqlSession);
		return streamerReportList;
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :신고 상세보기
	 */
	@Override
	public Report reportDetail(int bno) {
		Report reportDetail = ad.reportDetail(sqlSession, bno);
		return reportDetail;
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :문의 리스트
	 */
	@Override
	public ArrayList<Question> questionList() {
		ArrayList<Question> QuestionList = ad.questionList(sqlSession);
		return QuestionList;
	}

	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :문의 상세보기
	 */
	@Override
	public Question questionDetail(Question q) {
		Question questionDetail = ad.questionDetail(sqlSession, q);
		return questionDetail;
	}

	/**
	 * @author INHYO
	 * @throws QuestionAnswerException 
	 * @date : 2019. 7. 3.
	 * @comment :문의 답변달기
	 */
	@Override
	public void questionAnswer(Question q) throws QuestionAnswerException {
		int result = 0;
		result = ad.insetAnswer(sqlSession,q);
		if (result <= 0) {
			throw new QuestionAnswerException("답변 전송 실패");
		}else {
			result += ad.updateQuestion(sqlSession,q);
			if (result <= 1) {
				throw new QuestionAnswerException("문의글 상태변경 실패");
			}
		}
	}

	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :환전 리스트
	 */
	@Override
	public ArrayList<Exchange> exchangeList() {
		ArrayList<Exchange> ExchangeList = ad.exchangeList(sqlSession);
		return ExchangeList;
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :환전하기
	 */
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
