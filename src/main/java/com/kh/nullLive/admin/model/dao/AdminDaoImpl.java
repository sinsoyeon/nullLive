package com.kh.nullLive.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nullLive.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Override
	public ArrayList<Member> memberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Member.memberSelect");
	}



}
