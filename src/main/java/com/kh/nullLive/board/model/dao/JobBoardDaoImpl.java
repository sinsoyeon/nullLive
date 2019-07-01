package com.kh.nullLive.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.JobBoard;
import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.common.paging.model.vo.PagingVo;
import com.kh.nullLive.member.model.vo.Member;

@Repository
public class JobBoardDaoImpl implements JobBoardDao {


	/**
	 * @author : uukk
	 * @date : 2019. 6. 24.
	 * @comment : 구인구직 공지사항 상세조회
	 */
	@Override
	public Board selectOneJobNotice(SqlSessionTemplate sqlSession, int bno) {
		Board board = sqlSession.selectOne("Board.selectOneJobNotice",bno);
		return board;
	}

	@Override
	public void updateJobNotice() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteJobNotice() {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @author : uukk
	 * @date : 2019. 6. 26.
	 * @comment : 구인구직 매니저게시판 리스트
	 */
	@Override
	public void selectListJobMngBoard() {
		
	}

	@Override
	public void selectListJobMyBoard() {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @author : uukk
	 * @date : 2019. 6. 26.
	 * @comment : 구인구직 게시판(board) 작성
	 */
	@Override
	public int insertJobBoard(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.insert("Board.insertBoard",board);
	}
	/**
	 * @author : uukk
	 * @date : 2019. 6. 26.
	 * @comment : 구인구직 게시판(jboard) 작성
	 */
	@Override
	public int insertJobJBoard(SqlSessionTemplate sqlSession, JobBoard jBoard) {
		return sqlSession.insert("Board.insertJobBoard",jBoard);
	}

	@Override
	public void searchJobBoard() {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 1.
	 * @comment : 구인구직게시판 상세조회
	 */
	@Override
	public JobBoard selectOneJobBoard(SqlSessionTemplate sqlSession,int bno) {
		return sqlSession.selectOne("Board.selectOneJobBoard",bno);
	}

	@Override
	public void SelectListApply() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateJobBoard() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertApply() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertContract() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertJobBoardReport() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertJobBoardNote() {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @author : uukk
	 * @date : 2019. 6. 24.
	 * @comment : 공지사항 입력 메소드
	 */
	@Override
	public int insertJobNotice(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.insert("Board.insertJobNotice",board);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 6. 24.
	 * @comment : 조회수 업데이트 메소드
	 */
	@Override
	public int updateBoardCount(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("Board.updateBoardCount",bno);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 6. 24.
	 * @comment : 리스트 갯수 조회용
	 */
	@Override
	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Board.selectListCount");
	}

	/**
	 * @author : uukk
	 * @date : 2019. 6. 26.
	 * @comment : 구인구직 매니저게시판 게시글 페이징 조회
	 */
	@Override
	public ArrayList selectJobMngPaging(SqlSessionTemplate sqlSession, PagingVo paging) {
		return (ArrayList) sqlSession.selectList("Board.selectJobMngTotalPaging",paging);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 6. 27.
	 * @comment : board currval 조회
	 */
	@Override
	public int selectCurrval(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Board.selectCurrval");
	}

	@Override
	public ArrayList<Board> selectListJobNotice(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 1.
	 * @comment : 매니저 리스트 총 갯수 조회
	 */
	@Override
	public int getJobMngListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Board.selectMngListCount");
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 1.
	 * @comment : Board 조회
	 */
	@Override
	public Board selectOneBoard(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("Board.selectOneBoard",bno);
	}

	@Override
	public Member selectWriter(SqlSessionTemplate sqlSession, int bWriter) {
		// TODO Auto-generated method stub
		return null;
	}





	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
