package com.kh.nullLive.partner.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.partner.model.dao.PartnerDao;
import com.kh.nullLive.streamer.model.dao.StreamerDao;
import com.kh.nullLive.streamer.model.vo.Streamer;

@Service
public class PartnerServiceImpl implements PartnerService{

	@Autowired
	private PartnerDao pd;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	@Autowired
	private StreamerDao sd;
	
	/**
	 * @author : uukk
	 * @date : 2019. 7. 13.
	 * @comment : 매니저 권한 조회
	 */
	@Override
	public HashMap<String, ArrayList<String>> selectMngAuth(HashMap<String, Object> hmap) {
		HashMap<String , ArrayList<String>> authHamp = new HashMap<>();
		ArrayList<String> boardAuthList = new ArrayList<>();
		ArrayList<String> chatAuthList = new ArrayList<>();
		
		Member loginUser = (Member) hmap.get("loginUser");
		Streamer stremaer = sd.selectStreamerMno(sqlSession, loginUser.getMno());
		int sno = stremaer.getSno();
		
		hmap.put("sno", sno);
		//조회를 위한 pno
		int pno = pd.getMngPno(sqlSession, hmap);
		//게시판 권한
		String boardAuth = pd.selectMngBoardAuth(sqlSession,pno);
		//채팅방 권한
		String chatAuth = pd.selectMngChatAuth(sqlSession,pno);

		String boardAuthArr[] = new String[boardAuth.split(", ").length];
		boardAuthArr = boardAuth.split(", ");
		
		String chatAuthArr[] = new String[chatAuth.split(", ").length];
		chatAuthArr = chatAuth.split(", ");
		
		for(int i=0; i<boardAuthArr.length; i++) {
			boardAuthList.add(boardAuthArr[i]);
		}
		for(int i=0; i<chatAuthArr.length; i++) {
			chatAuthList.add(chatAuthArr[i]);
		}
		
		authHamp.put("boardAuthList", boardAuthList);
		authHamp.put("chatAuthList", chatAuthList);
		
		
		return authHamp;
	}

}
