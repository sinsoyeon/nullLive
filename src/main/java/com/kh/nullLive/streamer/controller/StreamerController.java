package com.kh.nullLive.streamer.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.broadCenter.model.exception.StreamerUpdateException;
import com.kh.nullLive.broadCenter.model.service.BroadCenterService;
import com.kh.nullLive.broadCenter.model.vo.BroadCenter;
import com.kh.nullLive.common.Pagination;
import com.kh.nullLive.common.attachment.model.vo.Attachment;
import com.kh.nullLive.member.model.service.MemberService;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streamer.model.service.StreamerService;
import com.kh.nullLive.streamer.model.vo.Streamer;

import aj.org.objectweb.asm.Type;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class StreamerController {

	@Autowired
	private StreamerService smService;

	@Autowired
	private BroadCenterService bcs;
	
	@Autowired
	private MemberService ms;

	@RequestMapping("selectStreamer.sm")
	public ModelAndView selectStreamer(String streamer, ModelAndView modelAndView) {
		System.out.println(streamer);
		// int sno = smService.selectStreamer(streamer);

		HashMap<String, Object> streamerInfo = smService.selectStreamer(streamer);

		modelAndView.setViewName("jsonView");
		modelAndView.addObject("streamerInfo", streamerInfo);

		return modelAndView;
	}

	@RequestMapping("subscribe.sm")
	@ResponseBody
	public String insertSubscribe(Streamer stremaer) {
		int result = smService.insertSubscribe(stremaer);

		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	@RequestMapping("monthlySubscribe.sm")
	@ResponseBody
	public String insertMonthlySubscribe(Streamer streamer, @RequestParam("amount") int amount) {

		System.out.println("amount : " + amount);
		int result = smService.insertMnthlSbscr(streamer, amount);

		if (result > 0) {
			return "success";

		} else {
			return "fail";
		}

	}

	@RequestMapping("insertNP.sm")
	public String insertNP(Streamer streamer, @RequestParam("amount") int amount,HttpSession session) {
		System.out.println(streamer);
		System.out.println(amount);

		int result = smService.insertNP(streamer, amount);
		
		System.out.println("insertNP result : " + result);
		
		HashMap<String,Object> hmap = new HashMap<String, Object>();
		
		System.out.println("mno : " + ((Member)session.getAttribute("loginUser")).getMno());
		hmap.put("mno", ((Member)session.getAttribute("loginUser")).getMno());
		hmap.put("amount", amount);
		
		System.out.println("hmap :" + hmap);
		
		int minusResult = smService.updatePoint(hmap);
		
		System.out.println("result : " + result);
		System.out.println("minusResult : " + minusResult);

		return "redirect:index.jsp";
	}

	@RequestMapping("subscribeListView.sm")
	@ResponseBody
	public ModelAndView subscribeList(@RequestParam("mno") int mno, ModelAndView model,@RequestParam("currentPage")String reqCurrentPage) {
		
		System.out.println("mno : " + mno);
		int currentPage = 1;
		
		if(reqCurrentPage != null) {
			currentPage = Integer.parseInt(reqCurrentPage);
		}
		
		int subCount = smService.getSubCount(mno);
		
		PageInfo pi = Pagination.getSPageInfo(currentPage, subCount);
		
		HashMap<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("pi", pi);
		infoMap.put("mno", mno);
		
		
		ArrayList<HashMap<String, Object>> listMap = smService.selectSubList(infoMap);

		System.out.println("회원번호 " + mno + " 의 구독자 조회 : " + listMap);

		for (int i = 0; i < listMap.size(); i++) {
			if (listMap.get(i).get("SU_PERIOD_DATE") != null)
				listMap.get(i).put("SU_PERIOD_DATE", listMap.get(i).get("SU_PERIOD_DATE").toString());

			System.out.println(listMap.get(i).get("SU_PERIOD_DATE"));

			if (listMap.get(i).get("SU_PERIOD_DATE").toString().equals("2999/12/31")) {
				listMap.get(i).replace("SU_PERIOD_DATE", "X");
			}
		}
		
		infoMap.put("listMap", listMap);

		model.setViewName("jsonView");
		model.addObject("infoMap", infoMap);

		System.out.println("최종 return : " + listMap);

		return model;
	}

	@RequestMapping("subscribeForMe.sm")
	@ResponseBody
	public ModelAndView subscribeForMe(@RequestParam("mno") int mno, ModelAndView model,@RequestParam("currentPage")String reqCurrentPage) {
		int currentPage = 1;
		
		if(reqCurrentPage != null) {
			currentPage = Integer.parseInt(reqCurrentPage);
		}
		
		int subMeCount = smService.getSubMeCount(mno);
		
		PageInfo pi = Pagination.getSPageInfo(currentPage, subMeCount);
		
		HashMap<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("pi", pi);
		infoMap.put("mno", mno);

		ArrayList<HashMap<String, Object>> forMeList = smService.selectForMeSubList(infoMap);
		
		infoMap.put("forMeList", forMeList);

		System.out.println("회원번호 " + mno + " 의 구독자 조회 : " + forMeList);

		model.setViewName("jsonView");
		model.addObject("infoMap", infoMap);

		return model;
	}

	@RequestMapping("searchSpon.sm")
	public ModelAndView searchSponList(int mno, int searchCondition, String searchValue, ModelAndView modelAndView) {
		HashMap<String, Object> searchTypeMap = new HashMap<String, Object>();
		searchTypeMap.put("mno", mno);
		searchTypeMap.put("searchCondition", searchCondition);
		searchTypeMap.put("searchValue", searchValue);

		ArrayList<HashMap<String, Object>> searchSponList = smService.searchSponList(searchTypeMap);

		modelAndView.setViewName("jsonView");
		modelAndView.addObject("searchSponList", searchSponList);

		return modelAndView;
	}

	@RequestMapping("requestExc.sm")
	@ResponseBody
	public String requestExchange(@RequestParam("mno") int mno, @RequestParam("amount") int amount) {
		int adultResult = smService.checkBank(mno);
		
		if(adultResult < 0 ) {
			return "noCertified";
		}
		
		HashMap<String, Object> excMap = new HashMap<String, Object>();
		excMap.put("mno", mno);
		excMap.put("amount", amount);
		excMap.put("exc_fee", (amount * 0.2));

		int result = smService.insertExchange(excMap);

		if (result > 0) {
			return "success";
		} else {
			return "환전 신청에 실패했습니다.";
		}
	}

	@RequestMapping("excView.sm")
	public String excViewControll(Model model) {

		return "member/recordPage/excListForm";
	}



	@RequestMapping("selectOneExc.sm")
	public ModelAndView selectOneExc(int mno, int excno, ModelAndView modelAndView) {

		HashMap<String, Object> userInfoMap = new HashMap<String, Object>();
		userInfoMap.put("mno", mno);
		userInfoMap.put("excno", excno);

		HashMap<String, Object> excMap = smService.selectOneExc(userInfoMap);

		modelAndView.setViewName("jsonView");
		modelAndView.addObject("excMap", excMap);

		return modelAndView;
	}

	@RequestMapping("cancelExc.sm")
	@ResponseBody
	public String cancelExchange(int mno, int excno) {
		HashMap<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("mno", mno);
		infoMap.put("excno", excno);

		int result = smService.cancelExchange(infoMap);

		return "해당 내역을 삭제했습니다.";
	}


	@RequestMapping("chartView.sm")
	public String chartView() {
		return "streaming/streamer/streamerChartForm";
	}

	@RequestMapping("ageChart.sm")
	public ModelAndView ageChart(int mno, ModelAndView modelAndView) {

		ArrayList<HashMap<String, Object>> ageChartData = smService.ageChartData(mno);

		modelAndView.setViewName("jsonView");
		modelAndView.addObject("ageChartData", ageChartData);

		System.out.println("ageChartData : " + ageChartData);

		return modelAndView;
	}

	@RequestMapping("sponAgeChart.sm")
	public ModelAndView sponAgeChart(int mno, ModelAndView modelAndView) {
		ArrayList<HashMap<String, Object>> sponAgeChart = smService.sponAgeChart(mno);

		modelAndView.setViewName("jsonView");
		modelAndView.addObject("sponAgeChart", sponAgeChart);

		System.out.println(sponAgeChart);

		return modelAndView;
	}

	@RequestMapping("recomView.sm")
	public String recomView() {
		return "streaming/streamer/stearmerRecomChartForm";
	}

	@RequestMapping("recom.sm")
	public ModelAndView recomChart(int mno, int type, ModelAndView modelAndView) {

		HashMap<String, Object> recomInfoMap = new HashMap<String, Object>();
		recomInfoMap.put("mno", mno);
		recomInfoMap.put("type", type);

		ArrayList<HashMap<String, Object>> weeklyRecomList = smService.recomList(recomInfoMap);

		modelAndView.setViewName("jsonView");
		modelAndView.addObject("weeklyRecomList", weeklyRecomList);

		return modelAndView;
	}

	@RequestMapping("todayRecom.sm")
	public ModelAndView todayRecom(int mno, ModelAndView modelAndView) {

		HashMap<String, Object> todayRecom = smService.todayRecom(mno);

		modelAndView.setViewName("jsonView");
		modelAndView.addObject("todayRecom", todayRecom);

		return modelAndView;
	}

	@RequestMapping("selectAllChart.sm")
	public ModelAndView selectAllChart(int mno, ModelAndView modelAndView) {
		ArrayList<HashMap<String, Object>> selectAllChart = smService.selectAllChart(mno);

		modelAndView.setViewName("jsonView");
		modelAndView.addObject("selectAllChart", selectAllChart);

		return modelAndView;
	}

	// return : selectAllSubChart;
	@RequestMapping("selectSubChart.sm")
	public ModelAndView selectSubChart(int mno, ModelAndView modelAndView) {
		ArrayList<HashMap<String, Object>> selectAllSubChart = smService.selectAllSubChart(mno);

		modelAndView.setViewName("jsonView");
		modelAndView.addObject("selectAllSubChart", selectAllSubChart);

		return modelAndView;

	}

	@RequestMapping("selectOneBlackList.sm")
	public ModelAndView selectOneBlackList(int blno, int mno, ModelAndView modelAndView) {

		HashMap<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("blno", blno);
		infoMap.put("mno", mno);

		HashMap<String, Object> blackDetail = bcs.selectOneBlackList(infoMap);

		blackDetail.put("BL_DATE", (blackDetail.get("BL_DATE").toString()));

		System.out.println("blackDetail : " + blackDetail);

		modelAndView.setViewName("jsonView");
		modelAndView.addObject("blackDetail", blackDetail);

		return modelAndView;
	}

	@RequestMapping("insertBlackList.sm")
	public void insertBlackList(String userId, HttpSession session, HttpServletResponse response) {

		response.setContentType("text/html; charset=utf-8");

		HashMap<String, Object> infoMap = new HashMap<String, Object>();

		System.out.println("mno : " + ((Member) session.getAttribute("loginUser")).getMno());
		infoMap.put("userId", userId);
		infoMap.put("mno", ((Member) session.getAttribute("loginUser")).getMno());

		int result = smService.insertBlackList(infoMap);

		try {
			PrintWriter pw = response.getWriter();

			if (result > 0) {
				pw.println("<script>alert('블랙리스트에 추가 되었습니다.'); location.href='blackListManage.st';</script>\n");
			} else {
				pw.println("<script>alert('블랙리스트 추가에 실패하였습니다.'); location.href='blackListManage.st';</script>\n");
			}

			pw.flush();
		} catch (IOException e) {

		}

	}

	@RequestMapping("allDeleteBlackList.sm")
	public void deleteAllBlackList(HttpSession session, HttpServletResponse response) {

		int result = smService.deleteAllBlackList(((Member) session.getAttribute("loginUser")).getMno());

		response.setContentType("text/html; charset=utf-8");
		try {
			PrintWriter pw = response.getWriter();

			if (result > 0) {
				pw.println("<script>alert('모든 블랙리스트가 삭제 되었습니다.'); location.href='blackListManage.st';</script>\n");
			} else {
				pw.println("<script>alert('블랙리스트 삭제에 실패하였습니다.'); location.href='blackListManage.st';</script>\n");
			}

			pw.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping("searchBlackList.sm")
	public ModelAndView searchBlackList(String searchValue, HttpSession session, ModelAndView modelAndView) {
		HashMap<String, Object> infoMap = new HashMap<String, Object>();

		infoMap.put("searchValue", searchValue);
		infoMap.put("mno", ((Member) session.getAttribute("loginUser")).getMno());

		ArrayList<HashMap<String, Object>> searchList = smService.searchBlackList(infoMap);

		System.out.println(searchList);

		modelAndView.setViewName("jsonView");
		modelAndView.addObject("searchList", searchList);

		return modelAndView;
	}

	@RequestMapping("mutipleDeleteBlack.sm")
	@ResponseBody
	public String mutipleDeleteBlack(@RequestParam(name = "checkList[]") List<String> checkList, HttpSession session) {
		System.out.println("checkList  : " + checkList);

		HashMap<String, Object> infoMap = new HashMap<String, Object>();

		infoMap.put("checkList", checkList);
		infoMap.put("mno", ((Member) session.getAttribute("loginUser")).getMno());

		int result = smService.mutipleDeleteBlack(infoMap);

		if (result == checkList.size()) {
			return "success";
		} else {
			return "fail";
		}
	}

	
	//파트너 상세 조회(정연)
	@RequestMapping(value = "partnerDetail.sm")
	@ResponseBody public ModelAndView PartnerDetail(@RequestParam("mno")int mno, ModelAndView modelAndView, HttpSession session) throws StreamerUpdateException {
		BroadCenter broadCenter = (BroadCenter) session.getAttribute("broadCenter");
		int smno = broadCenter.getMno();
		
		System.out.println("에메노: " + mno + "\n에세메노: " + smno);
		
		HashMap<String, Object> need = new HashMap<String, Object>();
		need.put("mno",mno);
		need.put("smno", smno);
		
		HashMap<String, Object> data = bcs.partnerDetail(need);

		System.out.println("디테일: " + data);

		//Gson gson = new Gson();

		/*
		 * model.addAttribute("data", data); return gson.toJson(data);
		 */

		modelAndView.setViewName("jsonView"); modelAndView.addObject("data",data);


		return modelAndView; 
		}
	
	
	@RequestMapping("selectCulList.sm")
	public ModelAndView selectCulList(int mno,ModelAndView modelAndView,@RequestParam("currentPage")String reqCurrentPage) {
		System.out.println("mno : " + mno);
		int currentPage = 1;
		
		if(reqCurrentPage != null) {
			currentPage = Integer.parseInt(reqCurrentPage);
		}
		
		int culCount = smService.getCulCount(mno);
		
		PageInfo pi = Pagination.getSPageInfo(currentPage, culCount);
		
		HashMap<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("pi", pi);
		infoMap.put("mno", mno);
		
		ArrayList<HashMap<String, Object>> clcList;
		clcList = smService.selectClcList(infoMap);
		
		
		infoMap = new HashMap<String, Object>();
		
		infoMap.put("pi", pi);
		infoMap.put("clcList", clcList);
		
		modelAndView.setViewName("jsonView");
		modelAndView.addObject("infoMap",infoMap);
		
		System.out.println(clcList);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "selectSponList.sm")
	@ResponseBody
	public ModelAndView selectSponList(@RequestParam("mno") int mno, ModelAndView modelAndView,@RequestParam("currentPage")String reqCurrentPage) {
		
		int currentPage = 1;
		
		if(reqCurrentPage != null) {
			currentPage = Integer.parseInt(reqCurrentPage);
		}
		
		int sponCount = smService.getSponCount(mno);
		
		PageInfo pi = Pagination.getSPageInfo(currentPage, sponCount);
		
		HashMap<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("pi", pi);
		infoMap.put("mno", mno);		
		
		List<HashMap<String, Object>> sponList = new ArrayList<HashMap<String, Object>>();
		sponList = smService.selectSponList(infoMap);
		
		System.out.println("스폰 리스트 : " + sponList);

		for (int i = 0; i < sponList.size(); i++) {
			sponList.get(i).put("SPON_DATE", sponList.get(i).get("SPON_DATE").toString());
		}
		infoMap.put("sponList", sponList);
		
		modelAndView.setViewName("jsonView");
		modelAndView.addObject("infoMap", infoMap);

		return modelAndView;
	}
	
	

	@RequestMapping("sponForMeList.sm")
	public ModelAndView selectSponForMe(@RequestParam("mno") int mno, ModelAndView modelAndView,@RequestParam("currentPage")String reqCurrentPage) {
		System.out.println("reqCurrentPage : " + reqCurrentPage);
		int currentPage = 1;
		
		if(reqCurrentPage != null) {
			currentPage = Integer.parseInt(reqCurrentPage);
		}
		
		int sponForMeCount = smService.getSponForMeCount(mno);
		
		PageInfo pi = Pagination.getSPageInfo(currentPage, sponForMeCount);
		
		HashMap<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("pi", pi);
		infoMap.put("mno", mno);		
		
		ArrayList<HashMap<String, Object>> sponForMeList = smService.selectSponForMeList(infoMap);

		for (int i = 0; i < sponForMeList.size(); i++) {
			sponForMeList.get(i).put("SPON_DATE", sponForMeList.get(i).get("SPON_DATE").toString());
		}
		
		infoMap.put("sponForMeList", sponForMeList);

		modelAndView.setViewName("jsonView");
		modelAndView.addObject("infoMap", infoMap);

		return modelAndView;
	}

	
	@RequestMapping("selectExcList.sm")
	public ModelAndView selectExcList(int mno, ModelAndView modelAndView,@RequestParam("currentPage")String reqCurrentPage) {
		int currentPage = 1;
		
		if(reqCurrentPage != null) {
			currentPage = Integer.parseInt(reqCurrentPage);
		}
		
		int excCount = smService.getExcCount(mno);
		
		PageInfo pi = Pagination.getSPageInfo(currentPage, excCount);
		
		HashMap<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("pi", pi);
		infoMap.put("mno", mno);		
				
		ArrayList<HashMap<String, Object>> excList = smService.selectExcList(infoMap);

		for (int i = 0; i < excList.size(); i++) {
			excList.get(i).put("APPLICATION_DATE", excList.get(i).get("APPLICATION_DATE").toString());
		}

		
		System.out.println("size : " + excList.size());
		
		
		infoMap = new HashMap<String, Object>();
		infoMap.put("excList", excList);
		infoMap.put("pi", pi);
		System.out.println("pi : " + pi);
		
		modelAndView.setViewName("jsonView");
		modelAndView.addObject("infoMap", infoMap);
		

		return modelAndView;
	}
	
	@RequestMapping("selecOneClc.sm")
	public ModelAndView selectOneClc(int mno,int clcno,ModelAndView modelAndView) {

		HashMap<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("mno", mno);
		infoMap.put("clcno", clcno);
		
		HashMap<String, Object> clcMap = smService.selectOneClc(infoMap);
		
		
		System.out.println("clcMap : " + clcMap);
		
		
		modelAndView.setViewName("jsonView");
		modelAndView.addObject("clcMap", clcMap);
		
		
		
		return modelAndView;
	}
	
	
	@RequestMapping("reClc.sm")
	@ResponseBody
	public String reClc(int mno,int decno,ModelAndView modelAndView) {
		
		System.out.println("mno : " + mno + " decno : " + decno);
		
		HashMap<String, Object> infoMap = new HashMap<String, Object>();
		
		infoMap.put("mno", mno);
		infoMap.put("decno", decno);
		
		int result = smService.reClc(infoMap);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}

	
	//프로필 (정연)
	@RequestMapping("profile.sm")
	@ResponseBody
	public ModelAndView selectProfile(HttpSession session, ModelAndView modelAndView) throws StreamerUpdateException{
		Member loginUser = (Member) session.getAttribute("loginUser");
		BroadCenter broadCenter = (BroadCenter)session.getAttribute("broadCenter");
		
		//int mno = loginUser.getMno();
		int smno = broadCenter.getMno();

		Attachment att = bcs.getProfile(smno);
		HashMap<String, Object> profile = bcs.streamerPofile(smno);

		modelAndView.setViewName("jsonView");
		modelAndView.addObject("changeName",  att.getChangeName());
		modelAndView.addObject("data", profile);

		return modelAndView;
	}
	
	
	 //공지 수정 (정연)
	 @RequestMapping("updateNotice.sm")
	 @ResponseBody 
	 public ModelAndView updateNotice(@RequestParam(name="mno") int mno, @RequestParam(name="content") String content, ModelAndView modelAndView) throws StreamerUpdateException{ 
	  HashMap<String, Object> updateInfo = new HashMap<String, Object>();
	  updateInfo.put("mno", mno); updateInfo.put("content", content);
	  
	  int updateNoticeCheck = bcs.updateNoticeCheck(updateInfo);
	  
		  if(updateNoticeCheck>0) { 
			  HashMap<String, Object> noticeInfo = bcs.selectNoticeBoard(mno);
		  
			  modelAndView.setViewName("jsonView"); 
			  modelAndView.addObject("data", noticeInfo);
		  
		  }else {
			String msg = "업데이트 실패!"; modelAndView.addObject("data", msg); 
			return modelAndView; 
		  }
	  return modelAndView; 
	  }
	 
	 
	 //공지 삭제(정연)
	 @RequestMapping("deleteNotice.sm")
	 @ResponseBody 
	 public ModelAndView deleteNotice(@RequestParam(name="mno") int mno, ModelAndView modelAndView) {
		 
		 int data = bcs.deleteNotice(mno);
		 
		 modelAndView.setViewName("jsonView"); 
		 modelAndView.addObject("data", data);
		 
		 return modelAndView;
	 }
	 
	
	 //스트리머 검색(정연)
	 @RequestMapping("searchStreamer.sm")
	 public String searchStreamer(Model model, @RequestParam("name") String name) {
		 ArrayList<HashMap<String, Object>> streamerList = new ArrayList<HashMap<String, Object>>(); 

		 if(name == "") {
			 streamerList = bcs.searchStreamer();
		 }else {
			 streamerList = bcs.searchStreamerName(name);
		 }
		 
		 model.addAttribute("streamerList", streamerList);
		 
		 return "member/streamerSearchList";
	 }
	 
	 
	 @RequestMapping("detailClc.sm")
	 public ModelAndView selectOneClc1(int mno,int clcno,ModelAndView modelAndView) {
		 
		 
		 HashMap<String, Object> infoMap = new HashMap<String, Object>();
		 infoMap.put("mno",mno);
		 infoMap.put("clcno",clcno);
		 
		 HashMap<String, Object> detailClc = smService.detailClc(infoMap);
		 
		 modelAndView.setViewName("jsonView");
		 modelAndView.addObject("detailClc",detailClc);
		 
		 return modelAndView;
	 }
	 
	 
	 @RequestMapping("rejectClc.sm")
	 public String rejectClc(int mno,int clcno,String reason,HttpServletResponse response) {
		 response.setContentType("text/html; charset=utf-8");
		 System.out.println("mno : " + mno);
		 System.out.println("clcno : " + clcno);
		 System.out.println("reason : " + reason);
		 
		 HashMap<String, Object> rejectMap = new HashMap<String, Object>();
		 rejectMap.put("mno", mno);
		 rejectMap.put("clcno", clcno);
		 rejectMap.put("reason", reason);
		 
		 int result = smService.rejectClc(rejectMap);
		 
		 try {
			PrintWriter pw = response.getWriter();
			
			if(result > 0) {
				//pw.println("<script>alert('블랙리스트에 추가 되었습니다.'); location.href='blackListManage.st';</script>\n");
				pw.println("<script>alert('해당 정산 요청을 거절하였습니다.'); location.href='excView.sm?status=1';</script>\n");
			}else {
				pw.println("<script>alert('정산 거절에 실패하였습니다.<br/> 다시 시도해주세요.'); location.href='excView.sm?status=1';</script>\n");
			}
			
			pw.flush();
			pw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 
		 return "redirect:excView.sm";
	 }
	 
	 @RequestMapping("selectReqCulList.sm")
	 public ModelAndView selectReqCulList(int mno,@RequestParam("currentPage")String reqCurrentPage,ModelAndView modelAndView) {
		int currentPage = 1;
		 
		if(reqCurrentPage != null) {
			currentPage = Integer.parseInt(reqCurrentPage);
		}
		
		int reqClcCount = smService.getReqClcCount(mno);
		
		PageInfo pi = Pagination.getSPageInfo(currentPage, reqClcCount);
		
		HashMap<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("pi", pi);
		infoMap.put("mno", mno);		
		
		
		
		ArrayList<HashMap<String, Object>> reqClcList = smService.selectReqClcList(infoMap);
		
		System.out.println("reqClcList : " + reqClcList);
		
		infoMap.put("reqClcList", reqClcList);

		
		modelAndView.addObject("infoMap",infoMap);
		modelAndView.setViewName("jsonView");

	
		 
		 return modelAndView;
	 }
	 
	@RequestMapping("selectChargeList.sm")
	public ModelAndView selectChargeList(ModelAndView modelAndview, int mno,@RequestParam("currentPage")String reqCurrentPage) {
		int currentPage = 1;
		

		if(reqCurrentPage != null) {
			currentPage = Integer.parseInt(reqCurrentPage);
		}
		
		int chargeCount = smService.getChargeCount(mno);
		
		PageInfo pi = Pagination.getSPageInfo(currentPage, chargeCount);
		
		HashMap<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("pi", pi);
		infoMap.put("mno", mno);		
		
		
		
		ArrayList<HashMap<String, Object>> chargeList = smService.selectChargeList(infoMap);
		
		infoMap.put("chargeList", chargeList);

		
		modelAndview.addObject("infoMap",infoMap);
		modelAndview.setViewName("jsonView");

		return modelAndview;
	}
	
	
	@RequestMapping("confirmClc.sm")
	public String confirmClc(int mno,int clcno,int clc_amount,HttpServletResponse response) {
		
		response.setContentType("text/html; charset=utf-8");
		
		HashMap<String, Object> infoMap= new HashMap<String, Object>();
		
		infoMap.put("mno", mno);
		infoMap.put("clcno", clcno);
		infoMap.put("clc_amount", clc_amount);
		
		int result = smService.confirmClc(infoMap);
		
		 try {
				PrintWriter pw = response.getWriter();
				
				if(result > 0) {
					//pw.println("<script>alert('블랙리스트에 추가 되었습니다.'); location.href='blackListManage.st';</script>\n");
					pw.println("<script>alert('해당 정산 요청을 승인하였습니다.'); location.href='excView.sm?status=1';</script>\n");
				}else {
					pw.println("<script>alert('정산 승인에 실패하였습니다.<br/> 다시 시도해주세요.'); location.href='excView.sm?status=1';</script>\n");
				}
				
				pw.flush();
				pw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return "redirect:excView.sm";
	}
	
	@RequestMapping("selectMyConList.sm")
	public ModelAndView selectMyConList(int mno,@RequestParam("currentPage")String reqCurrentPage,ModelAndView modelAndView) {
		int currentPage = 1;
		 
		if(reqCurrentPage != null) {
			currentPage = Integer.parseInt(reqCurrentPage);
		}
		
		int selectMyConCount = smService.selectMyConCount(mno);
		
		PageInfo pi = Pagination.getSPageInfo(currentPage, selectMyConCount);
		
		HashMap<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("pi", pi);
		infoMap.put("mno", mno);
		
		 ArrayList<HashMap<String, Object>> possibleMap = smService.selectMyConList(infoMap);
		
		infoMap.put("possibleList", possibleMap);
		
		
		return modelAndView;
	}
	
	@RequestMapping("insertClc.sm")
	public void insertClc(int mno,int pno,int sno,String amount,HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		
		HashMap<String,Object> infoMap = new HashMap<String, Object>();
		
		infoMap.put("PNO", pno);
		infoMap.put("mno", mno);
		infoMap.put("SNO", sno);
		infoMap.put("CLC_AMOUNT", Integer.parseInt(amount));
		
		int result = smService.insertClc(infoMap);
		
		 try {
			PrintWriter pw = response.getWriter();
			
			if(result > 0) {
				//pw.println("<script>alert('블랙리스트에 추가 되었습니다.'); location.href='blackListManage.st';</script>\n");
				pw.println("<script>alert('정산 요청을 완료하였습니다.'); location.href='partner.me';</script>\n");
			}else {
				pw.println("<script>alert('정산 요청을 실패하였습니다.<br/> 다시 시도해주세요.'); location.href='partner.me';</script>\n");
			}
			
			pw.flush();
			pw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//소통게시판 작성 insert(정연)
	  @RequestMapping("insertCommunityDetail.st")
	  @ResponseBody 
	  public ModelAndView insertCommunityDetail(@RequestParam("jsonData") String jsonData, ModelAndView modelAndView) { 
		  // 직렬화 시켜 가져온 오브젝트 배열을 JSONArray 형식으로 바꿔줌
		  JSONArray array = JSONArray.fromObject(jsonData);
		  
		  HashMap<String, Object> insertDetail = new HashMap<String, Object>();
		  
		  for (int i = 0; i < array.size(); i++) { 
			  // JSONArray 형태의 값을 가져와 JSONObject 로풀어준다. 
			  
		  JSONObject obj = (JSONObject) array.get(i);
		  
		  insertDetail.put("mno", obj.get("mno")); 
		  insertDetail.put("title",obj.get("title")); 
		  insertDetail.put("content", obj.get("content"));
		  insertDetail.put("smno", obj.get("smno")); 
		  insertDetail.put("type", "소통");
		  
		  }
		  
		  //bbno 가져오기
		  int bbno = bcs.selectBbno(insertDetail); 
		  
		  insertDetail.put("bbno", bbno);
		  
		  System.out.println("인서트 bbno:" + insertDetail);
		  
		  int result = bcs.insertCommunityDetail(insertDetail);
		  
		  System.out.println("등록: " + result );
		  
		  
		  modelAndView.setViewName("jsonView");
		modelAndView.addObject("data", result);
		  
		  if(result>0) {
			  return modelAndView; 
		  }else {
			  return modelAndView;
		  }
		  
		  //model.addAttribute("bbno", bbno);
		  
		  }

	  
	  //소통게시물 수정(정연)
	  @RequestMapping("updateCommunityDetail.st")
	  @ResponseBody
	  public ModelAndView updateCommunityDetail(@RequestParam("jsonData") String jsonData, ModelAndView modelAndView) { 
		  JSONArray array = JSONArray.fromObject(jsonData);
		  
		  HashMap<String, Object> updateDetail = new HashMap<String, Object>();
		  
		  for (int i = 0; i < array.size(); i++) { 

			  JSONObject obj = (JSONObject) array.get(i);
 
			  updateDetail.put("bno", obj.get("bno")); 
			  updateDetail.put("title",obj.get("title")); 
			  updateDetail.put("content", obj.get("content"));
		  }
		  
		  int result = bcs.updateCommunityDetail(updateDetail);

		  modelAndView.setViewName("jsonView");
		  modelAndView.addObject("data", result);
		  
		  if(result>0) {
			  return modelAndView; 
		  }else {
			  return modelAndView;
		  }


	  }
	  
	  //소통 게시물 삭제(정연)
	  @RequestMapping("deleteCommunityDetail.st")
	  @ResponseBody
	  public ModelAndView deleteCommunityDetail(@RequestParam("bno") int bno, ModelAndView modelAndView) {
		  int result = bcs.deleteCommu(bno);
		  
		  
		  modelAndView.setViewName("jsonView");
		  modelAndView.addObject("data", result);
		  return modelAndView;
	  }
	  
	  //소통 게시물 여러개 삭제(정연)
	  @RequestMapping("deleteManyCommu.st")
	  public ModelAndView deleteManyCommu(@RequestParam("list") String list, ModelAndView modelAndView) {
		  System.out.println("리스트: " + list);
		  String[] splitList = list.split(",");
		  int [] dlist = new int[splitList.length];
		  int result = 0;
			
		  
			for(int i=0; i<splitList.length; i++) {
				dlist[i] = Integer.parseInt(splitList[i]);
				int bno = dlist[i];
				
				result = bcs.deleteCommu(bno);
				System.out.println(i+"결과: " + result);
			}
		  
		  modelAndView.setViewName("jsonView");
		  modelAndView.addObject("data", result);
		  return modelAndView; 
	  }
	  
	//소연 : 알람 작업중 1
	@RequestMapping("selectAlarmList.sm")
	public ModelAndView selectAlarmList(int mno,@RequestParam("currentPage")String reqCurrentPage,ModelAndView modelAndView) {
		int currentPage = 1;
		
		if(reqCurrentPage != null) {
			currentPage = Integer.parseInt(reqCurrentPage);
		}
		
		int myAlarmCount = ms.selectAlarmCount(mno);
		
		PageInfo pi = Pagination.getSPageInfo(currentPage, myAlarmCount);
		
		pi.setLimit(4);
		
		HashMap<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("pi", pi);
		infoMap.put("mno", mno);
		
		 ArrayList<HashMap<String, Object>> myAlarmList  = ms.selectMyAlmList(infoMap);
		
		 System.out.println("myAlarmList : " +myAlarmList.size());
		 
		infoMap.put("myAlarmList", myAlarmList);
		
		modelAndView.setViewName("jsonView");
		modelAndView.addObject("infoMap",infoMap);
		
		return modelAndView;
	}
	
	//소연 알람작업중 2
	@RequestMapping("updateAlarm.sm")
	public ModelAndView updateAlarm(HttpSession session,int ano,String mid,ModelAndView modelAndView) {
		
		HashMap<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("ano", ano);
		infoMap.put("mid", mid);
		
		int result = ms.updateAlarm(infoMap);
		
		modelAndView.setViewName("jsonView");
		modelAndView.addObject("result",result);
		
		return modelAndView;
	}

	@RequestMapping("selectCount.sm")
	@ResponseBody
	public String selectCount(int mno) {
		int count = ms.selectCount(mno); 
		
		return count+"";
	}
	
	@RequestMapping("bankCert.sm")
	public String backCert(String account,int back_code,String holder,HttpSession session,HttpServletResponse response) {
		HashMap<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("account", account);
		infoMap.put("back_code", back_code);
		infoMap.put("holder", holder);
		infoMap.put("mno", ((Member)session.getAttribute("loginUser")).getMno());
		
		int result = smService.insertBankCert(infoMap);
		
		
		PrintWriter pw =null;
		if(result > 0) {
			try {
				pw = response.getWriter();
				pw.println("<script>alert('인증 완료 되었습니다.'); location.href='requestExc.sm';</script>\n");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			pw.println("");
		}
		
		return "redirect:excView.sm";
	}
}
