package com.kh.nullLive.streamer.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.nullLive.streamer.model.vo.Streamer;

public interface StreamerService {


	int selectStreamer(String streamer);

	int insertSubscribe(Streamer streamer);

	int insertMnthlSbscr(Streamer streamer,int amount);

	int insertNP(Streamer streamer, int amount);

	ArrayList<HashMap<String, Object>> selectSubList(int mno);

	ArrayList<HashMap<String, Object>> selectForMeSubList(int mno);

	ArrayList<HashMap<String, Object>> selectSponList(int mno);

	ArrayList<HashMap<String, Object>> selectSponForMeList(int mno);

	ArrayList<HashMap<String, Object>> searchSponList(HashMap<String, Object> searchTypeMap);

	int insertExchange(HashMap<String, Object> excMap);

	ArrayList<HashMap<String,Object>> selectExcList(int mno);

	HashMap<String, Object> selectOneExc(HashMap<String, Object> userInfoMap);

}
