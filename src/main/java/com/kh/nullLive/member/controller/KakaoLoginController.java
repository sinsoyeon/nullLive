package com.kh.nullLive.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.nullLive.member.model.exception.LoginException;
import com.kh.nullLive.member.model.service.KakaoAPI;
import com.kh.nullLive.member.model.service.MemberService;
import com.kh.nullLive.member.model.vo.Member;


@SessionAttributes("loginUser")
@Controller
public class KakaoLoginController {
	@Autowired
	private KakaoAPI kakao;
	@Autowired
	private MemberService ms;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@RequestMapping("/")
	public String index() {
		return "redirect:index.jsp";
	}
	
	@RequestMapping("klogin.me")
    public String klogin(@RequestParam("code") String code, Model model) {
		String accessToken = kakao.getAccessToken(code);
		
		HashMap<String, Object> userInfo = kakao.getUserInfo(accessToken);
		System.out.println("login Controller: " + userInfo);
		
		
		//가입한 회원인지 아닌지 확인하는 용
		int firstLoginCheck = kakao.firstLoginCheck(userInfo); 
		
		if(firstLoginCheck <= 0) {
			model.addAttribute("userInfo", userInfo);
			
			return "member/myPage/kakaoMemberJoinForm";
		}
		
		//카카오톡 로그인
		Member loginUser;
		String userId = userInfo.get("userId").toString(); 
		
		try {
			loginUser = ms.kakaologinMember(userId);
			model.addAttribute("loginUser", loginUser);
			System.out.println("컨트롤러 loginUser: " + loginUser);
			
			return "redirect:index.jsp";
		} catch (LoginException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
		
    }
	

	
}
