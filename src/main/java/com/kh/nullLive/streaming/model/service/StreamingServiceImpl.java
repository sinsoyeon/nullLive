package com.kh.nullLive.streaming.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullLive.streaming.model.dao.StreamingDao;

@Service
public class StreamingServiceImpl implements StreamingService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private StreamingDao sd;
	
	//스트리밍 시작
	@Override
	public void startStreaming(int mno) {
		int result = sd.startStreaming(sqlSession,mno);
	}

	//스트리밍 종료
	@Override
	public void endStreaming(int mno) {
		int result = sd.endStreaming(sqlSession,mno);
	}

	
	
}
