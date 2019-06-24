package com.kh.nullLive.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.PageInfo;

@Repository
public class JobBoardDaoImpl implements JobBoardDao {

	/**
	 * @author : uukk
	 * @date : 2019. 6. 24.
	 * @comment : 구인구직 공지사항 목록조회
	 */
	@Override
	public ArrayList<Board> selectListJobNotice(SqlSessionTemplate sqlSession,PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getLimit();
		
		//페이징 처리를 위한 클래스
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<Board> list = (ArrayList) sqlSession.selectList("Board.selectListJobNotice",null,rowBounds);
		return list;
	}

	/**
	 * @author : uukk
	 * @date : 2019. 6. 24.
	 * @comment : 구인구직 공지사항 상세조회
	 */
	@Override
	public Board selectOneJobNotice(SqlSessionTemplate sqlSession, int bno) {
		Board board = sqlSession.selectOne("Board.selectOneJobNotice",bno);
		return board;
	}

	@Override
	public void updateJobNotice() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteJobNotice() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectListJobBoard() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectListJobMyBoard() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertJobBoard() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void searchJobBoard() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectOneJobBoard() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void SelectListApply() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateJobBoard() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertApply() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertContract() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertJobBoardReport() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertJobBoardNote() {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @author : uukk
	 * @date : 2019. 6. 24.
	 * @comment : 공지사항 입력 메소드
	 */
	@Override
	public int insertJobNotice(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.insert("Board.insertJobNotice",board);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 6. 24.
	 * @comment : 조회수 업데이트 메소드
	 */
	@Override
	public int updateBoardCount(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("Board.updateBoardCount",bno);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 6. 24.
	 * @comment : 리스트 갯수 조회용
	 */
	@Override
	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Board.selectListCount");
	}

	
	
}
