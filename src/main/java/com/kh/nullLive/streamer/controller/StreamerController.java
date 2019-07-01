package com.kh.nullLive.streamer.controller;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	@ResponseBody
	public ModelAndView subscribeList(@RequestParam("mno")int mno,ModelAndView model) {
		ArrayList<HashMap<String, Object>> listMap = smService.selectSubList(mno);
		
		
		System.out.println("회원번호 " + mno + " 의 구독자 조회 : " + listMap);
		
		for (int i = 0; i < listMap.size(); i++) {
			if(listMap.get(i).get("SU_PERIOD_DATE")!=null)
			listMap.get(i).put("SU_PERIOD_DATE", listMap.get(i).get("SU_PERIOD_DATE").toString());	
		}
		
		
		model.setViewName("jsonView");
		model.addObject("listMap",listMap);
		
		return model;
	}
	
	@RequestMapping("subscribeForMe.sm")
	@ResponseBody
	public ModelAndView subscribeForMe(@RequestParam("mno")int mno,ModelAndView model) {
		
		ArrayList<HashMap<String,Object>> forMeList = smService.selectForMeSubList(mno);
		
		
		System.out.println("회원번호 " + mno + " 의 구독자 조회 : " + forMeList);
		
		model.setViewName("jsonView");
		model.addObject("forMeList",forMeList);
		
		return model;
	}	
	
	
	
	@RequestMapping(value="selectSponList.sm")
	@ResponseBody
	public ModelAndView selectSponList(@RequestParam("mno") int mno,ModelAndView modelAndView)								{
		List<HashMap<String, Object>> sponList = new ArrayList<HashMap<String, Object>>();
		sponList = smService.selectSponList(mno);
		System.out.println("스폰 리스트 : " + sponList);
		
		for (int i = 0; i < sponList.size(); i++) {
			sponList.get(i).put("SPON_DATE", sponList.get(i).get("SPON_DATE").toString());	
		}
		
		modelAndView.setViewName("jsonView");
		modelAndView.addObject("sponList",sponList);		

		return modelAndView;
	}
	
}
