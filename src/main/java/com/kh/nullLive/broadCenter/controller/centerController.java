package com.kh.nullLive.broadCenter.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.nullLive.broadCenter.model.exception.StreamerInsertException;
import com.kh.nullLive.broadCenter.model.exception.StreamerUpdateException;
import com.kh.nullLive.broadCenter.model.service.BroadCenterService;
import com.kh.nullLive.broadCenter.model.vo.BroadCenter;
import com.kh.nullLive.common.attachment.model.vo.Attachment;
import com.kh.nullLive.member.model.exception.ProfileException;
import com.kh.nullLive.member.model.service.MemberService;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streamer.model.vo.Streamer;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@SessionAttributes("loginUser")
@Controller
public class centerController {

	@Autowired
	BroadCenterService bcs;
	@Autowired
	private MemberService ms;
	

	// 방송기능설정 페이지로 이동(정연)
	@RequestMapping("broadSetting.st")
	public String broadSetting(HttpSession session, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		int mno = loginUser.getMno();

		HashMap<String, Object> broadInfo = bcs.selectBroadSetting(mno);

		model.addAttribute("broadInfo", broadInfo);
		return "streaming/broadCenter/broadSetting";
	}

	// 스트리머 메인페이지로 이동(정연)
	@RequestMapping("main.st")
	public String streamerMain(HttpSession session, Model model, HttpServletRequest request) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		int mno = loginUser.getMno();

		HashMap<String, Object> mainInfo = bcs.selectMainInfo(mno);

		model.addAttribute("mainInfo", mainInfo);

		return "streaming/broadCenter/streamerMain";

		// System.out.println("엠앤오: " + mno);
	}

	// 매니저 설정 페이지로 이동(정연)
	@RequestMapping("partnerManage.st")
	public String partnerManage(@RequestParam("mno") int mno, Model model) {
		/*
		 * Member loginUser = (Member)session.getAttribute("loginUser"); int mno =
		 * loginUser.getMno();
		 */
			ArrayList<HashMap<String, Object>> partnerList = bcs.selectpartnerList(mno);
			
			model.addAttribute("partnerList", partnerList);

			return "streaming/broadCenter/partnerManagement";
	}

	// 블랙리스트 페이지로 이동(정연) // 블랙리스트 조회 (소연)
	@RequestMapping("blackListManage.st")
	public String blackListManage(HttpSession session, Model model) {
		int mno = ((Member) session.getAttribute("loginUser")).getMno();

		int blackCount = bcs.selectBlackListCount(mno);
		ArrayList<HashMap<String, Object>> blackList = bcs.selectBlackList(mno);

		System.out.println("blackList : " + blackList);
		System.out.println("blackCount : " + blackCount);

		model.addAttribute("blackCount", blackCount);
		model.addAttribute("blackList", blackList);
		

		return "streaming/broadCenter/blackListManagement";
	}

	// 금칙어 관리 페이지로 이동(정연)
	@RequestMapping("prohibitiveWordManage.st")
	public String prohibitiveWordManage() {
		return "streaming/broadCenter/prohibitiveWordManagement";
	}

	// 방송 공지 게시판 페이지로 이동(정연)
	@RequestMapping("noticeBoard.st")
	public String noticeboard(HttpSession session, Model model) throws StreamerUpdateException {
		Member loginUser = (Member) session.getAttribute("loginUser");
		int mno = loginUser.getMno();
		
		HashMap<String, Object> noticeInfo = bcs.selectNoticeBoard(mno);
		
		model.addAttribute("noticeInfo", noticeInfo);
		
		return "streaming/broadCenter/NoticeBoard";
	}

	// 시청자 소통 게시판 페이지로 이동(정연)
	@RequestMapping("communicationBoard.st")
	public String communicationBoard(HttpSession session, Model model) {
		int mno =  ((Member) session.getAttribute("loginUser")).getMno();
		
		HashMap<String, Object> commuInfo = new HashMap<String, Object>();
		commuInfo.put("mno", mno);
		commuInfo.put("type", "소통");
		
		int firstCheck = bcs.firstCheckCommunication(commuInfo);
		
		//System.out.println("체크: " + firstCheck);
		
		
		ArrayList<HashMap<String, Object>> list = bcs.selectCommunityList(mno);
		
		model.addAttribute("firstCheck", firstCheck);
		model.addAttribute("list", list);
		
		return "streaming/broadCenter/communicationBoard";
	}

	// 블랙리스트 제보 게시판 페이지로 이동(정연)
	@RequestMapping("reportBlackListBoard.st")
	public String reportBlackListBoard() {
		return "streaming/broadCenter/reportBlackListBoard";
	}

	// 스트리머 프로필 수정 페이지로 이동(정연)
	@RequestMapping("updateProfile.st")
	public String updateProfile() {
		return "streaming/broadCenter/updateProfile";
	}

	/**
	 * Author : ryan Date : 2019. 7. 2. Comment : 최초 방송 약관 동의 처리
	 */
	@RequestMapping("fStream.st")
	public String firstStreaming(Model model, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		try {
			bcs.streamerChange(loginUser);
			model.addAttribute("loginUser", bcs.resetMember(loginUser.getMno()));
			return "redirect:broadSetting.st";
		} catch (StreamerUpdateException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		} catch (StreamerInsertException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 방송하기 broad_his에 삽입(정연)
	@RequestMapping(value = "updateSetting.st")
	@ResponseBody
	public String updateSetting(@RequestParam(name = "json") String json, Model model) {
		// 직렬화 시켜 가져온 오브젝트 배열을 JSONArray 형식으로 바꿔줌
		JSONArray array = JSONArray.fromObject(json);

		HashMap<String, Object> broadInfo = new HashMap<String, Object>();

		for (int i = 0; i < array.size(); i++) {

			// JSONArray 형태의 값을 가져와 JSONObject 로 풀어준다.
			JSONObject obj = (JSONObject) array.get(i);

			broadInfo.put("title", obj.get("title"));
			broadInfo.put("category", obj.get("category"));
			broadInfo.put("pwd", obj.get("pwd"));
			broadInfo.put("endingComment", obj.get("endingComment"));
			broadInfo.put("bcno", obj.get("bcno"));
			broadInfo.put("adult", obj.get("adult"));
			broadInfo.put("pwdCheck", obj.get("pwdCheck"));
			// resendList.add(resendMap);
		}

		int insertCheck = bcs.updateBroadSetting(broadInfo);

		if (insertCheck > 0) {
			return "broadSetting.st";
		} else {
			return "common/errorPage";
		}

		// System.out.println("확인: " + insertCheck);

	}

	
	  //파트너 상세 조회(정연)
	  @RequestMapping(value = "partnerDetail.st" , produces = "application/text; charset=UTF-8" )
	  @ResponseBody public String PartnerDetail(@RequestParam("mno")int mno, Model model) throws StreamerUpdateException {
		  HashMap<String, Object> data = bcs.partnerDetail(mno);
	  
		  System.out.println("디테일: " + data);
	  
		  Gson gson = new Gson();
	  
		  model.addAttribute("data", data);
	  
		  return gson.toJson(data);
	  }
	  
	  
	  //시청자 소통 게시판 생성(정연)
	  @RequestMapping("enableCommunityBoard.st")
	  public String enableCommunityBoard(@RequestParam("mno") int mno, Model model){
		 int enableCheck = bcs.enableCommunityBoard(mno);
		  
		 model.addAttribute("firstCheck", enableCheck);
		  return "streaming/broadCenter/communicationBoard"; 
	  };
	  
	 
}
