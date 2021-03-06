package com.kh.nullLive.streaming.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nullLive.member.model.exception.UpdateMemberException;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streaming.model.exception.EnterStreamingException;
import com.kh.nullLive.streaming.model.exception.StreamingException;
import com.kh.nullLive.streaming.model.service.StreamingService;
import com.kh.nullLive.streaming.model.vo.BroadHis;
import com.kh.nullLive.streaming.model.vo.BroadList;

@Controller
public class StreamingController {

	@Autowired
	private StreamingService ss;

	/**
	 * Author : ryan
	 * Date : 2019. 6. 20. // 7. 2.
	 * Comment : 마이페이지에서 방송시작 버튼 클릭 시 // 최초 방송 시 방송 약관 페이지 이동
	 */
	//스트리머 방송 페이지로 이동
	@RequestMapping("start.st")
	public String startStreaming(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String isStreamer = loginUser.getIsStreamer();
		if(isStreamer.equals("Y")) {
			return "redirect:broadSetting.st";
		}else {
			return "member/myPage/firstStreaming";
		}
	}
  
	/**
	 * Author : ryan
	 * Date : 2019. 7. 13.
	 * Comment : 방송 정보 가져오기 (제한 정보)
	 */
	@RequestMapping("isAvailToEnter.st")
	public String isAvailToEnter(Model model,@RequestParam(name="streamerAddress")String streamerAddress,
									HttpServletResponse response) {
		try {
			ss.isBroading(streamerAddress);
			response.setContentType("text/html; charset=utf-8");
			BroadHis broadHis = ss.getStreamingInfo(streamerAddress);
			if(broadHis.getBpwd() != null && broadHis.getAdult().equals("Y")) {
				model.addAttribute("streamerAddress",streamerAddress);
				model.addAttribute("bpwd",broadHis.getBpwd());
				model.addAttribute("badult",broadHis.getAdult());
				return "streaming/streamingEntering";
			}else if(broadHis.getBpwd() != null){
				model.addAttribute("streamerAddress",streamerAddress);
				model.addAttribute("bpwd",broadHis.getBpwd());
				model.addAttribute("badult",broadHis.getAdult());
				return "streaming/streamingEntering";
			}else if(broadHis.getAdult().equals("Y")) {
				model.addAttribute("streamerAddress",streamerAddress);
				model.addAttribute("badult",broadHis.getAdult());
				return "streaming/streamingEntering";
			}else {
				return "redirect:enterStreaming.st?streamerAddress="+streamerAddress;
			}
		} catch (EnterStreamingException e) {
			model.addAttribute("msg",e.getMessage());
			return "streaming/errorPage";
		}
	}

	/**
	 * Author : ryan
	 * Date : 2019. 7. 7.
	 * Comment : 스트리밍 시청
	 */
	@RequestMapping("enterStreaming.st")
	public String enterStreaming(Model model,HttpSession session,@RequestParam(name="streamerAddress")String streamerAddress,
			HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		Member loginUser = (Member)session.getAttribute("loginUser");
		try {

			int result = ss.checkBlackList(loginUser,streamerAddress);

			PrintWriter pw = response.getWriter();

			if(result > 0) {			
				pw.println("<script>alert('해당 방송에 접근할 수 없습니다.'); window.close() </script>\n");

				pw.flush();
				pw.close();

				return "redirect:index.jsp";
			}else {
				HashMap<String,Object> hmap = ss.enterStream(loginUser,streamerAddress);
				
				//ArrayList<HashMap<String, Object>> mlist = ss.streamerPartner(streamerAddress);
				
				model.addAttribute("broadInfo",hmap);		//방송 정보 담아가야함
				model.addAttribute("title", hmap.get("TITLE"));
				model.addAttribute("bhno",hmap.get("BHNO"));
				model.addAttribute("mid",loginUser.getMid());
				
				//model.addAttribute("mlist", mlist);

				return "streaming/streamRoom";
			}
		} catch (EnterStreamingException e) {
			model.addAttribute("msg",e.getMessage());
			return "streaming/errorPage";
		} catch (IOException e) {
			return "streaming/errorPage";
		}
	}

	/**
	 * Author : ryan
	 * Date : 2019. 7. 3.
	 * Comment : 스트리밍 시작
	 */
	@RequestMapping("startStreaming.st")
	public String startStreaming(Model model,HttpSession session,BroadHis broadHis,@RequestParam(name="broadMethod")String broadMethod) {
		System.out.println("broadMethod : "+broadMethod);
		broadHis.setStreamerId(((Member)session.getAttribute("loginUser")).getMid());
		try {
			HashMap<String,Object> hmap = ss.startStreaming(broadHis);
			
			if(hmap != null) {
				int result = ss.subInfoMap(((Member)session.getAttribute("loginUser")).getMno());
			}
			
			model.addAttribute("broadInfo",hmap);
			model.addAttribute("title", broadHis.getBtitle());
			model.addAttribute("broadMethod",broadMethod);
			
			return "streaming/streamRoom";
		} catch (StreamingException e) {
			model.addAttribute("msg",e.getMessage());
			return "streaming/errorPage";
		}
	}

