package com.kh.nullLive.streamer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.nullLive.streamer.model.service.StreamerService;
import com.kh.nullLive.streamer.model.vo.Streamer;

import aj.org.objectweb.asm.Type;

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
	public String insertSubscribe(Streamer stremaer) {
		int result = smService.insertSubscribe(stremaer);
		//System.out.println("mno : " + mno + " / streamer :" + streamer + " / amount :  " + amount);
		
		if(result > 0) {
			return "성공적으로 구독하였습니다.";			
		}else {
			return "구독에 실패했습니다.";
		}
	}
	
	@RequestMapping("monthlySubscribe.sm")
	public String insertMonthlySubscribe(Streamer streamer,@RequestParam("amount")int amount) {
		
		System.out.println("amount : " + amount);
		int result = smService.insertMnthlSbscr(streamer,amount);
	
		return "redirect:index.jsp";
	}
	
	@RequestMapping("insertNP.sm")
	public String insertNP(Streamer streamer,@RequestParam("amount")int amount) {
		System.out.println(streamer);
		System.out.println(amount);
		
		
		int result = smService.insertNP(streamer,amount);
		
		return "redirect:index.jsp";
	}
	
	@RequestMapping("subscribeListView.sm")
	public String subscribeList() {
		return "member/subscribePage/subscribeListForm";
	}
}
