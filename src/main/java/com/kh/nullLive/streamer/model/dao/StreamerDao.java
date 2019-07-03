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

	ArrayList<HashMap<String, Object>> selectSubList(SqlSessionTemplate sqlSession, int mno);

	ArrayList<HashMap<String, Object>> selectForMeSubList(SqlSessionTemplate sqlSession, int mno);

	ArrayList<HashMap<String, Object>> selectSponList(SqlSessionTemplate sqlSession, int mno);

	ArrayList<HashMap<String, Object>> selectSponForMeList(SqlSessionTemplate sqlSession, int mno);

	ArrayList<HashMap<String, Object>> searchSponList(SqlSessionTemplate sqlSession,HashMap<String, Object> searchTypeMap);

	int insertExchange(SqlSessionTemplate sqlSession, HashMap<String, Object> excMap);

	int updatePoint(SqlSessionTemplate sqlSession, HashMap<String, Object> excMap);

	ArrayList<HashMap<String,Object>> selectExcList(SqlSessionTemplate sqlSession, int mno);

	HashMap<String, Object> selectOneExc(SqlSessionTemplate sqlSession, HashMap<String, Object> userInfoMap);

	int cancelExchange(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

	ArrayList<HashMap<String, Object>> selectChargeList(SqlSessionTemplate sqlSession, int mno);

	HashMap<String,Object> selectAllFemale(SqlSessionTemplate sqlSession, int mno);

}
