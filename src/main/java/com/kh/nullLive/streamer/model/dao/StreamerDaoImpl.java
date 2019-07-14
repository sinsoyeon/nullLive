package com.kh.nullLive.streamer.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.common.Pagination;
import com.kh.nullLive.streamer.model.vo.Streamer;

@Repository
public class StreamerDaoImpl implements StreamerDao {
	
	//스트리머 pk 조회
	@Override
	public HashMap<String, Object> selectStreamer(SqlSessionTemplate sqlSession, String streamer) {
		
		return sqlSession.selectOne("Streamer.selectStreamer",streamer);
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
		
		System.out.println("npMap : " + npMap);
		System.out.println("dao 출력중 : " + sqlSession.insert("Streamer.insertNP",npMap));
		
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
	public ArrayList<HashMap<String, Object>> selectSponList(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap) {
		int mno = (int)infoMap.get("mno");
		PageInfo pi = (PageInfo)infoMap.get("pi");
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("Streamer.selectSponList",mno,rowBounds);
	}

	//나를 후원한 리스트 조회 (소연)
	@Override
	public ArrayList<HashMap<String, Object>> selectSponForMeList(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap) {
		int mno = (int)infoMap.get("mno");
		PageInfo pi = (PageInfo)infoMap.get("pi");
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getLimit());
		
		
		return (ArrayList)sqlSession.selectList("Streamer.selectSponForMe",mno,rowBounds);
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
		System.out.println("excMap : " + excMap);
		return sqlSession.update("Streamer.updatePoint", excMap);
	}


	//환전 신청 내역 조회 (소연)
	@Override
	public ArrayList<HashMap<String,Object>> selectExcList(SqlSessionTemplate sqlSession,HashMap<String, Object> infoMap) {
		int mno = (int)infoMap.get("mno");
		PageInfo pi = (PageInfo)infoMap.get("pi");
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("Streamer.selectExcList", mno,rowBounds);
	}


	//환전 신청 상세 조회 (소연)
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
  
	//환전 신청 취소 (소연)
	@Override
	public int cancelExchange(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return sqlSession.delete("Streamer.cancelExc", infoMap);
	}

	
	//포인트 충전 내역 조회
	@Override
	public ArrayList<HashMap<String, Object>> selectChargeList(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap) {
		int mno = (int)infoMap.get("mno");
		PageInfo pi = (PageInfo)infoMap.get("pi");
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getLimit());
		
		
		
		return (ArrayList)sqlSession.selectList("Streamer.selectChargeList", infoMap,rowBounds);
	}

	// 나이와 성별 구독 통계 데이터
	@Override
	public ArrayList<HashMap<String,Object>> selectAllFemale(SqlSessionTemplate sqlSession, int mno) {
		
		return (ArrayList)sqlSession.selectList("Streamer.selectAgeData",mno);
	}

	// 나이와 성별 후원 통계 데이터
	@Override
	public ArrayList<HashMap<String, Object>> sponAgeChart(SqlSessionTemplate sqlSession, int mno) {
		return (ArrayList)sqlSession.selectList("Streamer.selectSponAgeData",mno);
	}

	//월별 / 주간 추천 데이터 (동적쿼리 사용) 
	@Override
	public ArrayList<HashMap<String, Object>> recomList(SqlSessionTemplate sqlSession, HashMap<String, Object> recomInfoMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Streamer.recomList",recomInfoMap);
	}

	//오늘과 어제의 추천 수 비교 통계 데이터(소연)
	@Override
	public HashMap<String,Object> todayRecom(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Streamer.todayRecom",mno);
	}

	
	//최근 6개월 통계(소연)
	@Override
	public ArrayList<HashMap<String, Object>> selectAllChart(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Streamer.selectAllChart", mno);
	}

	//최근 6개월 통계(소연)
	@Override
	public ArrayList<HashMap<String, Object>> selectAllSubChart(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Streamer.selectAllSubChart", mno);
	}

	//블랙리스트 추가 (소연)	
	@Override
	public int insertBlackList(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Streamer.insertBlackList",infoMap);
	}

	//블랙리스트 전체 삭제 (소연)
	@Override
	public int deleteAllBlackList(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return sqlSession.update("Streamer.deleteAllBlackList",mno);
	}

	@Override
	public ArrayList<HashMap<String, Object>> searchBlackList(SqlSessionTemplate sqlSession,HashMap<String, Object> infoMap) {
		return (ArrayList)sqlSession.selectList("Streamer.searchBlackList", infoMap);
	}

	@Override
	public int mutipleDeleteBlack(SqlSessionTemplate sqlSession, HashMap<String, Object> temp) {
		// TODO Auto-generated method stub
		return sqlSession.update("Streamer.mutipleDeleteBlack",temp);
	}

	@Override
	public int getCulCount(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Streamer.getCulCount",mno);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectClcList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		int mno = (int)infoMap.get("mno");
		PageInfo pi = (PageInfo)infoMap.get("pi");
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getLimit());
		
		
		
		return (ArrayList)sqlSession.selectList("Streamer.clcList",mno,rowBounds);
	}

	@Override
	public int getExcCount(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Streamer.getExcCount",mno);
	}

	@Override
	public HashMap<String, Object> selectOneClc(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Streamer.selecOneClc",infoMap);
	}

	@Override
	public int reClc(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return sqlSession.update("Streamer.reClc", infoMap);
	}

	@Override
	public int reInsertClc(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap) {	
		System.out.println("infoMap : " + infoMap);
		return sqlSession.insert("Streamer.reInsertClc",infoMap);
	}

	@Override
	public HashMap<String, Object> getInsertData(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Streamer.getInsertData", infoMap);
	}

	@Override
	public int getSponCount(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Streamer.getSponCount",mno);
	}

	@Override
	public int getSponForMeCount(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("Streamer.getSponForMeCount",mno);
	}

	@Override
	public int updateSponPoint(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		// TODO Auto-generated method stub
		System.out.println("hamp : " + hmap);
		
		return sqlSession.update("Streamer.updateSponPoint",hmap);
	}

	@Override
	public int getChargeCount(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Streamer.getChargeCount",mno);
	}

	@Override
	public HashMap<String, Object> detailClc(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Streamer.detailClc",infoMap);
	}

	@Override
	public int rejectClc(SqlSessionTemplate sqlSession, HashMap<String, Object> rejectMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Streamer.rejectClc",rejectMap);
	}

	@Override
	public int getReqClcCount(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Streamer.getReqClcCount",mno);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectReqClcList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> infoMap) {
		int mno = (int)infoMap.get("mno");
		PageInfo pi = (PageInfo)infoMap.get("pi");
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("Streamer.selectReqClcList", mno,rowBounds);
	}

	@Override
	public int confirmClc(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return sqlSession.update("Streamer.confirmClc", infoMap);
	}

	@Override
	public int updateClcPoint(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return sqlSession.update("Streamer.updateClcPoint",infoMap);
	}


	
}
