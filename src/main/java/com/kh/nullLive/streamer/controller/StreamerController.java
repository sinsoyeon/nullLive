package com.kh.nullLive.streamer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.nullLive.streamer.model.service.StreamerService;

@Controller

public class StreamerController {
	
	@Autowired
	private StreamerService smService;
	
	@RequestMapping("selectStreamer.sm")
	@ResponseBody
	public String selectStreamer(String streamer) {
		System.out.println(streamer);
		int sno = smService.selectStreamer(streamer);
		System.out.println("sno : " + sno);
		
		return sno + "";
	}	
	
	@RequestMapping("subscribe.sm")
	public String insertSubscribe(int mno,String streamer,int amount) {
		int result = smService.insertSubscribe(mno,streamer,amount);
		//System.out.println("mno : " + mno + " / streamer :" + streamer + " / amount :  " + amount);
		
		return "redirect:index.jsp";
	}
}
