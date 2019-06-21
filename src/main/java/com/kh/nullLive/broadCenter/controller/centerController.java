package com.kh.nullLive.broadCenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class centerController {
	//방송기능설정 페이지로 이동(정연)
	@RequestMapping("broadSetting.st")
	public String broadSetting() {

		return "streaming/broadCenter/broadSetting";
	}

	//스트리머 메인페이지로 이동(정연)
	@RequestMapping("main.st")
	public String streamerMain() {

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

}
