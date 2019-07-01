package com.kh.nullLive.admin.model.service;

import java.util.ArrayList;

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

	ArrayList<Exchange> exchangeList();

	ArrayList<Question> questionList();

	UserDetail userDetail(String userId);

	int userStatusUpdate(Member m);

	Report reportDetail(int bno);



}
