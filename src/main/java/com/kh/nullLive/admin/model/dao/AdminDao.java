package com.kh.nullLive.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.member.model.vo.Member;

public interface AdminDao {

	ArrayList<Member> memberList(SqlSessionTemplate sqlSession);



}
