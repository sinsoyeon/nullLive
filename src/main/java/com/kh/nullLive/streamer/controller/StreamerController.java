package com.kh.nullLive.streamer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
			
			System.out.println(listMap.get(i).get("SU_PERIOD_DATE"));
			
			
			if(listMap.get(i).get("SU_PERIOD_DATE").toString().equals("2999/12/31")) {
				listMap.get(i).replace("SU_PERIOD_DATE", "X");			
			}
		}
		
		
		model.setViewName("jsonView");
		model.addObject("listMap",listMap);
		
		System.out.println("최종 return : "  + listMap);
		
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
	
	@RequestMapping("sponForMeList.sm")
	public ModelAndView selectSponForMe(@RequestParam("mno")int mno,ModelAndView modelAndView) {
		ArrayList<HashMap<String,Object>> sponForMeList = smService.selectSponForMeList(mno);

		for (int i = 0; i < sponForMeList.size(); i++) {
			sponForMeList.get(i).put("SPON_DATE", sponForMeList.get(i).get("SPON_DATE").toString());	
		}
		
		modelAndView.setViewName("jsonView");
		modelAndView.addObject("sponForMeList", sponForMeList);
		
		return modelAndView;
	}
	
	@RequestMapping("searchSpon.sm")
	public ModelAndView searchSponList(int mno,int searchCondition,String searchValue,ModelAndView modelAndView) {
		HashMap<String,Object> searchTypeMap = new HashMap<String, Object>();
		searchTypeMap.put("mno", mno);
		searchTypeMap.put("searchCondition", searchCondition);
		searchTypeMap.put("searchValue", searchValue);
				
		ArrayList<HashMap<String,Object>> searchSponList = smService.searchSponList(searchTypeMap);
		
		modelAndView.setViewName("jsonView");
		modelAndView.addObject("searchSponList",searchSponList);
		
		
		return modelAndView;
	}
	
	@RequestMapping("requestExc.sm")
	@ResponseBody
	public String requestExchange(@RequestParam("mno")int mno,@RequestParam("amount")int amount) {
		
		HashMap<String,Object> excMap = new HashMap<String,Object>();
		
		
		excMap.put("mno", mno);
		excMap.put("amount", amount);
		excMap.put("exc_fee", (amount*0.2));
		
		int result = smService.insertExchange(excMap); 
		
		if(result > 0) {
			return "success";
		}else {
			return "환전 신청에 실패했습니다.";
		}
	}
	
	@RequestMapping("excView.sm")
	public String excViewControll(Model model) {
		
		return "member/recordPage/excListForm";
	}
	
	@RequestMapping("selectExcList.sm")
	public ModelAndView selectExcList(int mno,ModelAndView modelAndView) {
		
		ArrayList<HashMap<String,Object>> excList = smService.selectExcList(mno);
		
		for (int i = 0; i < excList.size(); i++) {
			excList.get(i).put("APPLICATION_DATE",excList.get(i).get("APPLICATION_DATE").toString());
		}
		
		modelAndView.setViewName("jsonView");
		modelAndView.addObject("excList",excList);
		
		return modelAndView;
	}
	
	@RequestMapping("selectOneExc.sm")
	public ModelAndView selectOneExc(int mno,int excno,ModelAndView modelAndView) {
		
		
		HashMap<String,Object> userInfoMap = new HashMap<String, Object>();
		userInfoMap.put("mno", mno);
		userInfoMap.put("excno", excno);
		
		HashMap<String, Object> excMap = smService.selectOneExc(userInfoMap);
		
		modelAndView.setViewName("jsonView");
		modelAndView.addObject("excMap", excMap);
		
		return modelAndView;
	}
}
