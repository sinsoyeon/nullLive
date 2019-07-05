package com.kh.nullLive.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.nullLive.admin.model.exception.QuestionAnswerException;
import com.kh.nullLive.admin.model.vo.Exchange;
import com.kh.nullLive.admin.model.vo.Question;
import com.kh.nullLive.admin.model.vo.Report;
import com.kh.nullLive.admin.model.vo.UserDetail;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.common.paging.model.vo.PagingVo;
import com.kh.nullLive.member.model.vo.Member;

public interface AdminService {

	ArrayList<Member> memberList(PagingVo paging);

	int totalMemberSelect();

	ArrayList<Report> streamerReportList();
	
	ArrayList<Report> memberReportList();

	ArrayList<Exchange> exchangeList();

	ArrayList<Question> questionList();

	UserDetail userDetail(UserDetail userDetail);

	int userStatusUpdate(Member m);

	Report reportDetail(int bno);

	Question questionDetail(Question q);

	void questionAnswer(Question q) throws QuestionAnswerException;

	int exchange(int excno);

	int allExchange(List<String> allExcList);

	ArrayList<Board> FAQList();

	ArrayList<Board> noticeList();

	Board detail(int bno); // FAQ/공지사항 상세보기

	int modify(Board fAQModify); // FAQ/공지사항 수정

	int insertFAQ(Board b);
	
	int insertNotice(Board b);

	int deleteContent(int bno); // FAQ/공지사항 삭제

	String selectBan(int bno);

	int reportProcess(Report r, Member m);





}
