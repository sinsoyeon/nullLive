package com.kh.nullLive.streaming.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StreamingController {
	
	//스트리머 방송국 페이지로 이동
	@RequestMapping("start.st")
	public String startStreaming() {
		return "streaming/streaming";
	}
	
	//방송기능 설정 페이지로
		@RequestMapping("broadSetting.st")
			public String broadSetting() {
			
			return "streaming/broadSetting";
		}
}
