package com.kh.nullLive.streamer.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class StreamerDaoImpl implements StreamerDao {

	@Override
	public int insertSubscribe(SqlSessionTemplate sqlSession, int mno, String streamer, int amount) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Streamer.insertSub");
	}

	@Override
	public int selectStreamer(SqlSessionTemplate sqlSession, String streamer) {
		int sno = 0;
		String temp = sqlSession.selectOne("Streamer.selectStreamer",streamer);
		if(temp!=null) {
			sno = Integer.parseInt(temp);
		}
		
		return sno;
	}
	
}
