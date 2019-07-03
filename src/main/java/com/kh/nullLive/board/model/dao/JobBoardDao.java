package com.kh.nullLive.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.JobBoard;
import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.common.paging.model.vo.PagingVo;
import com.kh.nullLive.member.model.vo.Member;

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

	JobBoard selectOneJobBoard(SqlSessionTemplate sqlSession, int bno);

	void SelectListApply();

	void updateJobBoard();

	void insertApply();

	void insertContract();

	void insertJobBoardReport();

	void insertJobBoardNote();

	int updateBoardCount(SqlSessionTemplate sqlSession, int bno);

	int getListCount(SqlSessionTemplate sqlSession);

	ArrayList selectJobMngPaging(SqlSessionTemplate sqlSession, PagingVo paging);

	int insertJobJBoard(SqlSessionTemplate sqlSession, JobBoard jBoard);

	int selectCurrval(SqlSessionTemplate sqlSession);

	int getJobMngListCount(SqlSessionTemplate sqlSession);

	HashMap<String, Object> selectOneBoard(SqlSessionTemplate sqlSession, int bno);

	Member selectWriter(SqlSessionTemplate sqlSession, int bWriter);

	ArrayList<HashMap<String,Object>> selectJobNoticePaging(SqlSessionTemplate sqlSession, PagingVo paging);

	int getJobNoticeListCount(SqlSessionTemplate sqlSession);

	Board selectOneMngBoard(SqlSessionTemplate sqlSession, int bno);

	JobBoard selectOnejobMngBoard(SqlSessionTemplate sqlSession, int bno);

	/**
	 * @author : uukk
	 * @date : 2019. 7. 3.
	 * @comment : 게시글 상태 조회
	 */
	String selectOneBoardStatus(SqlSessionTemplate sqlSession, int bStatus);



}
