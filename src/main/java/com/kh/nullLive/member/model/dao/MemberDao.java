package com.kh.nullLive.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.common.attachment.model.vo.Attachment;
import com.kh.nullLive.member.model.vo.BankAccount;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.member.model.vo.Subscription;
import com.kh.nullLive.streamer.model.vo.Streamer;

public interface MemberDao {
	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 18.
	 * @Comment : 비밀번호 확인
	 */
	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);

	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 18.
	 * @Comment : 로그인 정보 불러오기
	 */
	Member selectMember(SqlSessionTemplate sqlSession, Member m);

	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 18.
	 * @Comment : 회원가입
	 */
	int insertMember(SqlSessionTemplate sqlSession, Member m);
	
	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 회원가입한 번호 가져오기
	 */
	int getMno(SqlSessionTemplate sqlSession);
	
	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 개인정보수정
	 * @param streamer 
	 */
	int updateMember(SqlSessionTemplate sqlSession, Member m);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 3.
	 * Comment : 계좌 정보 수정
	 */
	int updateBankAccount(SqlSessionTemplate sqlSession, BankAccount bankAccount);
	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 비밀번호 변경
	 */
	int updatePwd(SqlSessionTemplate sqlSession, Member m);
	
	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 회원가입 시 프로필 이미지 등록
	 */
	int insertProImage(SqlSessionTemplate sqlSession, Attachment att);

	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 등록 프로필 attno가져오기
	 */
	int getAttno(SqlSessionTemplate sqlSession);
	
	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 회원가입 시 프로필 이미지 관리 등록
	 * @param attno 
	 */
	int insertProImageManage(SqlSessionTemplate sqlSession, Member m, int attno);
	
	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 마이페이지 프로필이미지 불러오기
	 */
	Attachment getProfile(SqlSessionTemplate sqlSession, int mno);

	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 이전 프로필사진 번호 가져오기
	 */
	int getPreImageNo(SqlSessionTemplate sqlSession, Member m);
	
	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 이전 프로필사진 비활성화
	 */
	int preImageDisable(SqlSessionTemplate sqlSession, int attno);
	
	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 프로필이미지 변경
	 */
	int updateProImage(SqlSessionTemplate sqlSession, Member m, Attachment att);

	/**
	 * Author : ryan
	 * Date : 2019. 6. 22.
	 * Comment : 이전 프로필사진 관리 수정
	 */
	int updateProImageManage(SqlSessionTemplate sqlSession, Member m, int newAttno);

	/**
	 * Author : ryan
	 * Date : 2019. 6. 24.
	 * Comment : 아이디 중복체크
	 */
	int duplicateTest(SqlSessionTemplate sqlSession, String mid);

	
	/* 카카오톡 첫로그인인지 확인용 메소드(정연) */
	int firstLoginCheck(SqlSessionTemplate sqlSession, HashMap<String, Object> userInfo);

	//카카오톡 비밀번호 받아오는 메소드(정연)
	String selectKakaoEncPassword(SqlSessionTemplate sqlSession, String userId);

	//카카오톡 로그인 정보 불러오기 메소드 (정연)
	Member selectKakaoMember(SqlSessionTemplate sqlSession, String userId);


	/*
	 * @author : uukk
	 * @date : 2019. 7. 3.
	 * @comment : 회원 mno로 조회
	 */
	Member selectMemberMno(SqlSessionTemplate sqlSession,int mno);
  

	/*
	 * Author : ryan
	 * Date : 2019. 7. 2.
	 * Comment : 계좌 정보 가져오기
	 */
	BankAccount getBankAccount(SqlSessionTemplate sqlSession, int mno);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 3.
	 * Comment : 회원가입 시 방송국 개설
	 */
	int createBroadCenter(SqlSessionTemplate sqlSession, Member m);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 7.
	 * Comment : 계좌 정보 있는지
	 */
	int existBankAccount(SqlSessionTemplate sqlSession, int mno);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 11.
	 * Comment : 이메일 인증 완료
	 */
	int joinConfirm(SqlSessionTemplate sqlSession, String mid);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 11.
	 * Comment : 회원 탈퇴
	 */
	int secession(SqlSessionTemplate sqlSession, Member m);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 11.
	 * Comment : 정지 기간 가져오기
	 * @param sqlSession 
	 * @return 
	 */
	HashMap<String, Object> getBanDate(SqlSessionTemplate sqlSession, Member loginMember);

	/**
	 * @Author : ryan
	 * @Date : 2019. 7. 12.
	 * @Comment : 아이디 찾기
	 */
	String getSearchId(SqlSessionTemplate sqlSession, Member m);

	/**
	 * @Author : ryan
	 * @Date : 2019. 7. 12.
	 * @Comment : 비밀번호 재발급
	 */
	int pwdReload(SqlSessionTemplate sqlSession, Member m);

	/**
	 * @Author : ryan
	 * @Date : 2019. 7. 12.
	 * @Comment : 마이페이지 구독 리스트
	 */
	ArrayList<Subscription> getSubList(SqlSessionTemplate sqlSession, Member loginUser);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 13.
	 * Comment : 휴대폰 변경
	 */
	int phoneChange(SqlSessionTemplate sqlSession, Member m);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 13.
	 * Comment : 성인 인증
	 */
	int confirmAdult(SqlSessionTemplate sqlSession, Member m);



}