	/**
	 * Author : ryan
	 * Date : 2019. 7. 3.
	 * Comment : 스트리밍 종료
	 */
	@RequestMapping("endStreaming.st")
	public String endStreaming(@RequestParam(name="mid")String mid) {
		ss.endStreaming(mid);
		return null;
	}

	/**
	 * Author : ryan
	 * Date : 2019. 7. 7.
	 * Comment : 시청 종료
	 */
	@RequestMapping("exitStreaming.st")
	public String exitStreaming(@RequestParam(name="mid")String mid,@RequestParam(name="bhno")String bhno) {
		ss.exitStreaming(mid,bhno);
		return null;
	}

	/*정언 메인페이지*/
	/**
	 * @author : eon
	 * @date : 2019. 7. 11.
	 * @comment : 메인페이지 Hot Live 방송 리스트 조회용 메소드
	 */
	@RequestMapping("hotLiveList.st")
	public ModelAndView selectHotLiveList(HttpServletRequest request, ModelAndView mv, HttpServletResponse response) {
		int listCount = ss.getHotLiveListCount();
		System.out.println("Hot Live 방송 갯수 : " + listCount);

		ArrayList<BroadList> blist = ss.selectHotLiveList();
		System.out.println("Hot Live 방송 목록 : " + blist);

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

		for(int i = 0; i < blist.size(); i++) {
			HashMap<String, Object> hmap = new HashMap<String, Object>();
			String sDate = fmt.format(blist.get(i).getStartDate());

			hmap.put("bhno", blist.get(i).getBhno());
			hmap.put("broadAddress", blist.get(i).getBroadAddress());
			hmap.put("mno", blist.get(i).getMno());
			hmap.put("nickName", blist.get(i).getNickName());
			hmap.put("startDate", sDate);
			hmap.put("bhStatus", blist.get(i).getBhStatus());
			hmap.put("countViewers", blist.get(i).getCountViewers());
			hmap.put("bcno", blist.get(i).getBcno());
			hmap.put("countRecommendation", blist.get(i).getCountRecommendation());
			hmap.put("bTitle", blist.get(i).getBTitle());
			hmap.put("bPwd", blist.get(i).getBPwd());
			hmap.put("pwdCheck", blist.get(i).getPwdCheck());
			hmap.put("bCategory", blist.get(i).getBCategory());
			hmap.put("adult", blist.get(i).getAdult());

			list.add(hmap);
		}

		mv.addObject("list", list);
		mv.setViewName("jsonView");

		return mv;
	}

	/**
	 * @author : eon
	 * @date : 2019. 7. 12.
	 * @comment : 메인페이지 Hot Vod 방송 리스트 조회용 메소드
	 */
	@RequestMapping("hotVodList.st")
	public ModelAndView selectHotVodList(HttpServletRequest request, ModelAndView mv, HttpServletResponse response) {
		int listCount = ss.getHotVodListCount();
		System.out.println("Hot Vod 방송 갯수 : " + listCount);

		ArrayList<BroadList> blist = ss.selectHotVodList();
		System.out.println("Hot Vod 방송 목록 : " + blist);

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

		for(int i = 0; i < blist.size(); i++) {
			HashMap<String, Object> hmap = new HashMap<String, Object>();
			String sDate = fmt.format(blist.get(i).getStartDate());
			String eDate = fmt.format(blist.get(i).getEndDate());

			hmap.put("bhno", blist.get(i).getBhno());
			hmap.put("broadAddress", blist.get(i).getBroadAddress());
			hmap.put("mno", blist.get(i).getMno());
			hmap.put("nickName", blist.get(i).getNickName());
			hmap.put("startDate", sDate);
			hmap.put("endDate", eDate);
			hmap.put("bhStatus", blist.get(i).getBhStatus());
			hmap.put("countViewers", blist.get(i).getCountViewers());
			hmap.put("bcno", blist.get(i).getBcno());
			hmap.put("countRecommendation", blist.get(i).getCountRecommendation());
			hmap.put("bTitle", blist.get(i).getBTitle());
			hmap.put("bPwd", blist.get(i).getBPwd());
			hmap.put("pwdCheck", blist.get(i).getPwdCheck());
			hmap.put("bCategory", blist.get(i).getBCategory());
			hmap.put("adult", blist.get(i).getAdult());

			list.add(hmap);


		}

		mv.addObject("list", list);
		mv.setViewName("jsonView");

		return mv;
	}

