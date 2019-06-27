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
		return bd.getSearchFListCount(sqlSession, condition);	
	}

	//고객센터 FAQ 검색한 게시글 조회
	@Override
	public ArrayList<Board> searchFBoardList(PageInfo pi, int condition) {
		return bd.searchFBoardList(sqlSession, pi, condition);					
	}

	//고객센터 공지사항 전체 게시글 수 조회
	@Override
	public int getNListCount() {
		return bd.getNListCount(sqlSession);
	}

	//고객센터 공지사항 전체 게시글 조회
	@Override
	public ArrayList<Board> selectNBoardList(PageInfo pi) {
		return bd.selectNBoardList(sqlSession, pi);
	}

	//고객센터 FAQ 상세 조회
	@Override
	public ArrayList<Board> selectOneFBoard(int num) {
		return bd.selectOneFBoard(sqlSession, num);
	}

	//고객센터 공지사항 상세 조회
	@Override
	public ArrayList<Board> selectOneNBoard(int num) {
		return bd.selectOneNBoard(sqlSession, num);
	}

	//고객센터 FAQ 조회수 증가
	@Override
	public int updateFBoardCount(int num) {
		return bd.updateFBoardCount(sqlSession, num);
	}

	//고객센터 공지사항 조회수 증가
	@Override
	public int updateNBoardCount(int num) {
		return bd.updateNBoardCount(sqlSession, num);
	}
	
}
