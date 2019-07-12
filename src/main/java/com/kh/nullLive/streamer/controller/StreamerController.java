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
import com.kh.nullLive.common.Pagination;
import com.kh.nullLive.common.attachment.model.vo.Attachment;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streamer.model.service.StreamerService;
import com.kh.nullLive.streamer.model.vo.Streamer;

import aj.org.objectweb.asm.Type;

@Controller
public class StreamerController {

	@Autowired
	private StreamerService smService;

	@Autowired

	private BroadCenterService bcs;

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
	public String insertNP(Streamer streamer, @RequestParam("amount") int amount) {
		System.out.println(streamer);
		System.out.println(amount);

		int result = smService.insertNP(streamer, amount);

		return "redirect:index.jsp";
	}

	@RequestMapping("subscribeListView.sm")
	@ResponseBody
	public ModelAndView subscribeList(@RequestParam("mno") int mno, ModelAndView model) {
		ArrayList<HashMap<String, Object>> listMap = smService.selectSubList(mno);

		System.out.println("회원번호 " + mno + " 의 구독자 조회 : " + listMap);

		for (int i = 0; i < listMap.size(); i++) {
			if (listMap.get(i).get("SU_PERIOD_DATE") != null)
				listMap.get(i).put("SU_PERIOD_DATE", listMap.get(i).get("SU_PERIOD_DATE").toString());

			System.out.println(listMap.get(i).get("SU_PERIOD_DATE"));

			if (listMap.get(i).get("SU_PERIOD_DATE").toString().equals("2999/12/31")) {
				listMap.get(i).replace("SU_PERIOD_DATE", "X");
			}
		}

		model.setViewName("jsonView");
		model.addObject("listMap", listMap);

		System.out.println("최종 return : " + listMap);

		return model;
	}

	@RequestMapping("subscribeForMe.sm")
	@ResponseBody
	public ModelAndView subscribeForMe(@RequestParam("mno") int mno, ModelAndView model) {

		ArrayList<HashMap<String, Object>> forMeList = smService.selectForMeSubList(mno);

		System.out.println("회원번호 " + mno + " 의 구독자 조회 : " + forMeList);

		model.setViewName("jsonView");
		model.addObject("forMeList", forMeList);

		return model;
	}

	@RequestMapping(value = "selectSponList.sm")
	@ResponseBody
	public ModelAndView selectSponList(@RequestParam("mno") int mno, ModelAndView modelAndView) {
		List<HashMap<String, Object>> sponList = new ArrayList<HashMap<String, Object>>();
		sponList = smService.selectSponList(mno);
		System.out.println("스폰 리스트 : " + sponList);

		for (int i = 0; i < sponList.size(); i++) {
			sponList.get(i).put("SPON_DATE", sponList.get(i).get("SPON_DATE").toString());
		}

		modelAndView.setViewName("jsonView");
		modelAndView.addObject("sponList", sponList);

		return modelAndView;
	}

	@RequestMapping("sponForMeList.sm")
	public ModelAndView selectSponForMe(@RequestParam("mno") int mno, ModelAndView modelAndView) {
		ArrayList<HashMap<String, Object>> sponForMeList = smService.selectSponForMeList(mno);

		for (int i = 0; i < sponForMeList.size(); i++) {
			sponForMeList.get(i).put("SPON_DATE", sponForMeList.get(i).get("SPON_DATE").toString());
		}

		modelAndView.setViewName("jsonView");
		modelAndView.addObject("sponForMeList", sponForMeList);

		return modelAndView;
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

	@RequestMapping("selectChargeList.sm")
	public ModelAndView selectChargeList(ModelAndView modelAndview, int mno) {

		ArrayList<HashMap<String, Object>> chargeList = smService.selectChargeList(mno);

		modelAndview.setViewName("jsonView");
		modelAndview.addObject("chargeList", chargeList);

		return modelAndview;
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
	@ResponseBody public ModelAndView PartnerDetail(@RequestParam("mno")int mno, ModelAndView modelAndView) throws StreamerUpdateException {

		HashMap<String, Object> data = bcs.partnerDetail(mno);

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
	public ModelAndView reClc(int mno,int decno,ModelAndView modelAndView) {
		
		System.out.println("mno : " + mno + " decno : " + decno);
		
		HashMap<String, Object> infoMap = new HashMap<String, Object>();
		
		infoMap.put("mno", mno);
		infoMap.put("decno", decno);
		
		int result = smService.reClc(infoMap);
		
		return modelAndView;
	}

	
	//프로필 (정연)
	@RequestMapping("profile.sm")
	@ResponseBody
	public ModelAndView selectProfile(HttpSession session, ModelAndView modelAndView) throws StreamerUpdateException{
		Member loginUser = (Member) session.getAttribute("loginUser");
		int mno = loginUser.getMno();

		Attachment att = bcs.getProfile(mno);

		modelAndView.setViewName("jsonView");
		modelAndView.addObject("data",  att.getChangeName());

		return modelAndView;
	}
	
	
	/*
	 * //공지 수정 (정연)
	 * 
	 * @RequestMapping("updateNotice.sm")
	 * 
	 * @ResponseBody public ModelAndView updateNotice(@RequestParam(name="mno") int
	 * mno, @RequestParam(name="content") String content, ModelAndView modelAndView)
	 * { HashMap<String, Object> updateInfo = new HashMap<String, Object>();
	 * updateInfo.put("mno", mno); updateInfo.put("content", content);
	 * 
	 * int updateNoticeCheck = bcs.updateNoticeCheck(updateInfo);
	 * 
	 * 
	 * if(updateNoticeCheck>0) { String updateContent = bcs.updateNotice(mno);
	 * 
	 * modelAndView.setViewName("jsonView"); modelAndView.addObject("data",
	 * updateContent);
	 * 
	 * }else { String msg = "업데이트 실패!"; modelAndView.addObject("data", msg); return
	 * modelAndView; }
	 * 
	 * return modelAndView; }
	 */
	
	
}
