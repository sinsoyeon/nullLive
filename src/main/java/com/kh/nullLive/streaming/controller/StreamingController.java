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
import org.springframework.web.servlet.ModelAndView;

import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streaming.model.exception.EnterStreamingException;
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


	@RequestMapping("record.st")
	public String recordStraming() {
		return "streaming/recording/record";
	}

	@RequestMapping("screenSharing.st")
	public String screenSharing() {
		return "streaming/screenSharing/screenSharing";
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
		BroadHis broadHis;
		try {

			int result = ss.checkBlackList(loginUser,streamerAddress);

			PrintWriter pw = response.getWriter();

			if(result > 0) {			
				pw.println("<script>alert('해당 방송에 접근할 수 없습니다.'); window.close() </script>\n");

				pw.flush();
				pw.close();

				return "redirect:index.jsp";
			}else {
				broadHis = ss.enterStream(loginUser,streamerAddress);
				model.addAttribute("title", broadHis.getBtitle());
				model.addAttribute("bhno",broadHis.getBhno());
				model.addAttribute("mid",loginUser.getMid());
				model.addAttribute("streamerAddress",streamerAddress);	//방송 주소 찾아가기 위함

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
		ss.startStreaming(broadHis);
		model.addAttribute("title", broadHis.getBtitle());
		model.addAttribute("streamerAddress",broadHis.getStreamerId());
		model.addAttribute("broadMethod",broadMethod);
		return "streaming/streamRoom";
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
			hmap.put("streamerId", blist.get(i).getStreamerId());
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
			hmap.put("streamerId", blist.get(i).getStreamerId());
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
				hmap.put("streamerId", blist.get(i).getStreamerId());
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
				hmap.put("streamerId", blist.get(i).getStreamerId());
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
				hmap.put("streamerId", blist.get(i).getStreamerId());
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
				hmap.put("streamerId", blist.get(i).getStreamerId());
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
	
}