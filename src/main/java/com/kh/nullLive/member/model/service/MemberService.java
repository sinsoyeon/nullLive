package com.kh.nullLive.member.model.service;

import com.kh.nullLive.member.model.exception.LoginException;
import com.kh.nullLive.member.model.vo.Member;

public interface MemberService {
	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 18.
	 * @Comment : 로그인
	 */
	Member loginMember(Member m) throws LoginException;

	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 18.
	 * @Comment : 회원가입
	 */
	int insertMember(Member m);
}
