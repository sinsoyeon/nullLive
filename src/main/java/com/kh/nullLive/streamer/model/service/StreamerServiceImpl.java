package com.kh.nullLive.streamer.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.nullLive.streamer.model.dao.StreamerDao;
import com.kh.nullLive.streamer.model.vo.Streamer;

@Controller
public class StreamerServiceImpl implements StreamerService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private StreamerDao smDao;

	@Override
	public int insertSubscribe(Streamer stremaer) {
			return smDao.insertSubscribe(sqlSession,stremaer);

	}

	@Override
	public HashMap<String, Object> selectStreamer(String streamer) {

		return smDao.selectStreamer(sqlSession,streamer);
	}

	@Override
	public int insertMnthlSbscr(Streamer streamer,int amount) {

		
		return smDao.insertMnthlSbscr(sqlSession,streamer,amount);
	}

	@Override
	public int insertNP(Streamer streamer, int amount) {
		return smDao.insertNP(sqlSession,streamer,amount);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectSubList(int mno) {
		return smDao.selectSubList(sqlSession,mno);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectForMeSubList(int mno) {
		// TODO Auto-generated method stub
		return smDao.selectForMeSubList(sqlSession,mno);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectSponList(int mno) {
		// TODO Auto-generated method stub
		return smDao.selectSponList(sqlSession,mno);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectSponForMeList(int mno) {

		return smDao.selectSponForMeList(sqlSession,mno);
	}

	@Override
	public ArrayList<HashMap<String, Object>> searchSponList(HashMap<String, Object> searchTypeMap) {
		return smDao.searchSponList(sqlSession,searchTypeMap);
	}

	@Override
	public int insertExchange(HashMap<String, Object> excMap) {
		int insertResult =  smDao.insertExchange(sqlSession,excMap);
		int updateResult = 0;
		int returnResult = 0;
		
		if(insertResult > 0) {
			updateResult = smDao.updatePoint(sqlSession,excMap);
			
			if(insertResult > 0 && updateResult > 0) {
				returnResult = 1;
			}
		}else {
			//throw 작성
		}
		
		return returnResult;
	}

	@Override
	public ArrayList<HashMap<String,Object>> selectExcList(int mno) {
		// TODO Auto-generated method stub
		return(ArrayList) smDao.selectExcList(sqlSession,mno);
	}

	@Override
	public HashMap<String, Object> selectOneExc(HashMap<String, Object> userInfoMap) {
		// TODO Auto-generated method stub
		return smDao.selectOneExc(sqlSession,userInfoMap);
	}

	@Override
	public int cancelExchange(HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return smDao.cancelExchange(sqlSession,infoMap);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectChargeList(int mno) {
		// TODO Auto-generated method stub
		return smDao.selectChargeList(sqlSession,mno);
	}

	@Override
	public ArrayList<HashMap<String, Object>> ageChartData(int mno) {
		
		HashMap<String, Object>  myMap = smDao.selectAllFemale(sqlSession, mno);
		
		
		
		ArrayList<HashMap<String, Object>> returList= new ArrayList<HashMap<String,Object>>();
		
		returList.add(myMap);
		
		return returList;
	}

}
