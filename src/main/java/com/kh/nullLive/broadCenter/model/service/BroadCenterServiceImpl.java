package com.kh.nullLive.broadCenter.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullLive.broadCenter.model.dao.BroadCenterDao;
import com.kh.nullLive.broadCenter.model.exception.StreamerInsertException;
import com.kh.nullLive.broadCenter.model.exception.StreamerUpdateException;
import com.kh.nullLive.broadCenter.model.vo.BroadCenter;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streamer.model.vo.Streamer;

@Service
public class BroadCenterServiceImpl implements BroadCenterService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BroadCenterDao bcd;

	//최초 방송 약관 동의 처리
	@Override
	public int streamerChange(Member loginUser, Streamer streamer)
			throws StreamerUpdateException, StreamerInsertException {
		int result = 0;
		result = bcd.isStreamerUpdate(sqlSession,loginUser);
		
		if(result <= 0) {
			throw new StreamerUpdateException("업데이트 실패!");
		}else {
			result = bcd.insertStreamer(sqlSession,loginUser,streamer);
			if(result <= 0) {
				throw new StreamerInsertException("스트리머 추가 실패!");
			}
		}
		return result;
	}

	//멤버 재로드
	@Override
	public Member resetMember(int mno) {
		return bcd.resetMember(sqlSession,mno);
	}

	
	//방송국 메인 페이지 정보 조회(정연)
	@Override
	public HashMap<String, Object> selectMainInfo(int mno) {
		return bcd.selectMainInfo(sqlSession, mno);
	}

	//방송기능 설정 페이지 정보 조회(정연)
	@Override
	public BroadCenter selectBroadSetting(int mno) {
		return bcd.selectBroadSetting(sqlSession, mno);
	}
	
}
