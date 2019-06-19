package com.kh.nullLive.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.nullLive.member.model.dao.MemberDao;
import com.kh.nullLive.member.model.exception.LoginException;
import com.kh.nullLive.member.model.vo.Member;

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
			throw new LoginException("로그인 실패");
		}else {
			loginMember = md.selectMember(sqlSession,m);
		}
		return loginMember;
	}
	
	//회원가입
	@Override
	public int insertMember(Member m) {
		return md.insertMember(sqlSession,m);
	}

}
