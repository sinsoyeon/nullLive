package com.kh.nullLive.streamer.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.streamer.model.vo.Streamer;

public interface StreamerDao {


	int selectStreamer(SqlSessionTemplate sqlSession, String streamer);

	int insertSubscribe(SqlSessionTemplate sqlSession, Streamer stremaer);

	int insertMnthlSbscr(SqlSessionTemplate sqlSession, Streamer streamer,int amount);

	int insertNP(SqlSessionTemplate sqlSession, Streamer streamer, int amount);

}
