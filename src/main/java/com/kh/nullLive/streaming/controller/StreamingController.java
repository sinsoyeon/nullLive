package com.kh.nullLive.streaming.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streaming.model.exception.EnterStreamingException;
import com.kh.nullLive.streaming.model.service.StreamingService;
import com.kh.nullLive.streaming.model.vo.BroadHis;

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

	@RequestMapping("screenSharing.st")
	public String screenSharing() {
		return "streaming/screenSharing/screenSharing";
	}
	
	/**
	 * Author : ryan
	 * Date : 2019. 7. 7.
	 * Comment : 스트리밍 시청
	 */
	@RequestMapping("enterStreaming.st")
	public String enterStreaming(Model model,HttpSession session,@RequestParam(name="streamerAddress")String streamerAddress) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		BroadHis broadHis;
		try {
			broadHis = ss.enterStream(loginUser,streamerAddress);
			model.addAttribute("title", broadHis.getBtitle());
			model.addAttribute("bhno",broadHis.getBhno());
			model.addAttribute("mid",loginUser.getMid());
			model.addAttribute("streamerAddress",streamerAddress);	//방송 주소 찾아가기 위함
			return "streaming/streamRoom";
		} catch (EnterStreamingException e) {
			model.addAttribute("msg",e.getMessage());
			return "streaming/errorPage";
		}
	}

	/**
	 * Author : ryan
	 * Date : 2019. 7. 3.
	 * Comment : 스트리밍 시작
	 */
	@RequestMapping("startStreaming.st")
	public String startStreaming(Model model,HttpSession session,BroadHis broadHis) {
		broadHis.setStreamerId(((Member)session.getAttribute("loginUser")).getMid());
		ss.startStreaming(broadHis);
		model.addAttribute("title", broadHis.getBtitle());
		model.addAttribute("streamerAddress",broadHis.getStreamerId());
		return "streaming/streamRoom";
	}
	
	/**
	 * Author : ryan
	 * Date : 2019. 7. 3.
	 * Comment : 스트리밍 종료
	 */
	@RequestMapping("endStreaming.st")
	public String endStreaming(@RequestParam(name="mid")String mid) {
		ss.endStreaming(mid);
		return null;
	}
	
	/**
	 * Author : ryan
	 * Date : 2019. 7. 7.
	 * Comment : 시청 종료
	 */
	@RequestMapping("exitStreaming.st")
	public String exitStreaming(@RequestParam(name="mid")String mid,@RequestParam(name="bhno")String bhno) {
		ss.exitStreaming(mid,bhno);
		return null;
	}
}
