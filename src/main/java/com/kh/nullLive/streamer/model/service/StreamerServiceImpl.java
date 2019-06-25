package com.kh.nullLive.streamer.model.service;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.nullLive.streamer.model.dao.StreamerDao;

@Controller
public class StreamerServiceImpl implements StreamerService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private StreamerDao smDao;

	@Override
	public int insertSubscribe(int mno, String streamer, int amount) {
			return smDao.insertSubscribe(sqlSession,mno,streamer,amount);

	}

	@Override
	public int selectStreamer(String streamer) {

		return smDao.selectStreamer(sqlSession,streamer);
	}

}
