package com.kh.nullLive.streaming.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.common.Pagination;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streaming.model.exception.EnterStreamingException;
import com.kh.nullLive.streaming.model.service.StreamingService;
import com.kh.nullLive.streaming.model.vo.BroadHis;

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
		//
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
	
	/**
	 * @author : eon
	 * @date : 2019. 7. 11.
	 * @comment : 메인페이지 Hot Live 방송 리스트 조회용 메소드
	 */
	@RequestMapping("hotLiveList.st")
	public ResponseEntity<HashMap<String, Object>> selectNList(HttpServletRequest request) {
		//오늘의 Hot Live 방송 갯수 가져옴
		int listCount = ss.getHotLiveListCount();

		HashMap<String, Object> map = new HashMap<String, Object>();

		ArrayList<HashMap<String, Object>> hmap;
		hmap = ss.selectHotLiveList();

		map.put("hmap", hmap);

		return new ResponseEntity<HashMap<String, Object>>(map, HttpStatus.OK);
	}
}
