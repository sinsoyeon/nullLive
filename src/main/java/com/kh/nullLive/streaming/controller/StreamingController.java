package com.kh.nullLive.streaming.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StreamingController {
	
	/**
	 * Author : ryan
	 * Date : 2019. 6. 20.
	 * Comment : 스트리밍 시작 // 아래는 임시
	 */
	//스트리머 방송국 페이지로 이동

	@RequestMapping("start.st")
	public String startStreaming() {
		return "streaming/streaming";
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
		@RequestMapping("broadSetting.st")
			public String broadSetting() {
			
			return "streaming/broadSetting";
		}
}
