package com.kh.nullLive.partner.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

public interface PartnerDao {

	int getMngPno(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	String selectMngBoardAuth(SqlSessionTemplate sqlSession, int pno);

	String selectMngChatAuth(SqlSessionTemplate sqlSession, int pno);

}
