package com.kh.nullLive.common.paging.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.nullLive.board.controller.JobBoardController;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.common.paging.model.service.PagingService;
import com.kh.nullLive.common.paging.model.vo.PagingVo;

@Controller
public class PagingController {
	private Logger logger = LoggerFactory.getLogger(JobBoardController.class);
	@Autowired
	private PagingService ps;
	/**
	 * @author : uukk
	 * @date : 2019. 6. 25.
	 * @comment : 페이징 모듈화 테스트중
	 */
	@RequestMapping("paging.pg")
	public String paging(Model model, PagingVo paging) {
		
		logger.info("paging : " + paging);
		ArrayList<Board> lists = ps.selectPaging(paging);
		paging.setTotal(ps.selectTotalPaging());
		model.addAttribute("list", lists);
        model.addAttribute("pi", paging);
		return "board/job/jobNoticeList";
	}
}