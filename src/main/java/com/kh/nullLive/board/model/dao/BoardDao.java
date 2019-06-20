package com.kh.nullLive.board.model.dao;

public interface BoardDao {

	void selectListJobNotice();

	void selectOneJobNotice();

	void insertJobNotice();

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
