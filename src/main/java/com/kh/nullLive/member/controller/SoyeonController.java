package com.kh.nullLive.member.controller;

import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.nullLive.member.model.service.MemberService;

@Controller
public class SoyeonController {
	@Autowired
	private MemberService ms;
	
	
	/**
	 * @author : 소연
	 * @date : 2019.  6. 19.
	 * @comment :  web-inf 안 jsp 파일 테스트하기 위한 폼
	 */
	@RequestMapping("testForm.me")
	public String tempFormController() {
		return "common/testForm";
	}
	
	/**
	 * @author : 소연
	 * @date : 2019. 6. 19.
	 * @comment : 소연 전용 테스트 폼으로 넘어가기
	 */
	@RequestMapping("soyeon.me")
	public String soyeonController() {
		return "member/subscribePage/soyeonTestForm";
	}
	
	/**
	 * @author : 소연
	 * @date : 2019. 6. 19.
	 * @comment : paymentForm 테스트용 servlet
	 */	
	@RequestMapping("pay.me")
	public String payController() {
		return "member/paymentForm";
	}	

	/**
	 * @author : 소연
	 * @date : 2019. 6. 20.
	 * @comment : null point 결제 후 update
	 */		
	@RequestMapping("updateNP")
	public void updateNullPoint() {
		
	}
	
	/**
	 * @author : 소연
	 * @date : 2019. 6. 21.
	 * @comment : 구독 선택창 이동
	 */		
	@RequestMapping("subscribeView.me")
	public String subView() {
		return "member/subscribePage/selectSubscribeForm";
	}
	
	/**
	 * @author : 소연
	 * @date : 2019. 6. 24.
	 * @comment : 구독 상세 페이지로 이동
	 */		
	@RequestMapping("subForm.me")
	public String subForm(@RequestParam("amount")int amount,Model model) {
		model.addAttribute("amount",amount);
		System.out.println(amount);
		return "member/userInfo";
	}
	
}
