package com.kh.nullLive.streaming.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streamer.model.vo.Streamer;
import com.kh.nullLive.streaming.model.service.StreamingService;

@Controller
public class StreamingController {
	
	@Autowired
	private StreamingService ss;
	
	/**
	 * Author : ryan
	 * Date : 2019. 6. 20. // 7. 2.
	 * Comment : 마이페이지에서 방송시작 버튼 클릭 시 // 최초 방송 시 방송 약관 페이지 이동
	 */
	//스트리머 방송 페이지로 이동
	@RequestMapping("start.st")
	public String startStreaming(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String isStreamer = loginUser.getIsStreamer();
		if(isStreamer.equals("Y")) {
			return "redirect:broadSetting.st";
		}else {
			return "member/myPage/firstStreaming";
		}
	}
	

	@RequestMapping("record.st")
	public String recordStraming() {
		return "streaming/recording/record";
	}

	@RequestMapping("connect.st")
	public String connectStreaming() {
		return "streaming/peerConnection/connection";
	}

	@RequestMapping("screenSharing.st")
	public String screenSharing() {
		return "streaming/screenSharing/screenSharing";
	}
	
	@RequestMapping("enterStreaming.st")
	public String enterStreaming(Model model,@RequestParam(name="bhno")int bhno) {
		model.addAttribute("bhno",bhno);
		return "streaming/testViewStream";
	}

	/**
	 * Author : ryan
	 * Date : 2019. 7. 3.
	 * Comment : 스트리밍 시작
	 */
	@RequestMapping("startStreaming.st")
	public String startStreaming(Model model,HttpSession session) {
		int mno = ((Member)session.getAttribute("loginUser")).getMno();
		ss.startStreaming(mno);
		int bhno = ss.getBhno(mno);
		System.out.println("bhno : "+bhno);
		model.addAttribute("bhno",bhno);
		return "streaming/streaming";
	}
	
	/**
	 * Author : ryan
	 * Date : 2019. 7. 3.
	 * Comment : 스트리밍 종료
	 */
	@RequestMapping("endStreaming.st")
	public String endStreaming(@RequestParam(name="mno")String mno) {
		ss.endStreaming(Integer.parseInt(mno));
		
		return "streaming/endStreaming";
	}
	
}
