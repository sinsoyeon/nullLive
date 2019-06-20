package com.kh.nullLive.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.member.model.vo.Member;

public interface MemberDao {
	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 18.
	 * @Comment : 비밀번호 확인
	 */
	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);

	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 18.
	 * @Comment : 로그인 정보 불러오기
	 */
	Member selectMember(SqlSessionTemplate sqlSession, Member m);

	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 18.
	 * @Comment : 회원가입
	 */
	int insertMember(SqlSessionTemplate sqlSession, Member m);

}
