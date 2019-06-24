package com.kh.nullLive.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nullLive.board.model.vo.Board;

@Repository
public class JobBoardDaoImpl implements JobBoardDao {

	/**
	 * @author : uukk
	 * @date : 2019. 6. 24.
	 * @comment : 구인구직 공지사항 목록조회
	 */
	@Override
	public ArrayList<Board> selectListJobNotice(SqlSessionTemplate sqlSession) {
		ArrayList<Board> list = (ArrayList) sqlSession.selectList("Board.selectListJobNotice");
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

	
	
}