	/**
	 * @author : eon
	 * @date : 2019. 7. 13.
	 * @comment : 메인페이지 All Live 방송 리스트 조회용 메소드
	 */
	@RequestMapping("searchAllLive.st")
	public ModelAndView searchAllLive(HttpServletRequest request, ModelAndView mv, HttpServletResponse response) {
		if(request.getParameter("condition") == null) {
			//전체 Live 방송 목록 개수 가져옴
			int listCount = ss.getAllLiveListCount();
			System.out.println("All Live 방송 갯수 : " + listCount);

			ArrayList<BroadList> blist = ss.selectAllLiveList();
			System.out.println("All Live 방송 목록 : " + blist);

			ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

			for(int i = 0; i < blist.size(); i++) {
				HashMap<String, Object> hmap = new HashMap<String, Object>();
				String sDate = fmt.format(blist.get(i).getStartDate());

				hmap.put("bhno", blist.get(i).getBhno());
				hmap.put("broadAddress", blist.get(i).getBroadAddress());
				hmap.put("mno", blist.get(i).getMno());
				hmap.put("nickName", blist.get(i).getNickName());
				hmap.put("startDate", sDate);
				hmap.put("bhStatus", blist.get(i).getBhStatus());
				hmap.put("countViewers", blist.get(i).getCountViewers());
				hmap.put("bcno", blist.get(i).getBcno());
				hmap.put("countRecommendation", blist.get(i).getCountRecommendation());
				hmap.put("bTitle", blist.get(i).getBTitle());
				hmap.put("bPwd", blist.get(i).getBPwd());
				hmap.put("pwdCheck", blist.get(i).getPwdCheck());
				hmap.put("bCategory", blist.get(i).getBCategory());
				hmap.put("adult", blist.get(i).getAdult());

				list.add(hmap);


			}

			mv.addObject("list", list);
			mv.setViewName("jsonView");

			
		}else {
			int condition = Integer.parseInt(request.getParameter("condition"));
			
			//검색한 All Live 방송 목록 개수 가져옴
			int listCount = ss.getSearchAllLiveCount(condition);
			System.out.println("검색한 All Live 방송 갯수 : " + listCount);

			ArrayList<BroadList> blist = ss.searchAllLiveList(condition);
			System.out.println("검색한 All Live 방송 목록 : " + blist);

			ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

			for(int i = 0; i < blist.size(); i++) {
				HashMap<String, Object> hmap = new HashMap<String, Object>();
				String sDate = fmt.format(blist.get(i).getStartDate());

				hmap.put("bhno", blist.get(i).getBhno());
				hmap.put("broadAddress", blist.get(i).getBroadAddress());
				hmap.put("mno", blist.get(i).getMno());
				hmap.put("nickName", blist.get(i).getNickName());
				hmap.put("startDate", sDate);
				hmap.put("bhStatus", blist.get(i).getBhStatus());
				hmap.put("countViewers", blist.get(i).getCountViewers());
				hmap.put("bcno", blist.get(i).getBcno());
				hmap.put("countRecommendation", blist.get(i).getCountRecommendation());
				hmap.put("bTitle", blist.get(i).getBTitle());
				hmap.put("bPwd", blist.get(i).getBPwd());
				hmap.put("pwdCheck", blist.get(i).getPwdCheck());
				hmap.put("bCategory", blist.get(i).getBCategory());
				hmap.put("adult", blist.get(i).getAdult());

				list.add(hmap);


			}

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		}
		
		return mv;
	}
	
	/**
	 * @author : eon
	 * @date : 2019. 7. 13.
	 * @comment : 메인페이지 All Vod 방송 리스트 조회용 메소드
	 */
	@RequestMapping("searchAllVod.st")
	public ModelAndView searchAllVod(HttpServletRequest request, ModelAndView mv, HttpServletResponse response) {
		if(request.getParameter("condition") == null) {
			//전체 Vod 방송 목록 개수 가져옴
			int listCount = ss.getAllVodListCount();
			System.out.println("All Vod 방송 갯수 : " + listCount);

			ArrayList<BroadList> blist = ss.selectAllVodList();
			System.out.println("All Vod 방송 목록 : " + blist);

			ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

			for(int i = 0; i < blist.size(); i++) {
				HashMap<String, Object> hmap = new HashMap<String, Object>();
				String sDate = fmt.format(blist.get(i).getStartDate());
				String eDate = fmt.format(blist.get(i).getEndDate());

				hmap.put("bhno", blist.get(i).getBhno());
				hmap.put("broadAddress", blist.get(i).getBroadAddress());
				hmap.put("mno", blist.get(i).getMno());
				hmap.put("nickName", blist.get(i).getNickName());
				hmap.put("startDate", sDate);
				hmap.put("endDate", eDate);
				hmap.put("bhStatus", blist.get(i).getBhStatus());
				hmap.put("countViewers", blist.get(i).getCountViewers());
				hmap.put("bcno", blist.get(i).getBcno());
				hmap.put("countRecommendation", blist.get(i).getCountRecommendation());
				hmap.put("bTitle", blist.get(i).getBTitle());
				hmap.put("bPwd", blist.get(i).getBPwd());
				hmap.put("pwdCheck", blist.get(i).getPwdCheck());
				hmap.put("bCategory", blist.get(i).getBCategory());
				hmap.put("adult", blist.get(i).getAdult());

				list.add(hmap);


			}

			mv.addObject("list", list);
			mv.setViewName("jsonView");

			
		}else {
			int condition = Integer.parseInt(request.getParameter("condition"));
			
			//검색한 Vod 방송 목록 개수 가져옴
			int listCount = ss.getSearchAllVodCount(condition);
			System.out.println("검색한 All Vod 방송 갯수 : " + listCount);

			ArrayList<BroadList> blist = ss.searchAllVodList(condition);
			System.out.println("검색한 All Vod 방송 목록 : " + blist);

			ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

			for(int i = 0; i < blist.size(); i++) {
				HashMap<String, Object> hmap = new HashMap<String, Object>();
				String sDate = fmt.format(blist.get(i).getStartDate());
				String eDate = fmt.format(blist.get(i).getEndDate());

				hmap.put("bhno", blist.get(i).getBhno());
				hmap.put("broadAddress", blist.get(i).getBroadAddress());
				hmap.put("mno", blist.get(i).getMno());
				hmap.put("nickName", blist.get(i).getNickName());
				hmap.put("startDate", sDate);
				hmap.put("endDate", eDate);
				hmap.put("bhStatus", blist.get(i).getBhStatus());
				hmap.put("countViewers", blist.get(i).getCountViewers());
				hmap.put("bcno", blist.get(i).getBcno());
				hmap.put("countRecommendation", blist.get(i).getCountRecommendation());
				hmap.put("bTitle", blist.get(i).getBTitle());
				hmap.put("bPwd", blist.get(i).getBPwd());
				hmap.put("pwdCheck", blist.get(i).getPwdCheck());
				hmap.put("bCategory", blist.get(i).getBCategory());
				hmap.put("adult", blist.get(i).getAdult());

				list.add(hmap);


			}

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		}
		
		return mv;
	}
	
