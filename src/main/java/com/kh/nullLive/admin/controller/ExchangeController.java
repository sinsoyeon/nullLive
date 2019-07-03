package com.kh.nullLive.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nullLive.admin.model.service.AdminService;


// 소연 -> conflict 방지용으로 잠시 빼놓은 컨트롤러
@Controller
public class ExchangeController {
	@Autowired
	private AdminService adService;
	
	@RequestMapping("exchange.ad")
	@ResponseBody
	public String exchangeProcess(int excno) {
		int result = adService.exchange(excno);
		
		if(result >0 ) {
			return "success";
		}else {
			//throw 처리
		}
		
		return "back";
	}
	
	//다중 환전 
	@RequestMapping("allExchange.ad")
	@ResponseBody
	public String allExchange(@RequestParam(name="checkList[]")List<String> checkParam) {
		int result = adService.allExchange(checkParam);
		
		System.out.println("controller : " + result);
		
		if(result>0) {
			return "success";			
		}else {
			return "fail";
		}
		
	}
	
}
