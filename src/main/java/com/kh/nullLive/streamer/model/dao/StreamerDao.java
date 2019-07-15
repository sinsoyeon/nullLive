package com.kh.nullLive.streamer.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.streamer.model.vo.Streamer;

public interface StreamerDao {


	HashMap<String, Object> selectStreamer(SqlSessionTemplate sqlSession, String streamer);

	int insertSubscribe(SqlSessionTemplate sqlSession, Streamer stremaer);

	int insertMnthlSbscr(SqlSessionTemplate sqlSession, Streamer streamer,int amount);

	int insertNP(SqlSessionTemplate sqlSession, Streamer streamer, int amount);

	ArrayList<HashMap<String, Object>> selectSubList(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

	ArrayList<HashMap<String, Object>> selectForMeSubList(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

	ArrayList<HashMap<String, Object>> selectSponList(SqlSessionTemplate sqlSession,HashMap<String, Object> infoMap);

	ArrayList<HashMap<String, Object>> selectSponForMeList(SqlSessionTemplate sqlSession,HashMap<String, Object> infoMap);

	ArrayList<HashMap<String, Object>> searchSponList(SqlSessionTemplate sqlSession,HashMap<String, Object> searchTypeMap);

	int insertExchange(SqlSessionTemplate sqlSession, HashMap<String, Object> excMap);

	int updatePoint(SqlSessionTemplate sqlSession, HashMap<String, Object> excMap);

	ArrayList<HashMap<String,Object>> selectExcList(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

	HashMap<String, Object> selectOneExc(SqlSessionTemplate sqlSession, HashMap<String, Object> userInfoMap);

	int cancelExchange(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);
	
	ArrayList<HashMap<String, Object>> selectChargeList(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);
	
	ArrayList<HashMap<String,Object>> selectAllFemale(SqlSessionTemplate sqlSession, int mno);
	
	ArrayList<HashMap<String, Object>> sponAgeChart(SqlSessionTemplate sqlSession, int mno);
	/**
	 * @author : uukk
	 * @date : 2019. 7. 3.
	 * @comment : 스트리머 mno로 조회
	 */
	Streamer selectStreamerMno(SqlSessionTemplate sqlSession, int mno);

	ArrayList<HashMap<String, Object>> recomList(SqlSessionTemplate sqlSession,HashMap<String, Object> recomInfoMap);

	HashMap<String,Object> todayRecom(SqlSessionTemplate sqlSession, int mno);

	ArrayList<HashMap<String, Object>> selectAllChart(SqlSessionTemplate sqlSession, int mno);

	ArrayList<HashMap<String, Object>> selectAllSubChart(SqlSessionTemplate sqlSession, int mno);

	int insertBlackList(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

	int deleteAllBlackList(SqlSessionTemplate sqlSession, int mno);

	ArrayList<HashMap<String, Object>> searchBlackList(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

	int mutipleDeleteBlack(SqlSessionTemplate sqlSession, HashMap<String, Object> temp);

	int getCulCount(SqlSessionTemplate sqlSession, int mno);

	ArrayList<HashMap<String, Object>> selectClcList(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

	int getExcCount(SqlSessionTemplate sqlSession, int mno);

	HashMap<String, Object> selectOneClc(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

	int reClc(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

	int reInsertClc(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

	HashMap<String, Object> getInsertData(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

	int getSponCount(SqlSessionTemplate sqlSession, int mno);

	int getSponForMeCount(SqlSessionTemplate sqlSession, int mno);

	int updateSponPoint(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	int getChargeCount(SqlSessionTemplate sqlSession, int mno);

	HashMap<String, Object> detailClc(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

	int rejectClc(SqlSessionTemplate sqlSession, HashMap<String, Object> rejectMap);

	int getReqClcCount(SqlSessionTemplate sqlSession, int mno);

	ArrayList<HashMap<String, Object>> selectReqClcList(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

	int confirmClc(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

	int updateClcPoint(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

	int selectMyConCount(SqlSessionTemplate sqlSession, int mno);

	 ArrayList<HashMap<String, Object>> selectMyConList(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

	int checkBank(SqlSessionTemplate sqlSession, int mno);

	int insertBankCert(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

	int getSubCount(SqlSessionTemplate sqlSession, int mno);

	int getSubMeCount(SqlSessionTemplate sqlSession, int mno);




}
