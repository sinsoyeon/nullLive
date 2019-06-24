package com.kh.nullLive.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.nullLive.board.model.dao.JobBoardDao;
import com.kh.nullLive.board.model.exception.SelectOneBoardException;
import com.kh.nullLive.board.model.vo.Board;

@Service
public class JobBoardServiceImpl implements JobBoardService{

	@Autowired
	private JobBoardDao jbd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 24.
	 * @comment : 구인구직 공지사항 목록조회
	 */
	@Override
	public ArrayList<Board> selectListJobNotice() {
		return jbd.selectListJobNotice(sqlSession);
	}

	/**
	 * @author : uukk
	 * @throws SelectOneBoardException 
	 * @date : 2019. 6. 24.
	 * @comment : 구인구직 공지사항 상세조회
	 */
	@Override
	public Board selectOneJobNotice(int bno) throws SelectOneBoardException {
		Board board = null;
		board = jbd.selectOneJobNotice(sqlSession, bno); 
		
		if(board == null) {
			throw new SelectOneBoardException("게시글 상세보기 실패");
		}
		
		return board;
	}

	@Override
	public int insertJobNotice(Board board) {
		return jbd.insertJobNotice(sqlSession,board);
	}

	@Override
	public void updateJobNotice() {
		jbd.updateJobNotice();
	}

	@Override
	public void deleteJobNotice() {
		jbd.deleteJobNotice();
	}

	@Override
	public void selectListJobBoard() {
		jbd.selectListJobBoard();
	}

	@Override
	public void selectListJobMyBoard() {
		jbd.selectListJobMyBoard();
	}

	@Override
	public void insertJobBoard() {
		jbd.insertJobBoard();
	}

	@Override
	public void searchJobBoard() {
		jbd.searchJobBoard();
	}

	@Override
	public void selectOneJobBoard() {
		jbd.selectOneJobBoard();
	}

	@Override
	public void SelectListApply() {
		jbd.SelectListApply();
	}

	@Override
	public void updateJobBoard() {
		jbd.updateJobBoard();
	}

	@Override
	public void insertApply() {
		jbd.insertApply();
	}

	@Override
	public void insertContract() {
		jbd.insertContract();
	}

	@Override
	public void insertJobBoardReport() {
		jbd.insertJobBoardReport();
	}

	@Override
	public void insertJobBoardNote() {
		jbd.insertJobBoardNote();
	}

}
