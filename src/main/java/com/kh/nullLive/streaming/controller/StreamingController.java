package com.kh.nullLive.streaming.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StreamingController {
	
	@RequestMapping("start.st")
	public String startStreaming() {
		return "streaming/streaming";
	}
}
