package com.kh.nullLive.partner.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PartnerDaoImpl implements PartnerDao {

	/**
	 * @author : uukk
	 * @date : 2019. 7. 13.
	 * @comment : 매니저 pno 조회
	 */
	@Override
	public int getMngPno(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return sqlSession.selectOne("Partner.getMngPno",hmap);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 13.
	 * @comment : 매니저 게시판 권한 조회
	 */
	@Override
	public String selectMngBoardAuth(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("Partner.selectMngBoardAuth",pno);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 13.
	 * @comment : 매니저 채팅방 권한 조회
	 */
	@Override
	public String selectMngChatAuth(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("Partner.selectMngChatAuth",pno);
	}

}