	/**
	 * @Author : ryan
	 * @Date : 2019. 7. 14.
	 * @Comment : 방송 추천
	 */
	@ResponseBody
	@RequestMapping("recomStreamer.st")
	public String recomStreamer(Model model,HttpServletRequest request) {
		String mid = request.getParameter("mid");
		String streamerAddress = request.getParameter("streamerAddress");
		
		try {
			ss.recomStreamer(mid,streamerAddress);
			return "success";
		} catch (StreamingException e) {
			return "fail";
		}
		
	}
	
	/**
	 * @Author : ryan
	 * @Date : 2019. 7. 14.
	 * @Comment : 현재 추천 수 가져오기
	 */
	@RequestMapping("currRecom.st")
	public ModelAndView currRecom(String roomId) {
		int result = ss.currRecom(roomId);
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("jsonView");
		mv.addObject("result",result);
		
		return mv;
	}
  
	/*
	 * @author : eon
	 * @date : 2019. 7. 13.
	 * @comment : 메인페이지 All 방송 리스트 시청인원순으로 정렬하는 메소드
	 */
	@RequestMapping("sortAllbyViewer.st")
	public ModelAndView sortAllbyViewer(HttpServletRequest request, ModelAndView mv, HttpServletResponse response) {
		String isLV = request.getParameter("isLV");
		
		System.out.println("LIVE or VOD : " + isLV);
		
		if(request.getParameter("condition") == null) {
			ArrayList<BroadList> blist = null;
			
			//LIVE일때 조회
			if(isLV.equals("live")) {
				//전체 Live 방송 목록 개수 가져옴
				int listCount = ss.getAllLiveListCount();
				System.out.println("All Live 방송 갯수 : " + listCount);

				blist = ss.sortVAllLiveList();
				System.out.println("시청자 순으로 정렬한 All Live 방송 목록 : " + blist);
			}else {
				//전체 Vod 방송 목록 개수 가져옴
				int listCount = ss.getAllVodListCount();
				System.out.println("All Vod 방송 갯수 : " + listCount);

				blist = ss.sortVAllVodList();
				System.out.println("시청자 순으로 정렬한 All Vod 방송 목록 : " + blist);
			}

			ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

			for(int i = 0; i < blist.size(); i++) {
				HashMap<String, Object> hmap = new HashMap<String, Object>();
				String sDate = fmt.format(blist.get(i).getStartDate());
				
				if(blist.get(i).getEndDate() != null) {
					String eDate = fmt.format(blist.get(i).getEndDate());
					hmap.put("endDate", eDate);
				}

				hmap.put("bhno", blist.get(i).getBhno());
				hmap.put("broadAddress", blist.get(i).getBroadAddress());
				hmap.put("mno", blist.get(i).getMno());
				hmap.put("nickName", blist.get(i).getNickName());
				hmap.put("startDate", sDate);
				hmap.put("bhStatus", blist.get(i).getBhStatus());
				hmap.put("countViewers", blist.get(i).getCountViewers());
				hmap.put("bcno", blist.get(i).getBcno());
				hmap.put("countRecommendation", blist.get(i).getCountRecommendation());
				hmap.put("bTitle", blist.get(i).getBTitle());
				hmap.put("bPwd", blist.get(i).getBPwd());
				hmap.put("pwdCheck", blist.get(i).getPwdCheck());
				hmap.put("bCategory", blist.get(i).getBCategory());
				hmap.put("adult", blist.get(i).getAdult());

				list.add(hmap);


			}
			
			mv.addObject("list", list);
			mv.setViewName("jsonView");

			
		}else {
			int condition = Integer.parseInt(request.getParameter("condition"));
			
			ArrayList<BroadList> blist = null;
			
			//LIVE일때 조회
			if(isLV.equals("live")) {
				//시청자 순으로 정렬한 All Live 방송 목록 개수 가져옴(조건있음)
				int listCount = ss.getSearchAllLiveCount(condition);
				System.out.println("시청자 순으로 정렬한 All Live 방송 갯수(조건있음) : " + listCount);

				blist = ss.sortVAllLiveList2(condition);
				System.out.println("시청자 순으로 정렬한 All Live 방송 목록 (조건있음): " + blist);
			}else {
				//시청자 순으로 정렬한 All Vod 방송 목록 개수 가져옴(조건있음)
				int listCount = ss.getSearchAllVodCount(condition);
				System.out.println("시청자 순으로 정렬한 All Vod 방송 갯수(조건있음) : " + listCount);

				blist = ss.sortVAllVodList2(condition);
				System.out.println("시청자 순으로 정렬한 All Vod 방송 목록(조건있음) : " + blist);
			}
			
			ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

			for(int i = 0; i < blist.size(); i++) {
				HashMap<String, Object> hmap = new HashMap<String, Object>();
				String sDate = fmt.format(blist.get(i).getStartDate());
				
				if(blist.get(i).getEndDate() != null) {
					String eDate = fmt.format(blist.get(i).getEndDate());
					hmap.put("endDate", eDate);
				}
				
				hmap.put("bhno", blist.get(i).getBhno());
				hmap.put("broadAddress", blist.get(i).getBroadAddress());
				hmap.put("mno", blist.get(i).getMno());
				hmap.put("nickName", blist.get(i).getNickName());
				hmap.put("startDate", sDate);
				hmap.put("bhStatus", blist.get(i).getBhStatus());
				hmap.put("countViewers", blist.get(i).getCountViewers());
				hmap.put("bcno", blist.get(i).getBcno());
				hmap.put("countRecommendation", blist.get(i).getCountRecommendation());
				hmap.put("bTitle", blist.get(i).getBTitle());
				hmap.put("bPwd", blist.get(i).getBPwd());
				hmap.put("pwdCheck", blist.get(i).getPwdCheck());
				hmap.put("bCategory", blist.get(i).getBCategory());
				hmap.put("adult", blist.get(i).getAdult());

				list.add(hmap);


			}

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		}
		
		return mv;
	}
	
