package com.kh.nullLive.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.nullLive.board.model.exception.JobBoardInsertException;
import com.kh.nullLive.board.model.exception.SelectOneBoardException;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.JobBoard;
import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.common.paging.model.vo.PagingVo;

public interface JobBoardService {

	ArrayList<Board> selectListJobNotice(PageInfo pi);

	Board selectOneJobNotice(int bno) throws SelectOneBoardException;

	int insertJobNotice(Board board);

	void updateJobNotice();

	void deleteJobNotice();

	void selectListJobMngBoard();

	void selectListJobMyBoard();

	int insertJobBoard(Board board, JobBoard jBoard) throws JobBoardInsertException;

	void searchJobBoard();

	void selectOneJobBoard();

	void SelectListApply();

	void updateJobBoard();

	void insertApply();

	void insertContract();

	void insertJobBoardReport();

	void insertJobBoardNote();

	int getListCount();

	ArrayList selectJobMngPaging(PagingVo paging);

	int selectJobMngTotalPaging();


}
