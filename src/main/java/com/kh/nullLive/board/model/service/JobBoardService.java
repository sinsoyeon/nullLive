package com.kh.nullLive.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.nullLive.board.model.exception.BoardSelectListException;
import com.kh.nullLive.board.model.exception.JobBoardInsertException;
import com.kh.nullLive.board.model.exception.SelectOneBoardException;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.JobBoard;
import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.common.paging.model.vo.PagingVo;
import com.kh.nullLive.member.model.vo.Member;

public interface JobBoardService {

	ArrayList<Board> selectListJobNotice(PageInfo pi);

	Board selectOneJobNotice(int bno) throws SelectOneBoardException;

	int insertJobNotice(Board board);

	void updateJobNotice();

	void deleteJobNotice();

	void selectListJobMngBoard();

	ArrayList<HashMap<String, Object>> selectListJobMyBoardPaging(HashMap<String,Object> hmap);

	int insertJobBoard(Board board, JobBoard jBoard) throws JobBoardInsertException;

	void searchJobBoard();

	HashMap<String, Object> selectOneJobBoard(int bno) throws BoardSelectListException;

	void SelectListApply();

	void updateJobBoard();

	void insertApply();

	void insertContract();

	void insertJobBoardReport();

	void insertJobBoardNote();

	int getListCount();

	ArrayList<HashMap<String,Object>> selectJobListJobPaging(HashMap<String,Object> hmap);

	int selectJobMngTotalPaging();

	int getJobBoardListCount(String bType);

	ArrayList<HashMap<String,Object>> selectJobNoticePaging(PagingVo paging);

	int getJobNoticeListCount();

	int getJobMyJobBoardCount(HashMap<String, Object> hmap);


}
