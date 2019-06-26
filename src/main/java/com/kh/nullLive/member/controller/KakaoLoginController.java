package com.kh.nullLive.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.nullLive.member.model.service.KakaoAPI;

@Controller
public class KakaoLoginController {
	@Autowired
	private KakaoAPI kakao;
	
	
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
			//String userId = userInfo.get("userId").toString();
			
			model.addAttribute("userInfo", userInfo);
			
			return "member/memberJoinForm";
		}

		
		if(userInfo.get("email") != null) {
			//session.setAttribute("loginUser", userInfo.get("id"));
			//session.setAttribute("userEmail", userInfo.get("email"));
			model.addAttribute("accessToken", accessToken);
		}
		
		//System.out.println("controller accesstoken:" + accessToken);
		
		return "redirect:index.jsp";
    }
	

	
}
