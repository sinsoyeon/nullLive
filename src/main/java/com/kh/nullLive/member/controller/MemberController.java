package com.kh.nullLive.member.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.nullLive.member.model.exception.LoginException;
import com.kh.nullLive.member.model.service.MemberService;
import com.kh.nullLive.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	//로그인 - 회륜
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
	
	//로그아웃 - 회륜
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:index.jsp";
	}
	
	//회원가입 이동 - 회륜
	@RequestMapping("join.me")
	public String joinMember() {
		return "member/memberJoinForm";
	}
	
	//회원가입 - 회륜
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
	
}
