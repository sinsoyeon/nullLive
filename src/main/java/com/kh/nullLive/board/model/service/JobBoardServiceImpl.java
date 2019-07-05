package com.kh.nullLive.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.nullLive.board.model.dao.JobBoardDao;
import com.kh.nullLive.board.model.exception.BoardSelectListException;
import com.kh.nullLive.board.model.exception.JobBoardInsertException;
import com.kh.nullLive.board.model.exception.SelectOneBoardException;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.JobBoard;
import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.common.paging.model.vo.PagingVo;
import com.kh.nullLive.member.model.dao.MemberDao;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streamer.model.dao.StreamerDao;
import com.kh.nullLive.streamer.model.vo.Streamer;
import com.kh.nullLive.subscription.model.dao.SubscriptionDao;

@Service
public class JobBoardServiceImpl implements JobBoardService{

	@Autowired
	private JobBoardDao jbd;
	@Autowired
	private MemberDao md;
	@Autowired
	private StreamerDao sd;
	@Autowired
	private SubscriptionDao sud;
	
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
	 * @throws BoardSelectListException 
	 * @date : 2019. 7. 1.
	 * @comment : 구인구직 게시판 상세조회
	 */
	@Override
	public HashMap<String, Object> selectOneJobBoard(int bno) throws BoardSelectListException {
		HashMap<String,Object> boardMap = new HashMap<>();
		//조회수 증가
		int result = jbd.updateBoardCount(sqlSession,bno);
		//board 조회
		Board board = jbd.selectOneMngBoard(sqlSession,bno);
		
		//board 상태 조회
		System.out.println(jbd.selectOneBoardStatus(sqlSession,board.getBStatus()));
		String boardStatus = (String)(jbd.selectOneBoardStatus(sqlSession,board.getBStatus()));
		
		
		//jobBoard 조회
		JobBoard jBoard = jbd.selectOnejobMngBoard(sqlSession,bno);
		
		System.out.println(jBoard);
		//글작성자 조회
		int mno = Integer.parseInt((String)(board.getBWriter()+""));
		Member member = md.selectMemberMno(sqlSession, mno);
		
		System.out.println(member);
		if(jBoard.getJBtype().equals("구인")) {
			//구인구직게시판 타입이 구인인경우 스트리머정보를 가져옴
			Streamer streamer = sd.selectStreamerMno(sqlSession,mno);
			if(streamer == null) {
				throw new BoardSelectListException("스트리머 정보 불러오기 실패");
			}
			boardMap.put("streamer", streamer);
			//구독자수 조회
			int suCount = sud.getSubscriptionCount(sqlSession,streamer.getSno());
			boardMap.put("suCount",suCount);
		}
		
		boardMap.put("boardStatus", boardStatus);
		boardMap.put("board", board);
		boardMap.put("jBoard", jBoard);
		boardMap.put("member", member);
		
		return boardMap;
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
	public ArrayList<HashMap<String,Object>> selectJobListJobPaging(HashMap<String,Object> hmap) {
		return jbd.selectJobListJobPaging(sqlSession,hmap);
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
	public int getJobBoardListCount(String bType) {
		return jbd.getJobBoardListCount(sqlSession,bType);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 3.
	 * @comment : 구인구직 공지사항 페이징 조회
	 */
	@Override
	public ArrayList<HashMap<String,Object>> selectJobNoticePaging(PagingVo paging) {
		return jbd.selectJobNoticePaging(sqlSession,paging);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 3.
	 * @comment : 구인구직 공지사항 전체 갯수
	 */
	@Override
	public int getJobNoticeListCount() {
		return jbd.getJobNoticeListCount(sqlSession);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 5.
	 * @comment : 내가 쓴 글 조회
	 */
	@Override
	public ArrayList<HashMap<String, Object>> selectListJobMyBoardPaging(HashMap<String,Object> hmap) {
		return jbd.selectListJobMyBoardPaging(sqlSession,hmap);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 5.
	 * @comment : 구인구직 매니저 전체 갯수
	 */
	@Override
	public int getJobMyJobBoardCount(HashMap<String, Object> hmap) {
		return jbd.getJobMyJobBoardCount(sqlSession,hmap);
	}



}
