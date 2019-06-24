package com.kh.nullLive.member.model.service;

import com.kh.nullLive.common.attachment.model.vo.Attachment;
import com.kh.nullLive.member.model.exception.CheckException;
import com.kh.nullLive.member.model.exception.InsertMemberException;
import com.kh.nullLive.member.model.exception.LoginException;
import com.kh.nullLive.member.model.exception.ProfileException;
import com.kh.nullLive.member.model.exception.UpdateMemberException;
import com.kh.nullLive.member.model.vo.Member;

public interface MemberService {
	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 18.
	 * @Comment : 로그인
	 */
	Member loginMember(Member m) throws LoginException;

	/**
	 * @throws InsertMemberException 
	 * @Author : ryan
	 * @Date : 2019. 6. 18.
	 * @Comment : 회원가입
	 */
	void insertMember(Member m) throws InsertMemberException;

	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 회원가입한 번호 가져오기
	 */
	int getMno();
	
	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 프로필 이미지 등록
	 */
	void insertProImage(Member m) throws InsertMemberException;
	
	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 개인정보수정
	 */
	Member updateMember(Member m) throws UpdateMemberException;

	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 비밀번호 확인
	 * @throws CheckException 
	 */
	void checkPwd(Member m) throws CheckException;

	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 비밀번호 변경
	 * @return 
	 * @throws UpdateMemberException 
	 */
	Member changePwd(Member m) throws UpdateMemberException;

	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 마이페이지 프로필이미지 불러오기
	 * @return 
	 * @throws ProfileException 
	 */
	Attachment getProfile(int mno) throws ProfileException;

	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 프로필이미지 변경
	 * @throws UpdateMemberException 
	 */
	void updateProImage(Member m, Attachment att) throws UpdateMemberException;

	/**
	 * Author : ryan
	 * Date : 2019. 6. 24.
	 * Comment : 아이디 중복체크 ajax
	 * @return 
	 */
	int duplicateTest(String mid);

	
}
