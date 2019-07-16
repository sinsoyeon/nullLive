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
import com.kh.nullLive.common.attachment.model.vo.Attachment;
import com.kh.nullLive.member.model.vo.Member;

@Service
public class BroadCenterServiceImpl implements BroadCenterService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BroadCenterDao bcd;

	//최초 방송 약관 동의 처리
	@Override
	public int streamerChange(Member loginUser)
			throws StreamerUpdateException, StreamerInsertException {
		int result = 0;
		//Member의 isStreamer 업데이트
		result = bcd.isStreamerUpdate(sqlSession,loginUser);
		
		if(result <= 0) {
			throw new StreamerUpdateException("업데이트 실패!");
		}else {
			result = bcd.insertStreamer(sqlSession,loginUser);
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
	public HashMap<String, Object> selectBroadSetting(int mno) {
		return bcd.selectBroadSetting(sqlSession, mno);
	}

	//방송기능 설정 업데이트 (정연)
	@Override
	public int updateBroadSetting(HashMap<String, Object> broadInfo) {
		return bcd.updateBroadSetting(sqlSession, broadInfo);
	}
	
	//블랙 리스트 조회 (소여ㄴ)
	@Override
	public ArrayList<HashMap<String, Object>> selectBlackList(int mno) {
		// TODO Auto-generated method stub
		return bcd.selectBlackList(sqlSession,mno);
	}

	//블랙 리스트 인원수 조회 (소연)
	@Override
	public int selectBlackListCount(int mno) {
		// TODO Auto-generated method stub
		return bcd.selectBlackListCount(sqlSession,mno);
	}

	@Override
	public HashMap<String, Object> selectOneBlackList(HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return bcd.selectOneBlackList(sqlSession,infoMap);
	}
	
	

	//매니저 설정 페이지로 이동(정연)
	@Override
	public ArrayList<HashMap<String, Object>> selectpartnerList(int mno) {
		return bcd.selectpartnerList(sqlSession, mno);
	}
	
	//파트너 상세 조회(정연)
	@Override
	public HashMap<String, Object> partnerDetail(int mno) throws StreamerUpdateException{
		HashMap<String, Object> detail = bcd.partnerDetail(sqlSession, mno);
		
		if(detail == null) {
			throw new StreamerUpdateException("매니저 상세 조회 실패!");
		}
		
		return detail;
		
		
	}

	
	//프로필(정연)
	@Override
	public Attachment getProfile(int mno) throws StreamerUpdateException{
		Attachment att = null;
		
		att = bcd.getProfile(sqlSession, mno);
		
		if(att == null) {
			throw new StreamerUpdateException("프로필 조회 실패!");
		}
		return att;
	}

	// 방송 공지 게시판 페이지로 이동(정연)
	@Override
	public HashMap<String, Object> selectNoticeBoard(int mno) throws StreamerUpdateException{
		return bcd.selectNoticeBoard(sqlSession, mno);
	}

	//방송 공지 수정(정연)
	@Override
	public int updateNoticeCheck(HashMap<String, Object> updateInfo) {
		return bcd.updateNoticeCheck(sqlSession, updateInfo);
	}

	//방송 공지 삭제(정연)
	@Override
	public int deleteNotice(int mno) {
		return bcd.deleteNotice(sqlSession, mno);
	}

	//시청자 소통 개설 여부 확인(정연)
	@Override
	public int firstCheckCommunication(HashMap<String, Object> commuInfo) {
		return bcd.firstCheckCommunication(sqlSession, commuInfo);
	}

	//첫 소통 게시판 활성화(정연)
	@Override
	public int enableCommunityBoard(int smno) {
		return bcd.enableCommunityBoard(sqlSession, smno);
	}

	//소통 게시판 리스트 조회(정연)
	@Override
	public ArrayList<HashMap<String, Object>> selectCommunityList(HashMap<String, Object> pagingHmap) {
		return bcd.selectCommunityList(sqlSession, pagingHmap);
	}

	//스트리머 검색(정연)
	@Override
	public ArrayList<HashMap<String, Object>>searchStreamer() {
		return bcd.searchStreamer(sqlSession);
	}

	@Override
	public ArrayList<HashMap<String, Object>> searchStreamerName(String name) {
		return bcd.searchStreamerName(sqlSession, name);
	}

	@Override
	public BroadCenter broadCenter(int smno) {
		return bcd.broadCenter(sqlSession, smno);
	}

	@Override
	public HashMap<String, Object> streamerPofile(int smno) {
		return bcd.streamerPofile(sqlSession, smno);
	}

	//소통 게시판 상세(정연)
	@Override
	public HashMap<String, Object> selectCommunityDetail(int bno) {
		return bcd.selectCommunityDetail(sqlSession, bno);
	}

	//소통게시판 조회수 증가(정연)
	@Override
	public int countCommunity(int bno) {
		return bcd.countCommunity(sqlSession, bno);
	}

	//bbno 찾기(정연)
	@Override
	public int selectBbno(HashMap<String, Object> commuInfo) {
		return bcd.selectBbno(sqlSession, commuInfo);
	}

	//소통 게시글 등록(정연)
	@Override
	public int insertCommunityDetail(HashMap<String, Object> insertDetail) {
		return bcd.insertCommunityDetail(sqlSession, insertDetail);
	}

	//소통게시물 수정(정연)
	@Override
	public int updateCommunityDetail(HashMap<String, Object> updateDetail) {
		return bcd.updateCommunityDetail(sqlSession, updateDetail);
	}
	
	//소통 게시물 삭제(정연)
	@Override
	public int deleteCommu(int bno) {
		return bcd.deleteCommu(sqlSession, bno);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 16.
	 * @comment : 페이징처리를 위한 listcount조회
	 */
	@Override
	public int getCommuBoardListCount(int smno) {
		return bcd.getCommuBoardListCount(sqlSession,smno);
	}

	

	
}
