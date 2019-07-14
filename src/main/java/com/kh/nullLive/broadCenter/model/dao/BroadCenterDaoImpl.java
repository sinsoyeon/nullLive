package com.kh.nullLive.broadCenter.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nullLive.broadCenter.model.vo.BroadCenter;
import com.kh.nullLive.common.attachment.model.vo.Attachment;
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
	public int insertStreamer(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.insert("Streamer.insertStreamer",loginUser);
	}

	//멤버 재로드
	@Override
	public Member resetMember(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("Streaming.selectMember",mno);
	}

	
	//방송국 메인 페이지 정보 조회(정연)
	@Override
	public HashMap<String, Object> selectMainInfo(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.selectOne("Streamer.selectMainInfo", mno);
	}

	//방송기능설정 페이지 정보 조회(정연)
	@Override
	public HashMap<String, Object> selectBroadSetting(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("BroadCenter.selectBroadSetting", mno);
	}

	
	//방송기능 설정 업데이트 (정연)
	@Override
	public int updateBroadSetting(SqlSessionTemplate sqlSession, HashMap<String, Object> broadInfo) {
		return sqlSession.update("BroadCenter.updateBroadSetting", broadInfo);
	}


	//매니저 설정 페이지로 이동(정연)
	@Override
	public ArrayList<HashMap<String, Object>> selectpartnerList(SqlSessionTemplate sqlSession, int mno) {
		return (ArrayList)sqlSession.selectList("BroadCenter.selectpartnerList", mno);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectBlackList(SqlSessionTemplate sqlSession, int mno) {
		return (ArrayList)sqlSession.selectList("BroadCenter.selectBlackList",mno);
	}

	@Override
	public int selectBlackListCount(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("BroadCenter.selectBlackListCount",mno);
	}

	@Override
	public HashMap<String, Object> selectOneBlackList(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BroadCenter.selectOneBlackList",infoMap);
	}

	//파트너 상세 조회(정연)
	@Override
	public HashMap<String, Object> partnerDetail(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("BroadCenter.partnerDetail", mno);
	}

	//프로필 조회(정연)
	@Override
	public Attachment getProfile(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("Member.selectProfile", mno);
	}

	// 방송 공지 게시판 페이지로 이동(정연)
	@Override
	public HashMap<String, Object> selectNoticeBoard(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("BroadCenter.selectNoticeBoard", mno);
	}

	//방송 공지 수정 체크(정연)
	@Override
	public int updateNoticeCheck(SqlSessionTemplate sqlSession, HashMap<String, Object> updateInfo) {
		return sqlSession.update("BroadCenter.updateNoticeCheck", updateInfo);
	}

	@Override
	public int deleteNotice(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int firstCheckCommunication(SqlSessionTemplate sqlSession, HashMap<String, Object> commuInfo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int enableCommunityBoard(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectCommunityList(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<HashMap<String, Object>> searchStreamer(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<HashMap<String, Object>> searchStreamerName(SqlSessionTemplate sqlSession, String name) {
		// TODO Auto-generated method stub
		return null;
	}

	
	//방송 공지 삭제(정연)
	@Override
	public int deleteNotice(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.update("BroadCenter.deleteNotice", mno);
	}

	//시청자 소통 개설 여부 확인(정연)
	@Override
	public int firstCheckCommunication(SqlSessionTemplate sqlSession, HashMap<String, Object> commuInfo) {
		return sqlSession.selectOne("BroadCenter.firstCheckCommunication", commuInfo);
	}

	//첫 소통 게시판 활성화(정연)
	@Override
	public int enableCommunityBoard(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.insert("BroadCenter.enableCommunityBoard", mno);
	}

	//소통게시판 리스트 조회(정연)
	@Override
	public ArrayList<HashMap<String, Object>> selectCommunityList(SqlSessionTemplate sqlSession, int smno) {
		return (ArrayList)sqlSession.selectList("BroadCenter.selectCommunityList", smno);
	}

	//스트리머 검색(정연)
	@Override
	public ArrayList<HashMap<String, Object>> searchStreamer(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("BroadCenter.searchStreamer");
	}

	@Override
	public ArrayList<HashMap<String, Object>> searchStreamerName(SqlSessionTemplate sqlSession, String name) {
		return (ArrayList)sqlSession.selectList("BroadCenter.searchStreamerName", name);
	}

	//broadCenter
	@Override
	public BroadCenter broadCenter(SqlSessionTemplate sqlSession, int smno) {
		return sqlSession.selectOne("BroadCenter.selectBroadCenter", smno) ;
	}

	@Override
	public HashMap<String, Object> streamerPofile(SqlSessionTemplate sqlSession, int smno) {
		return sqlSession.selectOne("BroadCenter.streamerPofile", smno);
	}

	
	

}
