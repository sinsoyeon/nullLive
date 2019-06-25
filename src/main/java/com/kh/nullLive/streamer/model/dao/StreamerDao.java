package com.kh.nullLive.streamer.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

public interface StreamerDao {

	int insertSubscribe(SqlSessionTemplate sqlSession, int mno, String streamer, int amount);

	int selectStreamer(SqlSessionTemplate sqlSession, String streamer);

}
