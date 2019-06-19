package com.kh.nullLive.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberConroller {

	//스트리머 페이지로
	@RequestMapping("streamer.me")
	public String streamerPage() {

		return "streamer/streamerMain";
	}
	
	//방송기능 설정 페이지로
	@RequestMapping("broadSetting.me")
		public String broadSetting() {
		
		return "streamer/broadSetting";
	}
	
	

}
