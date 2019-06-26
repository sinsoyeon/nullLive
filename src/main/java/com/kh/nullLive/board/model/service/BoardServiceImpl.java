package com.kh.nullLive.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.nullLive.board.model.dao.BoardDao;
import com.kh.nullLive.board.model.exception.BoardSelectListException;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao bd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager transactionManager;

	
	//고객센터 FAQ 전체 게시글 수 조회
	@Override
	public int getFListCount() {
		return bd.getFListCount(sqlSession);
	}

	//고객센터 FAQ 전체 게시글 조회
	@Override
	public ArrayList<Board> selectFBoardList(PageInfo pi){
		return bd.selectFBoardList(sqlSession, pi);
	}

	//고객센터 FAQ 검색한 게시글 수 조회
	@Override
	public int getSearchFListCount(int condition) {
		
		String searchCondition = "";
		
		switch(condition) {
		case 2 : searchCondition = "회원정보"; break;
		case 3 : searchCondition = "방송/시청하기"; break;
		case 4 : searchCondition = "선물/후원"; break;
		case 5 : searchCondition = "결제"; break;
		case 6 : searchCondition = "기타"; break;
		}
		
		return bd.getSearchFListCount(sqlSession, searchCondition);
	}

	//고객센터 FAQ 검색한 게시글 조회
	@Override
	public ArrayList<Board> searchFBoardList(PageInfo pi, int condition) {
		String searchCondition = "";
		
		switch(condition) {
		case 2 : searchCondition = "회원정보"; break;
		case 3 : searchCondition = "방송/시청하기"; break;
		case 4 : searchCondition = "선물/후원"; break;
		case 5 : searchCondition = "결제"; break;
		case 6 : searchCondition = "기타"; break;
		}
		
		return bd.searchFBoardList(sqlSession, pi, searchCondition);
	}
	
}
