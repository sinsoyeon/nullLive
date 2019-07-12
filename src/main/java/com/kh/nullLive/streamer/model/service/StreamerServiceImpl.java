package com.kh.nullLive.streamer.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
	public ArrayList<HashMap<String,Object>> selectExcList(HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return(ArrayList) smDao.selectExcList(sqlSession,infoMap);
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
		
		ArrayList<HashMap<String,Object>>  ageChartData = smDao.selectAllFemale(sqlSession, mno);
		
		
		return ageChartData;
	}

	@Override
	public ArrayList<HashMap<String, Object>> sponAgeChart(int mno) {
		return smDao.sponAgeChart(sqlSession,mno);
	}

	@Override
	public ArrayList<HashMap<String, Object>> recomList(HashMap<String,Object> recomInfoMap) {
		// TODO Auto-generated method stub
		return smDao.recomList(sqlSession,recomInfoMap);
	}

	@Override
	public HashMap<String,Object> todayRecom(int mno) {
		// TODO Auto-generated method stub
		return smDao.todayRecom(sqlSession,mno);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectAllChart(int mno) {
		// TODO Auto-generated method stub
		return smDao.selectAllChart(sqlSession,mno);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectAllSubChart(int mno) {
		// TODO Auto-generated method stub
		return smDao.selectAllSubChart(sqlSession,mno);
	}

	@Override
	public int insertBlackList(HashMap<String, Object> infoMap) {
		return smDao.insertBlackList(sqlSession,infoMap);
	}

	@Override
	public int deleteAllBlackList(int mno) {
		// TODO Auto-generated method stub
		return smDao.deleteAllBlackList(sqlSession,mno);
	}

	@Override
	public ArrayList<HashMap<String, Object>> searchBlackList(HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return smDao.searchBlackList(sqlSession,infoMap);
	}

	
	 @Override 
	 public int mutipleDeleteBlack(HashMap<String, Object> infoMap) {
		 
		 int result=0;
		  
		  
		 for (int i = 0; i < ((List<String>)infoMap.get("checkList")).size(); i++) {
			 HashMap<String, Object> temp  = new HashMap<String, Object>();
			 
			 temp.put("mno", infoMap.get("mno"));
			 temp.put("blno", Integer.parseInt(((List<String>)infoMap.get("checkList")).get(i)));
			 
			 result += smDao.mutipleDeleteBlack(sqlSession,temp);	
			 
			 System.out.println(result);
		}
		  
		  
		 return result; 
	 }

	@Override
	public int getCulCount(int mno) {
		// TODO Auto-generated method stub
		return smDao.getCulCount(sqlSession,mno);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectClcList(HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return smDao.selectClcList(sqlSession,infoMap);
	}

	@Override
	public int getExcCount(int mno) {
		// TODO Auto-generated method stub
		return smDao.getExcCount(sqlSession,mno);
	}

	@Override
	public HashMap<String, Object> selectOneClc(HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return smDao.selectOneClc(sqlSession,infoMap);
	}

	@Override
	public int reClc(HashMap<String, Object> infoMap) {
		int updateResult = smDao.reClc(sqlSession,infoMap);
		
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		hmap = smDao.getInsertData(sqlSession,infoMap);
		
		hmap.put("mno", infoMap.get("mno"));
		hmap.put("decno", infoMap.get("decno"));
		
		int insertResult = smDao.reInsertClc(sqlSession,hmap);
		
		return updateResult;
	}
	
}