	/**
	 * @author : eon
	 * @date : 2019. 7. 14.
	 * @comment : 메인페이지 All 방송 리스트 추천인원순으로 정렬하는 메소드
	 */
	@RequestMapping("sortAllbyRec.st")
	public ModelAndView sortAllbyRec(HttpServletRequest request, ModelAndView mv, HttpServletResponse response) {
		String isLV = request.getParameter("isLV");
		
		System.out.println("LIVE or VOD : " + isLV);
		
		if(request.getParameter("condition") == null) {
			ArrayList<BroadList> blist = null;
			
			//LIVE일때 조회
			if(isLV.equals("live")) {
				//전체 Live 방송 목록 개수 가져옴
				int listCount = ss.getAllLiveListCount();
				System.out.println("All Live 방송 갯수 : " + listCount);

				blist = ss.sortRAllLiveList();
				System.out.println("추천 순으로 정렬한 All Live 방송 목록 : " + blist);
			}else {
				//전체 Vod 방송 목록 개수 가져옴
				int listCount = ss.getAllVodListCount();
				System.out.println("All Vod 방송 갯수 : " + listCount);

				blist = ss.sortRAllVodList();
				System.out.println("추천 순으로 정렬한 All Vod 방송 목록 : " + blist);
			}

			ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

			for(int i = 0; i < blist.size(); i++) {
				HashMap<String, Object> hmap = new HashMap<String, Object>();
				String sDate = fmt.format(blist.get(i).getStartDate());
				
				if(blist.get(i).getEndDate() != null) {
					String eDate = fmt.format(blist.get(i).getEndDate());
					hmap.put("endDate", eDate);
				}

				hmap.put("bhno", blist.get(i).getBhno());
				hmap.put("broadAddress", blist.get(i).getBroadAddress());
				hmap.put("mno", blist.get(i).getMno());
				hmap.put("nickName", blist.get(i).getNickName());
				hmap.put("startDate", sDate);
				hmap.put("bhStatus", blist.get(i).getBhStatus());
				hmap.put("countViewers", blist.get(i).getCountViewers());
				hmap.put("bcno", blist.get(i).getBcno());
				hmap.put("countRecommendation", blist.get(i).getCountRecommendation());
				hmap.put("bTitle", blist.get(i).getBTitle());
				hmap.put("bPwd", blist.get(i).getBPwd());
				hmap.put("pwdCheck", blist.get(i).getPwdCheck());
				hmap.put("bCategory", blist.get(i).getBCategory());
				hmap.put("adult", blist.get(i).getAdult());

				list.add(hmap);


			}
			
			mv.addObject("list", list);
			mv.setViewName("jsonView");

			
		}else {
			int condition = Integer.parseInt(request.getParameter("condition"));
			
			ArrayList<BroadList> blist = null;
			
			//LIVE일때 조회
			if(isLV.equals("live")) {
				//추천 순으로 정렬한 All Live 방송 목록 개수 가져옴(조건있음)
				int listCount = ss.getSearchAllLiveCount(condition);
				System.out.println("추천 순으로 정렬한 All Live 방송 갯수(조건있음) : " + listCount);

				blist = ss.sortRAllLiveList2(condition);
				System.out.println("추천 순으로 정렬한 All Live 방송 목록 (조건있음): " + blist);
			}else {
				//추천 순으로 정렬한 All Vod 방송 목록 개수 가져옴(조건있음)
				int listCount = ss.getSearchAllVodCount(condition);
				System.out.println("추천 순으로 정렬한 All Vod 방송 갯수(조건있음) : " + listCount);

				blist = ss.sortRAllVodList2(condition);
				System.out.println("추천 순으로 정렬한 All Vod 방송 목록(조건있음) : " + blist);
			}
			
			ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

			for(int i = 0; i < blist.size(); i++) {
				HashMap<String, Object> hmap = new HashMap<String, Object>();
				String sDate = fmt.format(blist.get(i).getStartDate());

				if(blist.get(i).getEndDate() != null) {
					String eDate = fmt.format(blist.get(i).getEndDate());
					hmap.put("endDate", eDate);
				}
				
				hmap.put("bhno", blist.get(i).getBhno());
				hmap.put("broadAddress", blist.get(i).getBroadAddress());
				hmap.put("mno", blist.get(i).getMno());
				hmap.put("nickName", blist.get(i).getNickName());
				hmap.put("startDate", sDate);
				hmap.put("bhStatus", blist.get(i).getBhStatus());
				hmap.put("countViewers", blist.get(i).getCountViewers());
				hmap.put("bcno", blist.get(i).getBcno());
				hmap.put("countRecommendation", blist.get(i).getCountRecommendation());
				hmap.put("bTitle", blist.get(i).getBTitle());
				hmap.put("bPwd", blist.get(i).getBPwd());
				hmap.put("pwdCheck", blist.get(i).getPwdCheck());
				hmap.put("bCategory", blist.get(i).getBCategory());
				hmap.put("adult", blist.get(i).getAdult());

				list.add(hmap);


			}

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		}
		
		return mv;
	}
	
