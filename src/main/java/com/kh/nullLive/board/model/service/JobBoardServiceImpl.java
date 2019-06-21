package com.kh.nullLive.board.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.nullLive.board.model.dao.JobBoardDao;

@Service
public class JobBoardServiceImpl implements JobBoardService{

	@Autowired
	private JobBoardDao bd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Override
	public void selectListJobNotice() {
		bd.selectListJobNotice();
	}

	@Override
	public void selectOneJobNotice() {
		bd.selectOneJobNotice();
	}

	@Override
	public void insertJobNotice() {
		bd.insertJobNotice();
	}

	@Override
	public void updateJobNotice() {
		bd.updateJobNotice();
	}

	@Override
	public void deleteJobNotice() {
		bd.deleteJobNotice();
	}

	@Override
	public void selectListJobBoard() {
		bd.selectListJobBoard();
	}

	@Override
	public void selectListJobMyBoard() {
		bd.selectListJobMyBoard();
	}

	@Override
	public void insertJobBoard() {
		bd.insertJobBoard();
	}

	@Override
	public void searchJobBoard() {
		bd.searchJobBoard();
	}

	@Override
	public void selectOneJobBoard() {
		bd.selectOneJobBoard();
	}

	@Override
	public void SelectListApply() {
		bd.SelectListApply();
	}

	@Override
	public void updateJobBoard() {
		bd.updateJobBoard();
	}

	@Override
	public void insertApply() {
		bd.insertApply();
	}

	@Override
	public void insertContract() {
		bd.insertContract();
	}

	@Override
	public void insertJobBoardReport() {
		bd.insertJobBoardReport();
	}

	@Override
	public void insertJobBoardNote() {
		bd.insertJobBoardNote();
	}

}
