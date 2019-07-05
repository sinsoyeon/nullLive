package com.kh.nullLive.streaming.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

public interface StreamingDao {

	/**
	 * Author : ryan
	 * Date : 2019. 7. 3.
	 * Comment : 스트리밍 시작
	 */
	int startStreaming(SqlSessionTemplate sqlSession, int mno);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 3.
	 * Comment : 스트리밍 종료
	 */
	int endStreaming(SqlSessionTemplate sqlSession, int mno);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 5.
	 * Comment : 방송 번호 가져오기
	 */
	int getBhno(SqlSessionTemplate sqlSession, int mno);



}
