package com.kh.nullLive.member.model.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.MessagingException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
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
import com.kh.nullLive.member.model.vo.MailUtils;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.member.model.vo.Subscription;
import com.kh.nullLive.member.model.vo.TempKey;
import com.kh.nullLive.streamer.model.exception.SelectStreamerException;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDao md;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private JavaMailSender mailSender;

	//로그인
	@Override
	public Member loginMember(Member m) throws LoginException {
		Member loginMember = null;
		String encPassword = md.selectEncPassword(sqlSession,m);

		if(!passwordEncoder.matches(m.getMpwd(), encPassword)) {
			throw new LoginException("아이디 또는 비밀번호를 확인하세요");
		}else {
			loginMember = md.selectMember(sqlSession,m);
			if(loginMember.getEmailC().equals("N")) {
				throw new LoginException("이메일 인증이 되지 않았습니다");
			}
			if(loginMember.getMstatus().equals("N")) {
				throw new LoginException("정지 또는 정지된 회원입니다.");
			}
			if(loginMember.getMstatus().equals("B")){
				HashMap<String, Object> hmap = md.getBanDate(sqlSession,loginMember);
				System.out.println("hmap : "+hmap);
				throw new LoginException("해당 계정은 까지 정지 상태입니다.");
			}
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
			result += md.disableBankAccount(sqlSession,bankAccount);
			result += md.insertNewBankAccount(sqlSession,bankAccount);
			
			if(result <= 2 ) {
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

	//이메일 인증 완료
	@Override
	public void joinConfirm(String mid) throws InsertMemberException {
		int result = 0;
		result = md.joinConfirm(sqlSession,mid);
		if(result <= 0) {
			throw new InsertMemberException("이메일 인증 실패");
		}
	}

	//회원 탈퇴
	@Override
	public void secession(Member m) throws UpdateMemberException {
		int result = 0;
		result = md.secession(sqlSession,m);
		if(result <= 0) {
			throw new UpdateMemberException("탈퇴 실패!");
		}
	}

	//이메일 발송
	@Override
	public void emailConfirm(Member m) throws MessagingException, UnsupportedEncodingException {
		//mail 전송
		String authkey = new TempKey().getKey(50,false);
		
		MailUtils sendMail = new MailUtils(mailSender);
		
		sendMail.setSubject("[NULLLIVE] / 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[NULL LIVE에 어서오세요!]</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://localhost:9001/nullLive/joinConfirm.me?mid=")
				.append(m.getMid())
				.append("&email=")
				.append(m.getEmail())
				.append("&authkey=")
				.append(authkey)
				.append("' target='_blenk'>이메일 인증 확인</a>")
				.toString());
		sendMail.setFrom("rekin7244@gmail.com ", "NullLive");
		sendMail.setTo(m.getEmail());
		sendMail.send();
	}

	//아이디 찾기
	@Override
	public String getSearchId(Member m) throws CheckException {
		String mid = md.getSearchId(sqlSession,m);
		if(mid == null) {
			throw new CheckException("찾으시는 아이디가 없습니다.");
		}
		return mid;
	}

	//비밀번호 재밝브
	@Override
	public void pwdReload(Member m,String newPwd) throws UpdateMemberException, MessagingException, UnsupportedEncodingException {
		int result = md.pwdReload(sqlSession,m);
		if(result<=0) {
			throw new UpdateMemberException("재발급 실패!");
		}
		MailUtils sendMail = new MailUtils(mailSender);
		
		sendMail.setSubject("[NULLLIVE] / 비밀번호 재발급");
		sendMail.setText(new StringBuffer().append("<h1>[NULL LIVE에 돌아오셨군요!]</h1>")
				.append("<p>새로 발급 받으신 비밀번호는 "+newPwd+"입니다.</p>")
				.append("<p>반드시 로그인 하신 후 비밀번호를 수정해주세요</p>")
				.toString());
		sendMail.setFrom("rekin7244@gmail.com ", "NullLive");
		sendMail.setTo(m.getEmail());
		sendMail.send();
	}

	//마이페이지 구독 리스트
	@Override
	public ArrayList<Subscription> getSubList(Member loginUser) {
		return md.getSubList(sqlSession,loginUser);
	}

	//휴대폰 변경
	@Override
	public Member phoneChange(Member m) throws UpdateMemberException {
		int result = md.phoneChange(sqlSession,m);
		if(result <= 0) {
			throw new UpdateMemberException("휴대폰 변경 실패");
		}
		return md.selectMember(sqlSession, m);
	}

	//성인 인증
	@Override
	public Member confirmAdult(Member m) throws UpdateMemberException {
		int result = md.confirmAdult(sqlSession,m);
		if(result <= 0) {
			throw new UpdateMemberException("성인 인증 실패");
		}
		return md.selectMember(sqlSession, m);
	}

	//파트너 조회
	@Override
	public ArrayList<HashMap<String, Object>> partner(Member loginUser) {
		ArrayList<HashMap<String, Object>> partner = md.partner(sqlSession, loginUser);
		return partner;
	}

	@Override
	public int selectAlarmCount(int mno) {
		// TODO Auto-generated method stub
		return md.selectAlarmCount(sqlSession,mno);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectMyAlmList(HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return md.selectMyAlmList(sqlSession,infoMap);
	}

	@Override
	public int updateAlarm(HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return md.updateAlarm(sqlSession,infoMap);
	}

	@Override
	public int selectCount(int mno) {
		// TODO Auto-generated method stub
		return md.selectCount(sqlSession,mno);
	}

}
