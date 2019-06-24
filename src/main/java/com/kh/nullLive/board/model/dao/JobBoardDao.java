package com.kh.nullLive.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.board.model.vo.Board;

public interface JobBoardDao {

	ArrayList<Board> selectListJobNotice(SqlSessionTemplate sqlSession);

	Board selectOneJobNotice(SqlSessionTemplate sqlSession, int bno);

	int insertJobNotice(SqlSessionTemplate sqlSession, Board board);

	void updateJobNotice();

	void deleteJobNotice();

	void selectListJobBoard();

	void selectListJobMyBoard();

	void insertJobBoard();

	void searchJobBoard();

	void selectOneJobBoard();

	void SelectListApply();

	void updateJobBoard();

	void insertApply();

	void insertContract();

	void insertJobBoardReport();

	void insertJobBoardNote();


}