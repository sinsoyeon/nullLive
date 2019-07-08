package com.kh.nullLive.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.nullLive.common.attachment.model.vo.Attachment;
import com.kh.nullLive.member.model.dao.MemberDao;
import com.kh.nullLive.member.model.exception.CheckException;
import com.kh.nullLive.member.model.exception.InsertMemberException;
import com.kh.nullLive.member.model.exception.LoginException;
import com.kh.nullLive.member.model.exception.ProfileException;
import com.kh.nullLive.member.model.exception.UpdateMemberException;
import com.kh.nullLive.member.model.vo.BankAccount;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streamer.model.exception.SelectStreamerException;
import com.kh.nullLive.streamer.model.vo.Streamer;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDao md;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	//로그인
	@Override
	public Member loginMember(Member m) throws LoginException {
		Member loginMember = null;
		String encPassword = md.selectEncPassword(sqlSession,m);

		if(!passwordEncoder.matches(m.getMpwd(), encPassword)) {
			throw new LoginException("아이디 또는 비밀번호를 확인하세요");
		}else {
			loginMember = md.selectMember(sqlSession,m);
		}
		return loginMember;
	}

	//회원가입
	@Override
	public void insertMember(Member m) throws InsertMemberException {
		int result = 0;
		result = md.insertMember(sqlSession, m);
		if(result <= 0) {
			throw new InsertMemberException("회원가입 실패");
		}
	}

	//회원가입한 번호 가져오기
	@Override
	public int getMno() {
		return md.getMno(sqlSession);
	}

	//프로필이미지 등록
	@Override
	public void insertProImage(Member m) throws InsertMemberException {
		int result = 0;
		Attachment att = new Attachment();
		att.setFilePath("resources\\uploadFiles\\profile_image");
		att.setChangeName("profile_sample.PNG");
		att.setOriginName("originName");
		result = md.insertProImage(sqlSession,att);
		if(result <= 0) {
			throw new InsertMemberException("프로필이미지 등록 실패");			
		}
		int attno = md.getAttno(sqlSession);
		result = md.insertProImageManage(sqlSession, m,attno);
		if(result <= 0) {
			throw new InsertMemberException("이미지 관리 등록 실패");
		}
	}

	//개인정보수정
	@Override
	public Member updateMember(Member m, BankAccount bankAccount) throws UpdateMemberException {
		int result = 0;
		result = md.updateMember(sqlSession,m);
		if(result <= 0 ) {
			throw new UpdateMemberException("수정실패");
		}
		if(bankAccount.getBankAccount() != null) {
			bankAccount.setMno(m.getMno());
			result += md.updateBankAccount(sqlSession,bankAccount);
			
			if(result <= 1 ) {
				throw new UpdateMemberException("수정실패");
			}
		}
		return md.selectMember(sqlSession, m);
	}

	//비밀번호 확인
	@Override
	public void checkPwd(Member m) throws CheckException {
		String encPassword = md.selectEncPassword(sqlSession,m);
		if(!passwordEncoder.matches(m.getMpwd(), encPassword)) {
			throw new CheckException("비밀번호 불일치");
		}
	}

	//비밀번호 변경
	@Override
	public Member changePwd(Member m) throws UpdateMemberException {
		int result = 0;
		result = md.updatePwd(sqlSession,m);
		if(result <= 0) {
			throw new UpdateMemberException("수정실패");
		}
		return md.selectMember(sqlSession, m);
	}

	//마이페이지 프로필이미지 불러오기
	@Override
	public Attachment getProfile(int mno) throws ProfileException {
		Attachment att = null;

		att = md.getProfile(sqlSession,mno);

		if(att == null) {
			throw new ProfileException("프로필 불러오기 실패");
		}
		return att;
	}

	//프로필이미지 변경
	@Override
	public void updateProImage(Member m, Attachment att) throws UpdateMemberException {
		int result = 0;
		int oldAttno = md.getPreImageNo(sqlSession,m);
		result = md.preImageDisable(sqlSession,oldAttno);
		if(result > 0) {
			result = md.updateProImage(sqlSession,m,att);
		}else {
			throw new UpdateMemberException("프로필이미지 수정 실패");
		}
		int newAttno = md.getAttno(sqlSession);
		result = md.updateProImageManage(sqlSession, m,newAttno);
		if(result <= 0) {
			throw new UpdateMemberException("프로필이미지 수정 실패");
		}
	}

	//아이디 중복체크
	@Override
	public int duplicateTest(String mid) {
		return md.duplicateTest(sqlSession,mid);
	}

	
	//카카오 로그인 메소드 (정연)
	@Override
	public Member kakaologinMember(String userId) throws LoginException {
		Member loginMember = null;
		String encPassword = md.selectKakaoEncPassword(sqlSession, userId);

		if(!passwordEncoder.matches(userId, encPassword)) {
			throw new LoginException("카카오 로그인 실패");
		}else {
			loginMember = md.selectKakaoMember(sqlSession, userId);
		}
		return loginMember;
	}

	//스트리머 정보 가져오기
	@Override
	public BankAccount getBankAccount(int mno) throws SelectStreamerException {
		BankAccount bankAccount = md.getBankAccount(sqlSession,mno);
		
		if(bankAccount == null) {
			throw new SelectStreamerException("스트리머 정보 불러오기 실패!");
		}
		return bankAccount;
	}

	//회원가입 방송국 개설
	@Override
	public void createBroadCenter(Member m) throws InsertMemberException {
		int result = 0;
		result = md.createBroadCenter(sqlSession,m);
		if(result <= 0) {
			throw new InsertMemberException("방송국 개시 실패");
		}
	}

	//계좌 있는지
	@Override
	public int existBankAccount(int mno) {
		return md.existBankAccount(sqlSession,mno);
	}

}
