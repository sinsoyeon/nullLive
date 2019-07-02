package com.kh.nullLive.streaming.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streamer.model.vo.Streamer;

public interface StreamingDao {


	/**
	 * Author : ryan
	 * Date : 2019. 7. 2.
	 * Comment : 멤버 isStreamer 수정
	 */
	int isStreamerUpdate(SqlSessionTemplate sqlSession, Member loginUser);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 2.
	 * Comment : Streamer 테이블 추가
	 * @param streamer 
	 */
	int insertStreamer(SqlSessionTemplate sqlSession, Member loginUser, Streamer streamer);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 2.
	 * Comment : 멤버 재로드
	 */
	Member resetMember(SqlSessionTemplate sqlSession, int mno);

}
