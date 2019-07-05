package com.kh.nullLive.broadCenter.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.nullLive.broadCenter.model.exception.StreamerInsertException;
import com.kh.nullLive.broadCenter.model.exception.StreamerUpdateException;
import com.kh.nullLive.broadCenter.model.service.BroadCenterService;
import com.kh.nullLive.broadCenter.model.vo.BroadCenter;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streamer.model.vo.Streamer;

import net.sf.json.JSONObject;

@SessionAttributes("loginUser")
@Controller
public class centerController {
	
	@Autowired
	BroadCenterService bcs;
	
	
	//방송기능설정 페이지로 이동(정연)
	@RequestMapping("broadSetting.st")
	public String broadSetting(HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mno = loginUser.getMno();
		
		BroadCenter broadCenter = bcs.selectBroadSetting(mno);
		
		model.addAttribute("broadCenter", broadCenter);
		return "streaming/broadCenter/broadSetting";
	}
	

	//스트리머 메인페이지로 이동(정연)
	@RequestMapping("main.st")
	public String streamerMain(HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mno = loginUser.getMno();
		
		//System.out.println("엠앤오: " + mno);
		
		HashMap<String, Object> mainInfo = bcs.selectMainInfo(mno);
		
		model.addAttribute("mainInfo", mainInfo);
		return "streaming/broadCenter/streamerMain";
	}

	//매니저 설정 페이지로 이동(정연)
	@RequestMapping("partnerManage.st")
	public String partnerManage() {

		return "streaming/broadCenter/partnerManagement";
	}
	//블랙리스트 페이지로 이동(정연)
	@RequestMapping("blackListManage.st")
	public String blackListManage() {
		return "streaming/broadCenter/blackListManagement";
	}
	//금칙어 관리 페이지로 이동(정연)
	@RequestMapping("prohibitiveWordManage.st")
	public String prohibitiveWordManage() {
		return "streaming/broadCenter/prohibitiveWordManagement";
	}
	//방송 공지 게시판  페이지로 이동(정연)
	@RequestMapping("noticeBoard.st")
	public String noticeboard() {
		return "streaming/streamerBoard/NoticeBoard";
	}
	//시청자 소통 게시판  페이지로 이동(정연)
	@RequestMapping("communicationBoard.st")
	public String communicationBoard() {
		return "streaming/streamerBoard/communicationBoard";
	}
	//블랙리스트 제보 게시판  페이지로 이동(정연)
	@RequestMapping("reportBlackListBoard.st")
	public String reportBlackListBoard() {
		return "streaming/streamerBoard/reportBlackListBoard";
	}
	//스트리머 프로필 수정  페이지로 이동(정연)
	@RequestMapping("updateProfile.st")
	public String updateProfile() {
		return "streaming/broadCenter/updateProfile";
	}

	
	/**
	 * Author : ryan
	 * Date : 2019. 7. 2.
	 * Comment : 최초 방송 약관 동의 처리
	 */
	@RequestMapping("fStream.st")
	public String firstStreaming(Model model,HttpSession session, Streamer streamer) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println("streamer : "+streamer);
		try {
			bcs.streamerChange(loginUser,streamer);
			model.addAttribute("loginUser",bcs.resetMember(loginUser.getMno()));
			return "redirect:broadSetting.st";
		} catch (StreamerUpdateException e) {
			model.addAttribute("msg",e.getMessage());
			return "common/errorPage";
		} catch (StreamerInsertException e) {
			model.addAttribute("msg",e.getMessage());
			return "common/errorPage";
		}
	}

	
	
	@RequestMapping(value = "updateSetting.st")
	@ResponseBody
	public Map<String, Object> updateSetting(@RequestParam(name="json") JSONObject json){

		Map<String, Object> result= new HashMap<String, Object>();
		result.put("타이틀", "ㅋ");
		
		System.out.println("json" + json.get("bTitle"));
		
		return result;
	}
	
}
