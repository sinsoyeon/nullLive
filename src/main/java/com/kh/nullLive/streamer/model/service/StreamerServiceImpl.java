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
		int updateResult = 0;
		int insertResult = smDao.insertNP(sqlSession,streamer,amount);
		
		System.out.println("insertResult : " + insertResult);
		
		if(insertResult > 0) {
			HashMap<String, Object> hmap = new HashMap<String, Object>();
			
			hmap.put("streamer",streamer);
			hmap.put("amount", amount);
			updateResult = smDao.updateSponPoint(sqlSession, hmap);	
			System.out.println("insertNp : " + hmap);
		}
		
		return updateResult;
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
	public ArrayList<HashMap<String, Object>> selectSponList(HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return smDao.selectSponList(sqlSession,infoMap);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectSponForMeList(HashMap<String, Object> infoMap) {

		return smDao.selectSponForMeList(sqlSession,infoMap);
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
	public ArrayList<HashMap<String, Object>> selectChargeList(HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return smDao.selectChargeList(sqlSession,infoMap);
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
		
		System.out.println("hmap : " + hmap);
		
		System.out.println("infoMap : " + infoMap);
		
		int mno = (int)infoMap.get("mno");
				
		
		hmap.put("mno", mno);
		hmap.put("decno", (int)infoMap.get("decno"));
		
		System.out.println("hmap : " + hmap);
		
		updateResult += smDao.reInsertClc(sqlSession,hmap);
		
		if(updateResult > 0) {
			smDao.reInsertClc(sqlSession, hmap);
		}
		
		return updateResult;
	}

	@Override
	public int getSponCount(int mno) {
		// TODO Auto-generated method stub
		return smDao.getSponCount(sqlSession,mno);
	}

	@Override
	public int getSponForMeCount(int mno) {
		// TODO Auto-generated method stub
		return smDao.getSponForMeCount(sqlSession,mno);
	}

	@Override
	public int updatePoint(HashMap<String, Object> hmap) {
		
		
		return smDao.updatePoint(sqlSession, hmap);
	}

	@Override
	public int getChargeCount(int mno) {
		// TODO Auto-generated method stub
		return smDao.getChargeCount(sqlSession,mno);
	}

	@Override
	public HashMap<String, Object> detailClc(HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return smDao.detailClc(sqlSession,infoMap);
	}

	@Override
	public int rejectClc(HashMap<String, Object> rejectMap) {
		// TODO Auto-generated method stub
		return smDao.rejectClc(sqlSession,rejectMap);
	}

	@Override
	public int getReqClcCount(int mno) {
		// TODO Auto-generated method stub
		return smDao.getReqClcCount(sqlSession,mno);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectReqClcList(HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return smDao.selectReqClcList(sqlSession,infoMap);
	}

	@Override
	public int confirmClc(HashMap<String, Object> infoMap) {
		int updateResult =  smDao.confirmClc(sqlSession,infoMap);
		
		System.out.println("updateREsult : " + updateResult);
		int result = 0;
		if(updateResult > 0) {
			System.out.println("update 실행중 : ");
			result = smDao.updateClcPoint(sqlSession,infoMap);
			System.out.println("update 실행중 : 결가ㅗ는 ? " + result);
			
			if(result > 0 ) {
				infoMap.put("amount", infoMap.get("clc_amount"));
				result = smDao.updatePoint(sqlSession, infoMap);
				System.out.println("찐 결과 : " + result);
			}
		}
		
		return result;
	}
	
}
