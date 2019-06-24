package com.kh.nullLive.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nullLive.common.CommonUtils;
import com.kh.nullLive.common.attachment.model.vo.AttManage;
import com.kh.nullLive.common.attachment.model.vo.Attachment;
import com.kh.nullLive.member.model.exception.CheckException;
import com.kh.nullLive.member.model.exception.InsertMemberException;
import com.kh.nullLive.member.model.exception.LoginException;
import com.kh.nullLive.member.model.exception.ProfileException;
import com.kh.nullLive.member.model.exception.UpdateMemberException;
import com.kh.nullLive.member.model.service.MemberService;
import com.kh.nullLive.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 19.
	 * @Comment : 로그인 화면 호출
	 */
	@RequestMapping("loginPage.me")
	public String loginPage() {
		return "member/memberLoginForm";
	}
	
	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 18.
	 * @Comment : 로그인
	 */
	@RequestMapping("login.me")
	public String loginCheck(Member m,Model model) {
		Member loginUser;
		try {
			loginUser = ms.loginMember(m);
			model.addAttribute("loginUser",loginUser);
			return "redirect:index.jsp";
		} catch (LoginException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 18.
	 * @Comment : 로그아웃
	 */
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:index.jsp";
	}
	
	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 18.
	 * @Comment : 회원가입 이동 
	 */
	@RequestMapping("join.me")
	public String joinMember() {
		return "member/memberJoinForm";
	}
	
	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 18.
	 * @Comment : 회원가입
	 */
	@RequestMapping("insert.me")
	public String insertMember(Model model,Member m,@RequestParam("phone1")String p1,
			@RequestParam("phone2")String p2,@RequestParam("phone3")String p3,
			HttpServletResponse response) {
		m.setPhone(p1+p2+p3);
		m.setMpwd(passwordEncoder.encode(m.getMpwd()));
		try {
			ms.insertMember(m);
			m.setMno(ms.getMno());
			ms.insertProImage(m);
			return "redirect:index.jsp";
		} catch (InsertMemberException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 19.
	 * @Comment : 마이페이지 이동
	 */
	@RequestMapping("myPage.me")
	public String myPage(Model model,HttpServletRequest request) {
		try {
			Attachment att = ms.getProfile(((Member)(request.getSession().getAttribute("loginUser"))).getMno());
			model.addAttribute("imgSource", att.getChangeName());
			return "member/myPage/myPageMain";
		} catch (ProfileException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 19.
	 * @Comment : 잘못된 접근시 로그인으로 이동
	 */
	@RequestMapping("needLogin.me")
	public String needLogin() {
		return "member/needLogin";
	}
	
	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 개인정보수정 페이지 이동
	 */
	@RequestMapping("updatePage.me")
	public String updatePage() {
		return "member/myPage/myPageModify";
	}
	
	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 개인정보수정
	 */
	@RequestMapping("update.me")
	public String updateMember(Model model, SessionStatus status, Member m) {
		try {
			Member loginUser = ms.updateMember(m);
			model.addAttribute("loginUser", loginUser);
			return "member/myPage/myPageModifySuccess";
		} catch (UpdateMemberException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 비밀번호 변경 입력창 이동
	 */
	@RequestMapping("pwdInput.me")
	public String pwdInput() {
		return "member/myPage/pwdInput";
	}
	
	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 비밀번호 확인
	 */
	@RequestMapping("pwdCheck.me")
	public String pwdCheck(Member m,Model model) {
		try {
			ms.checkPwd(m);
			return "member/myPage/pwdChange";
		} catch (CheckException e) {
			model.addAttribute("msg", e.getMessage());
			return "member/myPage/pwdError";
		}
	}
	
	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 비밀번호 변경
	 */
	@RequestMapping("pwdChange.me")
	public String pwdChange(Member m,Model model) {
		m.setMpwd(passwordEncoder.encode(m.getMpwd()));
		try {
		    Member loginUser = ms.changePwd(m);
			model.addAttribute("loginUser", loginUser);
			return "member/myPage/pwdChEnd";
		} catch (UpdateMemberException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 프로필이미지 수정 창
	 */
	@RequestMapping("modifyProImagePage.me")
	public String modifyProImagePage() {
		return "member/myPage/profileImageUpdate";
	}
	
	/**
	 * Author : ryan
	 * Date : 2019. 6. 21.
	 * Comment : 프로필이미지 변경
	 */
	@RequestMapping("modifyProImage.me")
	public String modifyProImage(Model model, Member m, HttpServletRequest request,
			@RequestParam(name="proImgFile",required=false)MultipartFile file) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String filePath = root+"\\uploadFiles\\profile_image";
		System.out.println("filePath : "+filePath);
		
		String originName = file.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = CommonUtils.getRandomString();
		Attachment att = new Attachment();
		att.setOriginName(originName+ext);
		att.setChangeName(changeName+ext);
		att.setFilePath(filePath);
			try {
				file.transferTo(new File(filePath+"\\"+changeName+ext));
				ms.updateProImage(m,att);
			} catch (IllegalStateException | IOException | UpdateMemberException e) {
				new File(filePath+"\\"+changeName+ext).delete();
				model.addAttribute("msg", e.getMessage());
			}
		
		return "member/myPage/modifyProImageEnd";
	}
	
	/**
	 * Author : ryan
	 * Date : 2019. 6. 24.
	 * Comment : 아이디 중복체크 ajax
	 */
	@RequestMapping(value="duplicateTest.me")
	@ResponseBody
	public String duplicateTest(@RequestParam(name="currentVal")String currentVal) {
		String mid = currentVal;
		if(mid.length() > 5) {
			int result = ms.duplicateTest(mid);
			if(result > 0) {
				return "duplicate";
			}
			return "success";
		}
		return "lengthError";
	}
}
