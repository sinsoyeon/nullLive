package com.kh.nullLive.streaming.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class StreamingDaoImpl implements StreamingDao {

	//스트리밍 시작
	@Override
	public int startStreaming(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.insert("Streaming.startStreaming",mno);
	}

	//스트리밍 종료
	@Override
	public int endStreaming(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.update("Streaming.endStreaming",mno);
	}

	//방송 번호 가져오기
	@Override
	public int getBhno(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("Streaming.getBhno",mno);
	}

}
