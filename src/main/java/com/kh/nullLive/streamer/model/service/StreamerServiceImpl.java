package com.kh.nullLive.streamer.model.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.nullLive.streamer.model.dao.StreamerDao;
import com.kh.nullLive.streamer.model.vo.Streamer;

@Controller
public class StreamerServiceImpl implements StreamerService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private StreamerDao smDao;

	@Override
	public int insertSubscribe(Streamer stremaer) {
			return smDao.insertSubscribe(sqlSession,stremaer);

	}

	@Override
	public int selectStreamer(String streamer) {

		return smDao.selectStreamer(sqlSession,streamer);
	}

	@Override
	public int insertMnthlSbscr(Streamer streamer,int amount) {

		
		return smDao.insertMnthlSbscr(sqlSession,streamer,amount);
	}

	@Override
	public int insertNP(Streamer streamer, int amount) {
		return smDao.insertNP(sqlSession,streamer,amount);
	}

}
