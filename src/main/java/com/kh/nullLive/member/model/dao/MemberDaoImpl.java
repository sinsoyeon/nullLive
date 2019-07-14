package com.kh.nullLive.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.common.attachment.model.vo.Attachment;
import com.kh.nullLive.member.model.vo.BankAccount;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.member.model.vo.Subscription;
import com.kh.nullLive.streamer.model.vo.Streamer;

@Repository
public class MemberDaoImpl implements MemberDao {
	//비밀번호 확인
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.selectPwd",m.getMid());
	}
	//로그인 정보 불러오기
	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.selectMember",m);
	}
	//회원가입
	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("Member.insertMember",m);
	}
	//회원가입한 번호 가져오기
	@Override
	public int getMno(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Member.selectMno");
	}
	//개인정보수정
	@Override
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("Member.updateMember",m);
	}
	//계좌정보 수정
	@Override
	public int updateBankAccount(SqlSessionTemplate sqlSession, BankAccount bankAccount) {
		return sqlSession.update("Streamer.updateStreamerInfo",bankAccount);
	}
	//비밀번호변경
	@Override
	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("Member.updatePwd",m);
	}
	//회원가입 시 프로필 이미지 등록
	@Override
	public int insertProImage(SqlSessionTemplate sqlSession, Attachment att) {
		return sqlSession.insert("Member.insertProImageDefault",att);
	}
	//등록 프로필 attno가져오기
	@Override
	public int getAttno(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Member.selectAttno");
	}
	//회원가입 시 프로필 이미지 관리 등록
	@Override
	public int insertProImageManage(SqlSessionTemplate sqlSession, Member m, int attno) {
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("mno",m.getMno());
		hmap.put("attno",attno);
		return sqlSession.update("Member.insertProImageManage",hmap);
	}
	//마이페이지 프로필이미지 불러오기
	@Override
	public Attachment getProfile(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("Member.selectProfile",mno);
	}
	//이전 프로필사진 번호 가져오기
	@Override
	public int getPreImageNo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.selectProfileNo",m);
	}
	//이전 프로필사진 비활성화
	@Override
	public int preImageDisable(SqlSessionTemplate sqlSession, int attno) {
		return sqlSession.update("Member.updatePreProImage",attno);
	}
	//프로필이미지 변경
	@Override
	public int updateProImage(SqlSessionTemplate sqlSession, Member m, Attachment att) {
		return sqlSession.insert("Member.insertProImage",att);
	}
	//이전 프로필사진 관리 수정
	@Override
	public int updateProImageManage(SqlSessionTemplate sqlSession, Member m, int newAttno) {
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("mno",m.getMno());
		hmap.put("attno",newAttno);
		return sqlSession.update("Member.updateProImageManage",hmap);
	}
	//아이디 중복체크
	@Override
	public int duplicateTest(SqlSessionTemplate sqlSession, String mid) {
		return sqlSession.selectOne("Member.duplicateTest",mid);
	}
  
	/* 카카오톡 첫로그인인지 확인용 메소드(정연) */
	@Override
	public int firstLoginCheck(SqlSessionTemplate sqlSession, HashMap<String, Object> userInfo) {
		String id = userInfo.get("userId").toString();
		
		return sqlSession.selectOne("Member.firstLoginCheck", id);
	}
	
	//카카오톡 비밀번호 받아오는 메소드(정연)
	@Override
	public String selectKakaoEncPassword(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("Member.selectKakaoPwd",userId);
	}
	
	//카카오톡 로그인 정보 불러오기 메소드(정연)
	@Override
	public Member selectKakaoMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("Member.selectKakaoMember", userId);
	}
	/**
	 * @author : uukk
	 * @date : 2019. 7. 3.
	 * @comment : member mno로 조회
	 */
	@Override
	public Member selectMemberMno(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("Member.selectMemberMno",mno);
	}
	//계좌 정보 가져오기
	@Override
	public BankAccount getBankAccount(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("Member.getBankAccountInfo",mno);
	}
	//방송국 개설
	@Override
	public int createBroadCenter(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("Member.insertBroadCenter",m);
	}
	//계좌 잇는지
	@Override
	public int existBankAccount(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("Member.existBankAccount",mno);
	}
	//이메일 인증 완료
	@Override
	public int joinConfirm(SqlSessionTemplate sqlSession, String mid) {
		return sqlSession.update("Member.joinConfirm",mid);
	}
	//회원 탈퇴
	@Override
	public int secession(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("Member.secession",m);
	}
	//정지 기간 가져오기
	@Override
	public HashMap<String,Object> getBanDate(SqlSessionTemplate sqlSession, Member loginMember) {
		return sqlSession.selectOne("Member.getBanDate",loginMember);
		
	}
	//아이디 찾기
	@Override
	public String getSearchId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.getSearchId",m);
	}
	//비밀전호 재발급
	@Override
	public int pwdReload(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("Member.pwdReload",m);
	}
	//구독 리스트 가져오기
	@Override
	public ArrayList<Subscription> getSubList(SqlSessionTemplate sqlSession, Member loginUser) {
		return (ArrayList)sqlSession.selectList("Member.getSubList",loginUser);
	}
	//휴대폰 재설정
	@Override
	public int phoneChange(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("Member.phoneChange",m);
	}
	//성인 인증
	@Override
	public int confirmAdult(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("Member.confrimAdult",m);
	}
	//파트너조회
	@Override
	public ArrayList<HashMap<String, Object>> partner(SqlSessionTemplate sqlSession, Member loginUser) {
		return (ArrayList)sqlSession.selectList("Member.partner",loginUser);
	}
	@Override
	public int selectAlarmCount(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Member.selectAlarmCount",mno);
	}
	@Override
	public ArrayList<HashMap<String, Object>> selectMyAlmList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> infoMap) {
		int mno = (int)infoMap.get("mno");
		PageInfo pi = (PageInfo)infoMap.get("pi");
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getLimit());
		
		System.out.println(((ArrayList)sqlSession.selectList("Member.selectMyAlmList",mno,rowBounds)).size());
		
		return (ArrayList)sqlSession.selectList("Member.selectMyAlmList",mno,rowBounds);
	}
	@Override
	public int updateAlarm(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return sqlSession.update("Member.updateAlarm", infoMap);
	}
}
