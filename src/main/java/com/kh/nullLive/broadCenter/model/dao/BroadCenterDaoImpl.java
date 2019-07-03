package com.kh.nullLive.broadCenter.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streamer.model.vo.Streamer;

@Repository
public class BroadCenterDaoImpl implements BroadCenterDao {

	//멤버 isStreamer 수정
	@Override
	public int isStreamerUpdate(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.update("Streamer.isStreamerUpdate",loginUser);
	}

	//Streamer 테이블 추가
	@Override
	public int insertStreamer(SqlSessionTemplate sqlSession, Member loginUser, Streamer streamer) {
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("mno", loginUser.getMno());
		hmap.put("bank_code",streamer.getBank_code());
		hmap.put("account", streamer.getAccount());
		hmap.put("holder",streamer.getHolder());
		return sqlSession.insert("Streamer.insertStreamer",hmap);
	}

	//멤버 재로드
	@Override
	public Member resetMember(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("Streaming.selectMember",mno);
	}

}
