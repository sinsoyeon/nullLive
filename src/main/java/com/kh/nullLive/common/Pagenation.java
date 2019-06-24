package com.kh.nullLive.common;

import org.springframework.stereotype.Component;

import com.kh.nullLive.board.model.vo.PageInfo;

@Component
public class Pagenation {
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		PageInfo pi = null;
		
		int limit = 10;
		//하단에 보여질 버튼 갯수
		int buttonCount = 10;
		int maxPage;
		int startPage;
		int endPage;
		
		//총 페이지 수 계산
		//ex) 123개면 13페이지 필요함
		maxPage = (int)((double)listCount / limit + 0.9);
		
		//현재 페이지에 보여질 시작 페이지 수
		//아래쪽에 페이지 수가 10개씩 보여지게 한다면
		//1, 11, 21, 31,....
		startPage = (((int)((double)currentPage / buttonCount + 0.9)) - 1) * buttonCount + 1;
		
		endPage = startPage + buttonCount - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		
		return pi;
	}
}
