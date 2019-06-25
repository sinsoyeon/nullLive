package com.kh.nullLive.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.common.attachment.model.vo.Attachment;
import com.kh.nullLive.member.model.vo.Member;

/**
 * @author user2
 *
 */
/**
 * @author user2
 *
 */
/**
 * @author: user2
 * @Date: 2019. 6. 25.
 * @Comment: 
 */
/**
 * @author: user2
 * @Date: 2019. 6. 25.
 * @Comment: 
 */
/**
 * @author: user2
 * @Date: 2019. 6. 25.
 * @Comment: 
 */
/**
 * @author: user2
 * @Date: 2019. 6. 25.
 * @Comment: 
 */
/**
 * @author: user2
 * @Date: 2019. 6. 25.
 * @Comment: 
 */
/**
 * @author: user2
 * @Date: 2019. 6. 25.
 * @Comment: 
 */
/**
 * @author: user2
 * @Date: 2019. 6. 25.
 * @Comment: 
 */
/**
 * @author: user2
 * @Date: 2019. 6. 25.
 * @Comment: 
 */
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
	 */
	int updateMember(SqlSessionTemplate sqlSession, Member m);

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



}
