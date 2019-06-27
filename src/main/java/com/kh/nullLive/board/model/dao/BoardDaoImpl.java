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
	public int getSearchFListCount(SqlSessionTemplate sqlSession, int condition) {
		String searchCondition = "";
		
		switch(condition) {
			case 1 : return sqlSession.selectOne("Board.selectFListCount");
			case 2 : searchCondition = "회원정보"; break;
			case 3 : searchCondition = "방송/시청하기"; break;
			case 4 : searchCondition = "선물/후원"; break;
			case 5 : searchCondition = "결제"; break;
			case 6 : searchCondition = "기타"; break;
		}
		
		return sqlSession.selectOne("Board.searchFListCount", searchCondition);
	}

	//고객센터 FAQ 검색한 게시글 수 조회
	@Override
	public ArrayList<Board> searchFBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int condition) {
		ArrayList<Board> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		//페이징 처리를 위한 클래스
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		String searchCondition = "";
		
		switch(condition) {
			case 1 : return (ArrayList) sqlSession.selectList("Board.selectFList", null, rowBounds);
			case 2 : searchCondition = "회원정보"; break;
			case 3 : searchCondition = "방송/시청하기"; break;
			case 4 : searchCondition = "선물/후원"; break;
			case 5 : searchCondition = "결제"; break;
			case 6 : searchCondition = "기타"; break;
		}
		
		list = (ArrayList) sqlSession.selectList("Board.searchFList", searchCondition, rowBounds);
		
		System.out.println("페이징처리된 결과 : " + list);
		
		return list;
	}

	//고객센터 공지사항 전체 게시글 수 조회
	@Override
	public int getNListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Board.selectNListCount");
	}

	//고객센터 공지사항 전체 게시글 조회
	@Override
	public ArrayList<Board> selectNBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Board> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		//페이징 처리를 위한 클래스
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Board.selectNList", null, rowBounds);
		
		System.out.println("페이징처리된 결과 : " + list);
		
		return list;
	}

	//고객센터 FAQ 상세 조회
	@Override
	public ArrayList<Board> selectOneFBoard(SqlSessionTemplate sqlSession, int num) {
		ArrayList<Board> list = null;
		
		list = (ArrayList) sqlSession.selectList("Board.selectOneF", num);
		
		System.out.println("상세조회 결과 : " + list);
		
		return list;
	}

	//고객센터 공지사항 상세 조회
	@Override
	public ArrayList<Board> selectOneNBoard(SqlSessionTemplate sqlSession, int num) {
		ArrayList<Board> list = null;
		
		list = (ArrayList) sqlSession.selectList("Board.selectOneN", num);
		
		System.out.println("상세조회 결과 : " + list);
		
		return list;
	}
}
