package com.kh.nullLive.streamer.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.nullLive.streamer.model.vo.Streamer;

public interface StreamerService {


	HashMap<String, Object> selectStreamer(String streamer);

	int insertSubscribe(Streamer streamer);

	int insertMnthlSbscr(Streamer streamer,int amount);

	int insertNP(Streamer streamer, int amount);

	ArrayList<HashMap<String, Object>> selectSubList(int mno);

	ArrayList<HashMap<String, Object>> selectForMeSubList(int mno);

	ArrayList<HashMap<String, Object>> selectSponList(int mno);

	ArrayList<HashMap<String, Object>> selectSponForMeList(int mno);

	ArrayList<HashMap<String, Object>> searchSponList(HashMap<String, Object> searchTypeMap);

	int insertExchange(HashMap<String, Object> excMap);

	ArrayList<HashMap<String,Object>> selectExcList(HashMap<String, Object> infoMap);

	HashMap<String, Object> selectOneExc(HashMap<String, Object> userInfoMap);

	int cancelExchange(HashMap<String, Object> infoMap);

	ArrayList<HashMap<String, Object>> selectChargeList(int mno);

	ArrayList<HashMap<String, Object>> ageChartData(int mno);

	ArrayList<HashMap<String, Object>> sponAgeChart(int mno);

	ArrayList<HashMap<String, Object>> recomList(HashMap<String, Object> recomInfoMap);

	HashMap<String,Object> todayRecom(int mno);

	ArrayList<HashMap<String, Object>> selectAllChart(int mno);

	ArrayList<HashMap<String, Object>> selectAllSubChart(int mno);

	int insertBlackList(HashMap<String, Object> infoMap);

	int deleteAllBlackList(int mno);

	ArrayList<HashMap<String, Object>> searchBlackList(HashMap<String, Object> infoMap);

	int mutipleDeleteBlack(HashMap<String, Object> infoMap);

	int getCulCount(int mno);

	ArrayList<HashMap<String, Object>> selectClcList(HashMap<String, Object> infoMap);

	int getExcCount(int mno);

	HashMap<String, Object> selectOneClc(HashMap<String, Object> infoMap);


}
