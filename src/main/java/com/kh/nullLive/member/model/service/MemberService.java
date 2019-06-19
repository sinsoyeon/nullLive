package com.kh.nullLive.member.model.service;

import com.kh.nullLive.member.model.exception.LoginException;
import com.kh.nullLive.member.model.vo.Member;

public interface MemberService {
	//로그인 - 회륜
	Member loginMember(Member m) throws LoginException;
	//회원가입 - 회륜
	int insertMember(Member m);
}
