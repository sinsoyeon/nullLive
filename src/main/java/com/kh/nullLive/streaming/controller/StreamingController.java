package com.kh.nullLive.streaming.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streamer.model.vo.Streamer;
import com.kh.nullLive.streaming.model.exception.StreamerInsertException;
import com.kh.nullLive.streaming.model.exception.StreamerUpdateException;
import com.kh.nullLive.streaming.model.service.StreamingService;

@SessionAttributes("loginUser")
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
			return "streaming/streaming";		
		}else {
			return "member/myPage/firstStreaming";
		}
	}
	
	/**
	 * Author : ryan
	 * Date : 2019. 7. 2.
	 * Comment : 최초 방송 약관 동의 처리
	 */
	@RequestMapping("fStream.st")
	public String firstStreaming(Model model,HttpSession session, Streamer streamer) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println("streamer : "+streamer);
		try {
			ss.streamerChange(loginUser,streamer);
			model.addAttribute("loginUser",ss.resetMember(loginUser.getMno()));
			return "streaming/broadCenter/broadSetting";
		} catch (StreamerUpdateException e) {
			model.addAttribute("msg",e.getMessage());
			return "common/errorPage";
		} catch (StreamerInsertException e) {
			model.addAttribute("msg",e.getMessage());
			return "common/errorPage";
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
	
	@RequestMapping("Test.st")
	public String testStreaming() {
		return "streaming/streaming";
	}

}
