package com.kh.nullLive.board.model.service;

import java.util.ArrayList;

import com.kh.nullLive.board.model.exception.SelectOneBoardException;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.PageInfo;

public interface JobBoardService {

	ArrayList<Board> selectListJobNotice(PageInfo pi);

	Board selectOneJobNotice(int bno) throws SelectOneBoardException;

	int insertJobNotice(Board board);

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

	int getListCount();

}
