package com.kh.nullLive.admin.model.service;

import java.util.ArrayList;

import com.kh.nullLive.admin.model.vo.Exchange;
import com.kh.nullLive.admin.model.vo.Question;
import com.kh.nullLive.admin.model.vo.Report;
import com.kh.nullLive.member.model.vo.Member;

public interface AdminService {

	ArrayList<Member> memberList();

	ArrayList<Report> streamerReportList();

	ArrayList<Exchange> ExchangeList();

	ArrayList<Question> QuestionList();


}