	/**
	 * @author : eon
	 * @date : 2019. 7. 15.
	 * @comment : 메인페이지 즐겨찾기 화면 호출하는 메소드
	 */
	@RequestMapping("favorite.st")
	public String favoritePage() { 
		return "main/favorite";
	}
	
	/**
	 * @author : eon
	 * @date : 2019. 7. 15.
	 * @comment : 즐겨찾기에서 최근 본 Live 방송 리스트 조회용 메소드
	 */
	@RequestMapping("lLiveList.st")
	public ModelAndView selectlLiveList(HttpServletRequest request, ModelAndView mv, HttpServletResponse response) {
		Member m = (Member) request.getSession().getAttribute("loginUser");
		
		int mno = m.getMno();
		System.out.println("로그인 한 유저 : " + mno);
		
		int listCount = ss.getlLiveListCount(mno);
		System.out.println("최근 본 Live 방송 갯수 : " + listCount);

		ArrayList<BroadList> blist = ss.selectlLiveList(mno);
		System.out.println("최근 본 Live 방송 목록 : " + blist);

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

		for(int i = 0; i < blist.size(); i++) {
			HashMap<String, Object> hmap = new HashMap<String, Object>();
			String sDate = fmt.format(blist.get(i).getStartDate());

			hmap.put("bhno", blist.get(i).getBhno());
			hmap.put("broadAddress", blist.get(i).getBroadAddress());
			hmap.put("mno", blist.get(i).getMno());
			hmap.put("nickName", blist.get(i).getNickName());
			hmap.put("startDate", sDate);
			hmap.put("bhStatus", blist.get(i).getBhStatus());
			hmap.put("countViewers", blist.get(i).getCountViewers());
			hmap.put("bcno", blist.get(i).getBcno());
			hmap.put("countRecommendation", blist.get(i).getCountRecommendation());
			hmap.put("bTitle", blist.get(i).getBTitle());
			hmap.put("bPwd", blist.get(i).getBPwd());
			hmap.put("pwdCheck", blist.get(i).getPwdCheck());
			hmap.put("bCategory", blist.get(i).getBCategory());
			hmap.put("adult", blist.get(i).getAdult());

			list.add(hmap);
		}

		mv.addObject("list", list);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	/**
	 * @author : eon
	 * @date : 2019. 7. 15.
	 * @comment : 즐겨찾기에서 최근 본 Vod 방송 리스트 조회용 메소드
	 */
	@RequestMapping("lVodList.st")
	public ModelAndView selectlVodList(HttpServletRequest request, ModelAndView mv, HttpServletResponse response) {
		Member m = (Member) request.getSession().getAttribute("loginUser");
		
		int mno = m.getMno();
		System.out.println("로그인 한 유저 : " + mno);
		
		int listCount = ss.getlVodListCount(mno);
		System.out.println("최근 본 Vod 방송 갯수 : " + listCount);

		ArrayList<BroadList> blist = ss.selectlVodList(mno);
		System.out.println("최근 본 Vod 방송 목록 : " + blist);

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

		for(int i = 0; i < blist.size(); i++) {
			HashMap<String, Object> hmap = new HashMap<String, Object>();
			String sDate = fmt.format(blist.get(i).getStartDate());
			String eDate = fmt.format(blist.get(i).getEndDate());

			hmap.put("bhno", blist.get(i).getBhno());
			hmap.put("broadAddress", blist.get(i).getBroadAddress());
			hmap.put("mno", blist.get(i).getMno());
			hmap.put("nickName", blist.get(i).getNickName());
			hmap.put("startDate", sDate);
			hmap.put("endDate", eDate);
			hmap.put("bhStatus", blist.get(i).getBhStatus());
			hmap.put("countViewers", blist.get(i).getCountViewers());
			hmap.put("bcno", blist.get(i).getBcno());
			hmap.put("countRecommendation", blist.get(i).getCountRecommendation());
			hmap.put("bTitle", blist.get(i).getBTitle());
			hmap.put("bPwd", blist.get(i).getBPwd());
			hmap.put("pwdCheck", blist.get(i).getPwdCheck());
			hmap.put("bCategory", blist.get(i).getBCategory());
			hmap.put("adult", blist.get(i).getAdult());

			list.add(hmap);
		}

		mv.addObject("list", list);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	/**
	 * @author : eon
	 * @date : 2019. 7. 15.
	 * @comment : 즐겨찾기 한 BJ 리스트 조회용 메소드
	 */
	@RequestMapping("fBjList.st")
	public ModelAndView selectfBjList(HttpServletRequest request, ModelAndView mv, HttpServletResponse response) {
		Member m = (Member) request.getSession().getAttribute("loginUser");
		
		int mno = m.getMno();
		System.out.println("로그인 한 유저 : " + mno);
		
		int listCount = ss.getfBjListCount(mno);
		System.out.println("즐겨찾기 한 BJ 갯수 : " + listCount);

		ArrayList<BroadList> blist = ss.selectfBjList(mno);
		System.out.println("즐겨찾기 한 BJ 목록 : " + blist);

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		for(int i = 0; i < blist.size(); i++) {
			HashMap<String, Object> hmap = new HashMap<String, Object>();

			hmap.put("fano", blist.get(i).getFano());
			hmap.put("mno", blist.get(i).getMno());
			hmap.put("nickName", blist.get(i).getNickName());
			hmap.put("favCount", blist.get(i).getFavCount());
			hmap.put("profileImg", blist.get(i).getProfileImg());

			list.add(hmap);
		}

		mv.addObject("list", list);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	/**
	 * @author : eon
	 * @date : 2019. 7. 15.
	 * @comment : 구독 한 BJ 리스트 조회용 메소드
	 */
	@RequestMapping("sBjList.st")
	public ModelAndView selectsBjList(HttpServletRequest request, ModelAndView mv, HttpServletResponse response) {
		Member m = (Member) request.getSession().getAttribute("loginUser");
		
		int mno = m.getMno();
		System.out.println("로그인 한 유저 : " + mno);
		
		int listCount = ss.getsBjListCount(mno);
		System.out.println("구독 한 BJ 갯수 : " + listCount);

		ArrayList<BroadList> blist = ss.selectsBjList(mno);
		System.out.println("구독 한 BJ 목록 : " + blist);

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		for(int i = 0; i < blist.size(); i++) {
			HashMap<String, Object> hmap = new HashMap<String, Object>();

			hmap.put("fano", blist.get(i).getFano());
			hmap.put("mno", blist.get(i).getMno());
			hmap.put("nickName", blist.get(i).getNickName());
			hmap.put("subCount", blist.get(i).getSubCount());
			hmap.put("profileImg", blist.get(i).getProfileImg());

			list.add(hmap);
		}

		mv.addObject("list", list);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	/**
	 * @author : eon
	 * @date : 2019. 7. 16.
	 * @comment : 즐겨찾기 한 스트리머의 Live 방송 리스트 조회용 메소드
	 */
	@RequestMapping("showBLive.st")
	public ModelAndView showBLiveList(HttpServletRequest request, ModelAndView mv, HttpServletResponse response, @RequestParam int smno) {
		System.out.println("스트리머" + smno);
		
		int listCount = ss.getBLiveListCount(smno);
		System.out.println(smno + "의 방송 갯수(LIVE) : " + listCount);

		ArrayList<BroadList> blist = ss.selectBLiveList(smno);
		System.out.println(smno + "의 방송 목록(LIVE) : " + blist);

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

		for(int i = 0; i < blist.size(); i++) {
			HashMap<String, Object> hmap = new HashMap<String, Object>();
			String sDate = fmt.format(blist.get(i).getStartDate());

			hmap.put("bhno", blist.get(i).getBhno());
			hmap.put("broadAddress", blist.get(i).getBroadAddress());
			hmap.put("mno", blist.get(i).getMno());
			hmap.put("nickName", blist.get(i).getNickName());
			hmap.put("startDate", sDate);
			hmap.put("bhStatus", blist.get(i).getBhStatus());
			hmap.put("countViewers", blist.get(i).getCountViewers());
			hmap.put("bcno", blist.get(i).getBcno());
			hmap.put("countRecommendation", blist.get(i).getCountRecommendation());
			hmap.put("bTitle", blist.get(i).getBTitle());
			hmap.put("bPwd", blist.get(i).getBPwd());
			hmap.put("pwdCheck", blist.get(i).getPwdCheck());
			hmap.put("bCategory", blist.get(i).getBCategory());
			hmap.put("adult", blist.get(i).getAdult());

			list.add(hmap);
		}

		mv.addObject("list", list);
		mv.setViewName("jsonView");

		return mv;
	}
	
	/**
	 * @author : eon
	 * @date : 2019. 7. 16.
	 * @comment : 즐겨찾기 한 스트리머의 Vod 방송 리스트 조회용 메소드
	 */
	@RequestMapping("showBVod.st")
	public ModelAndView showBVodList(HttpServletRequest request, ModelAndView mv, HttpServletResponse response, @RequestParam int smno) {
		System.out.println("스트리머" + smno);
		
		int listCount = ss.getBVodListCount(smno);
		System.out.println(smno + "의 방송 갯수(Vod) : " + listCount);

		ArrayList<BroadList> blist = ss.selectBVodList(smno);
		System.out.println(smno + "의 방송 목록(Vod) : " + blist);

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

		for(int i = 0; i < blist.size(); i++) {
			HashMap<String, Object> hmap = new HashMap<String, Object>();
			String sDate = fmt.format(blist.get(i).getStartDate());
			String eDate = fmt.format(blist.get(i).getEndDate());
			
			hmap.put("bhno", blist.get(i).getBhno());
			hmap.put("broadAddress", blist.get(i).getBroadAddress());
			hmap.put("mno", blist.get(i).getMno());
			hmap.put("nickName", blist.get(i).getNickName());
			hmap.put("startDate", sDate);
			hmap.put("endDate", eDate);
			hmap.put("bhStatus", blist.get(i).getBhStatus());
			hmap.put("countViewers", blist.get(i).getCountViewers());
			hmap.put("bcno", blist.get(i).getBcno());
			hmap.put("countRecommendation", blist.get(i).getCountRecommendation());
			hmap.put("bTitle", blist.get(i).getBTitle());
			hmap.put("bPwd", blist.get(i).getBPwd());
			hmap.put("pwdCheck", blist.get(i).getPwdCheck());
			hmap.put("bCategory", blist.get(i).getBCategory());
			hmap.put("adult", blist.get(i).getAdult());

			list.add(hmap);
		}

		mv.addObject("list", list);
		mv.setViewName("jsonView");

		return mv;
	}
	
	/**
	 * @Author : ryan
	 * @Date : 2019. 7. 16.
	 * @Comment : 스트리머 즐겨찾기
	 */
	@ResponseBody
	@RequestMapping("favoStreamer.st")
	public String favoStreamer(String mid,String streamerAddress) {
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("mid",mid);
		hmap.put("sid",streamerAddress);
		try {
			ss.favoStreamer(hmap);
			return "success";
		} catch (UpdateMemberException e) {
			return "already";
		}
	}
	
	/**
	 * Author : ryan
	 * Date : 2019. 7. 16.
	 * Comment : 좋아요
	 */
	@ResponseBody
	@RequestMapping("selectedLike.st")
	public String selectedLike(String mid,String sid) {
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("mid",mid);
		hmap.put("sid", sid);
		
		try {
			ss.selectedLike(hmap);
			return "success";
		} catch (UpdateMemberException e) {
			return "fail";
		}
	}
	
	/**
	 * Author : ryan
	 * Date : 2019. 7. 16.
	 * Comment : 방송 중 신고하기
	 */
	@ResponseBody
	@RequestMapping("selectedReport.st")
	public String selectedReport(String mid,String sid,String rType,String rTitle, String rContent) {
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("mid", mid);
		hmap.put("sid", sid);
		hmap.put("rType", rType);
		hmap.put("rTitle", rTitle);
		hmap.put("rContent", rContent);
		
		ss.selectedReport(hmap);
		
		return "success";
	}
	
}