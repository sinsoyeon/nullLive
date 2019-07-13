package com.kh.nullLive.partner.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.partner.model.service.PartnerService;

@Controller
public class PartnerController {

	@Autowired
	private PartnerService ps;
	
	/**
	 * @author : uukk
	 * @date : 2019. 7. 13.
	 * @comment : 매니저 권한 조회
	 */
	@RequestMapping("mngAuthDetail.pt")
	public ResponseEntity<HashMap<String,ArrayList<String>>> selectMngAuthDetail(HttpServletRequest request){
		System.out.println("controller");
		//로그인 유저 정보 (스트리머)
		Member loginUser =(Member)request.getSession().getAttribute("loginUser");
		//매니저 mno
		int mngMno = Integer.parseInt(request.getParameter("mngMno"));
		
		//select를 위한 hmap
		HashMap<String,Object> hmap = new HashMap<>();
		
		hmap.put("loginUser", loginUser);
		hmap.put("mngMno", mngMno);
		
		HashMap<String, ArrayList<String>> authHmap = ps.selectMngAuth(hmap);
		
		System.out.println(authHmap);
		
		return new ResponseEntity<HashMap<String,ArrayList<String>>>(authHmap,HttpStatus.OK);
	}
	
	@RequestMapping("updateMngAuth.pt")
	public String updateMngAuth(HttpServletRequest request) {
		String boardAuthList = request.getParameter("boardAuthList");
		String chatAuthList = request.getParameter("chatAuthList");
		
		System.out.println(boardAuthList);
		System.out.println(chatAuthList);
		return null;
	}
	
	
}
