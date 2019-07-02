package com.kh.nullLive.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.nullLive.board.model.dao.JobBoardDao;
import com.kh.nullLive.board.model.exception.JobBoardInsertException;
import com.kh.nullLive.board.model.exception.SelectOneBoardException;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.JobBoard;
import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.common.paging.model.vo.PagingVo;
import com.kh.nullLive.member.model.dao.MemberDao;
import com.kh.nullLive.member.model.vo.Member;

@Service
public class JobBoardServiceImpl implements JobBoardService{

	@Autowired
	private JobBoardDao jbd;
	@Autowired
	private MemberDao md;
	
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
	public ArrayList<Board> selectListJobNotice(PageInfo pi) {
		return jbd.selectListJobNotice(sqlSession,pi);
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
		int result = jbd.updateBoardCount(sqlSession,bno);
		System.out.println(result);
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

	/**
	 * @author : uukk
	 * @date : 2019. 6. 27.
	 * @comment : 매니저 리스트 페이징
	 */
	@Override
	public void selectListJobMngBoard() {
		jbd.selectListJobMngBoard();
	}

	@Override
	public void selectListJobMyBoard() {
		jbd.selectListJobMyBoard();
	}

	/**
	 * @author : uukk
	 * @throws JobBoardInsertException 
	 * @date : 2019. 6. 26.
	 * @comment : 구인구직게시판 작성
	 */
	@Override
	public int insertJobBoard(Board board, JobBoard jBoard) throws JobBoardInsertException {
		int result = 0;
		int boardResult = jbd.insertJobBoard(sqlSession,board);
		int boardCurrval = jbd.selectCurrval(sqlSession);
		System.out.println(boardCurrval);
		jBoard.setBno(boardCurrval);
		int jBoardResult = jbd.insertJobJBoard(sqlSession,jBoard);
		System.out.println(jBoardResult);
		if(boardResult > 0 && jBoardResult > 0) {
			result = 1;
		}else {
			result = 0;
			throw new JobBoardInsertException("구인구직게시판 작성 실패");
		}
		return result;
	}

	@Override
	public void searchJobBoard() {
		jbd.searchJobBoard();
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 1.
	 * @comment : 구인구직 게시판 상세조회
	 */
	@Override
	public HashMap<String, Object> selectOneJobBoard(int bno) {
		return jbd.selectOneBoard(sqlSession,bno);
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

	/**
	 * @author : uukk
	 * @date : 2019. 6. 24.
	 * @comment : 게시글 리스트 갯수 조회
	 */
	@Override
	public int getListCount() {
		return  jbd.getListCount(sqlSession);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 6. 26.
	 * @comment : 매니저 리스트 페이징 조회
	 */
	@Override
	public ArrayList selectJobMngPaging(PagingVo paging) {
		return jbd.selectJobMngPaging(sqlSession,paging);
	}

	@Override
	public int selectJobMngTotalPaging() {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 1.
	 * @comment : 매니저 리스트 전체조회
	 */
	@Override
	public int getJobMngListCount() {
		return jbd.getJobMngListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectJobNoticePaging(PagingVo paging) {
		return jbd.selectJobNoticePaging(sqlSession,paging);
	}

	@Override
	public int getJobNoticeListCount() {
		return jbd.getJobNoticeListCount(sqlSession);
	}



}
