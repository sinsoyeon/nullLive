package com.kh.nullLive.streamer.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nullLive.streamer.model.vo.Streamer;

@Repository
public class StreamerDaoImpl implements StreamerDao {

	@Override
	public int selectStreamer(SqlSessionTemplate sqlSession, String streamer) {
		int sno = 0;
		String temp = sqlSession.selectOne("Streamer.selectStreamer",streamer);
		if(temp!=null) {
			sno = Integer.parseInt(temp);
		}
		
		return sno;
	}

	
	
	 //정기 구독자용 메소드 (소연)
	@Override
	public int insertSubscribe(SqlSessionTemplate sqlSession, Streamer stremaer) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Streamer.insertSub", stremaer);
	}

	
	 //장기 구독자용 메소드 (소연)
	@Override
	public int insertMnthlSbscr(SqlSessionTemplate sqlSession, Streamer streamer,int amount) {
		HashMap<String, Object> sbMap = new HashMap<String, Object>();
		sbMap.put("streamer", streamer);
		sbMap.put("amount", amount);		
		return sqlSession.insert("Streamer.insertMnthlSbscr",sbMap);
	}


	//후원 받으면 NullPoint 충전(소연)
	@Override
	public int insertNP(SqlSessionTemplate sqlSession, Streamer streamer, int amount) {
		HashMap<String,Object> npMap = new HashMap<String, Object>();
		npMap.put("streamer", streamer);
		npMap.put("amount", amount);
		
		return sqlSession.insert("Streamer.insertNP",npMap);
	}


	//내가 구독한 리스트 조회 (소연)
	@Override
	public ArrayList<HashMap<String, Object>> selectSubList(SqlSessionTemplate sqlSession, int mno) {

		return (ArrayList)sqlSession.selectList("Streamer.selectSubList", mno);
	}


	//나를 구독한 리스트 조회 (소연)
	@Override
	public ArrayList<HashMap<String, Object>> selectForMeSubList(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return  (ArrayList)sqlSession.selectList("Streamer.selectForMeSub", mno);
	}

	//내가 후원한 리스트 조회 (소연)
	@Override
	public ArrayList<HashMap<String, Object>> selectSponList(SqlSessionTemplate sqlSession, int mno) {
	
		return (ArrayList)sqlSession.selectList("Streamer.selectSponList",mno);
	}

	//나를 후원한 리스트 조회 (소연)
	@Override
	public ArrayList<HashMap<String, Object>> selectSponForMeList(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Streamer.selectSponForMe",mno);
	}

	//조건 검색에 따른 후원자 검색 (소연)
	@Override
	public ArrayList<HashMap<String, Object>> searchSponList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchTypeMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Streamer.searchSponList", searchTypeMap);
	}


	//환전 신청 (소연)
	@Override
	public int insertExchange(SqlSessionTemplate sqlSession, HashMap<String, Object> excMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Streamer.insertExchange", excMap);
	}


	//환전 신청 후 보유 포인트 차감 (소연)
	@Override
	public int updatePoint(SqlSessionTemplate sqlSession, HashMap<String, Object> excMap) {	
		return sqlSession.update("Streamer.updatePoint", excMap);
	}


	//환전 신청 내역 조회 (소연)
	@Override
	public ArrayList<HashMap<String,Object>> selectExcList(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Streamer.selectExcList", mno);
	}



	@Override
	public HashMap<String, Object> selectOneExc(SqlSessionTemplate sqlSession, HashMap<String, Object> userInfoMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Streamer.selectOneExc", userInfoMap);
	}



	/**
	 * @author : uukk
	 * @date : 2019. 7. 3.
	 * @comment : 스트리머 mno로 조회
	 */
	@Override
	public Streamer selectStreamerMno(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("Streamer.selectStreamerMno",mno);
	}
	
}
