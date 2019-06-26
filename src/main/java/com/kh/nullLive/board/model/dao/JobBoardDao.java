package com.kh.nullLive.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.JobBoard;
import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.common.paging.model.vo.PagingVo;

public interface JobBoardDao {

	ArrayList<Board> selectListJobNotice(SqlSessionTemplate sqlSession, PageInfo pi);

	Board selectOneJobNotice(SqlSessionTemplate sqlSession, int bno);

	int insertJobNotice(SqlSessionTemplate sqlSession, Board board);

	void updateJobNotice();

	void deleteJobNotice();

	void selectListJobMngBoard();

	void selectListJobMyBoard();

	int insertJobBoard(SqlSessionTemplate sqlSession, Board board);

	void searchJobBoard();

	void selectOneJobBoard();

	void SelectListApply();

	void updateJobBoard();

	void insertApply();

	void insertContract();

	void insertJobBoardReport();

	void insertJobBoardNote();

	int updateBoardCount(SqlSessionTemplate sqlSession, int bno);

	int getListCount(SqlSessionTemplate sqlSession);

	ArrayList<Board> selectJobMngPaging(SqlSessionTemplate sqlSession, PagingVo paging);

	int insertJobJBoard(SqlSessionTemplate sqlSession, JobBoard jBoard);

	int selectCurrval(SqlSessionTemplate sqlSession);



}
