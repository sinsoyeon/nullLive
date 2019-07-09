package com.kh.nullLive.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.nullLive.admin.model.dao.AdminDao;
import com.kh.nullLive.admin.model.exception.QuestionAnswerException;
import com.kh.nullLive.admin.model.vo.Ban;
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
		public UserDetail userDetail(UserDetail ud) {
			UserDetail userDetail = ad.userDetail(sqlSession, ud);
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
	public ArrayList<Report> streamerReportList(PagingVo paging) {
		ArrayList<Report> streamerReportList = ad.streamerReportList(sqlSession,paging);
		return streamerReportList;
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 9.
	 * @comment :스트리머 신고글  수 카운트
	 */
	@Override
	public int totalStreamerReport() {
		int totalStreamerReport = ad.totalStreamerReport(sqlSession);
		return totalStreamerReport;
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 3.
	 * @comment :일반회원 신고 리스트
	 */
	@Override
	public ArrayList<Report> memberReportList(PagingVo paging) {
		ArrayList<Report> memberReportList = ad.memberReportList(sqlSession,paging);
		return memberReportList;
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 9.
	 * @comment :일반회원 신고글  수 카운트
	 */
	@Override
	public int totalMemberReport() {
		int totalMemberReport = ad.totalMemberReport(sqlSession);
		return totalMemberReport;
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
	public ArrayList<Question> questionList(PagingVo paging) {
		ArrayList<Question> QuestionList = ad.questionList(sqlSession,paging);
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

	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :관리 목록 조회
	 */
	@Override
	public ArrayList<Board> FAQList(PagingVo paging) {
		ArrayList<Board> FAQList = ad.FAQList(sqlSession, paging);
		return FAQList;
	}
	
	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :FAQ 작성
	 */
	@Override
	public int insertFAQ(Board b) {
		int result = ad.insertFAQ(sqlSession, b);
		return result;
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :FAQ / 공지사항  상세보기
	 */
	@Override
	public Board detail(int bno) {
		Board detail = ad.detail(sqlSession,bno);
		return detail;
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :FAQ 수정
	 */
	@Override
	public int modify(Board fAQModify) {
		int result = ad.modify(sqlSession, fAQModify);
		return result;
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :FAQ 삭제
	 */
	@Override
	public int deleteContent(int bno) {
		int result = ad.deleteContent(sqlSession,bno);
		return result;
	}
	

	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :공지사항 목록 조회
	 */
	@Override
	public ArrayList<Board> noticeList(PagingVo paging) {
		ArrayList<Board> noticeList = ad.noticeList(sqlSession, paging);
		return noticeList;
	}

	/**
	 * @author INHYO
	 * @date : 2019. 7. 4.
	 * @comment :공지사항 작성
	 */
	@Override
	public int insertNotice(Board b) {
		int result = ad.insertNotice(sqlSession, b);
		return result;
	}

	/**
	 * @author INHYO
	 * @date : 2019. 7. 5.
	 * @comment :정지 내역 찾기
	 */
	@Override
	public String selectBan(int bno) {
		String ban = ad.selectBan(sqlSession, bno);
		return ban;
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 5.
	 * @comment :신고처리 프로세스
	 */
	@Override
	public int reportProcess(int bno, Member m) {
		int result = 0;
		if(!m.getMstatus().equals("Y")) {
			int result1 = ad.userStatusUpdate(sqlSession,m); // 회원의 상태를 변경
			int result2 = ad.insertReportBan(sqlSession,m);// 밴내역 추가
		}
		int result3 = ad.updateReport(sqlSession, bno);// 해당 글 처리 상태 변경
		
		return result;
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 9.
	 * @comment :문의 신고글  수 카운트
	 */
	@Override
	public int totalQuestionSelect() {
		int totalQuestionSelect = ad.totalQuestionSelect(sqlSession);
		return totalQuestionSelect;
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 9.
	 * @comment :FAQ 신고글  수 카운트
	 */
	@Override
	public int totalFAQSelect() {
		int totalFAQSelect = ad.totalFAQSelect(sqlSession);
		return totalFAQSelect;
	}
	/**
	 * @author INHYO
	 * @date : 2019. 7. 9.
	 * @comment :공지사항 신고글  수 카운트
	 */
	@Override
	public int totalNoticeSelect() {
		int totalNoticeSelect = ad.totalNoticeSelect(sqlSession);
		return totalNoticeSelect;
	}

}
