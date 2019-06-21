package com.kh.nullLive.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.nullLive.board.model.service.BoardService;

@SessionAttributes("loginUser")
@Controller
public class BoardController {
	/* 소통센터 : job / 고객센터 : service */
	
	/**
	 * @Author : eon
	 * @Date : 2019. 6. 20.
	 * @Comment : 고객센터 화면 호출
	 */
	@RequestMapping("serviceMain.bo")
	public String servicePage() {		
		return "board/service/serviceCenterMain";
	}
	
	@Autowired
	private BoardService bs;
	
	
}