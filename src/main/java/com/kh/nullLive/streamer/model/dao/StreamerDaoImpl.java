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



	@Override
	public int insertNP(SqlSessionTemplate sqlSession, Streamer streamer, int amount) {
		HashMap<String,Object> npMap = new HashMap<String, Object>();
		npMap.put("streamer", streamer);
		npMap.put("amount", amount);
		
		return sqlSession.insert("Streamer.insertNP",npMap);
	}



	@Override
	public ArrayList<HashMap<String, Object>> selectSubList(SqlSessionTemplate sqlSession, int mno) {

		return (ArrayList)sqlSession.selectList("Streamer.selectSubList", mno);
	}



	@Override
	public ArrayList<HashMap<String, Object>> selectForMeSubList(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return  (ArrayList)sqlSession.selectList("Streamer.selectForMeSub", mno);
	}


	@Override
	public ArrayList<HashMap<String, Object>> selectSponList(SqlSessionTemplate sqlSession, int mno) {
	
		return (ArrayList)sqlSession.selectList("Streamer.selectSponList",mno);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectSponForMeList(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Streamer.selectSponForMe",mno);
	}

	@Override
	public ArrayList<HashMap<String, Object>> searchSponList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchTypeMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Streamer.searchSponList", searchTypeMap);
	}
	
}
