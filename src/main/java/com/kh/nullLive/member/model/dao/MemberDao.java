package com.kh.nullLive.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.member.model.vo.Member;

public interface MemberDao {
	//비밀번호 확인 - 회륜
	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);
	//로그인 정보 불러오기 - 회륜
	Member selectMember(SqlSessionTemplate sqlSession, Member m);
	//회원가입 - 회륜
	int insertMember(SqlSessionTemplate sqlSession, Member m);

}
