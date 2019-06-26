package com.kh.nullLive.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nullLive.board.model.exception.BoardSelectListException;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.PageInfo;

@Repository
public class BoardDaoImpl implements BoardDao {
	//고객센터 FAQ 전체 게시글 수 조회
	@Override
	public int getFListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Board.selectFListCount");
	}
	
	//고객센터 FAQ 전체 게시글 조회
	@Override
	public ArrayList<Board> selectFBoardList(SqlSessionTemplate sqlSession, PageInfo pi){
		ArrayList<Board> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		//페이징 처리를 위한 클래스
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Board.selectFList", null, rowBounds);
		
		System.out.println("페이징처리된 결과 : " + list);
		
		return list;
	}

	//고객센터 FAQ 검색한 게시글 수 조회
	@Override
	public int getSearchFListCount(SqlSessionTemplate sqlSession, String condition) {
		return sqlSession.selectOne("Board.searchFListCount", condition);
	}

	//고객센터 FAQ 검색한 게시글 조회
	@Override
	public ArrayList<Board> searchFBoardList(SqlSessionTemplate sqlSession, PageInfo pi, String condition) {
		ArrayList<Board> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		//페이징 처리를 위한 클래스
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Board.searchFList", condition, rowBounds);
		
		System.out.println("페이징처리된 결과 : " + list);
		
		return list;
	}
}
