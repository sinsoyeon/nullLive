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
	@Autowired
	private BoardService bs;
	
	/**
	 * @Author : eon
	 * @Date : 2019. 6. 20.
	 * @Comment : 고객센터 메인화면 호출
	 */
	@RequestMapping("serviceMain.bo")
	public String servicePage() {		
		return "board/service/serviceCenterMain";
	}
	
	/**
	 * @Author : eon
	 * @Date : 2019. 6. 22.
	 * @Comment : 고객센터 문의화면 호출
	 */
	@RequestMapping("question.bo")
	public String questionPage() {		
		return "board/service/questionForm";
	}
	
	/**
	 * @Author : eon
	 * @Date : 2019. 6. 22.
	 * @Comment : 고객센터 신고화면 호출
	 */
	@RequestMapping("report.bo")
	public String reportPage() {		
		return "board/service/reportForm";
	}
	
	/**
	 * @Author : eon
	 * @Date : 2019. 6. 22.
	 * @Comment : 고객센터 나의문의내역 호출
	 */
	@RequestMapping("myQuestion.bo")
	public String myQuestionPage() {		
		return "board/service/myQuestionForm";
	}
	
	
	
}