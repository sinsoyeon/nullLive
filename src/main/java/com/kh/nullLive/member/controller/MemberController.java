package com.kh.nullLive.member.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.nullLive.member.model.exception.LoginException;
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
		System.out.println("m : "+m);
		ms.insertMember(m);
		return "redirect:index.jsp";
	}
	
	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 19.
	 * @Comment : 마이페이지 이동
	 */
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage/myPageMain";
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
}
