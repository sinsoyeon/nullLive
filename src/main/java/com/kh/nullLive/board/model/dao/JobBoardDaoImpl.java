
package com.kh.nullLive.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.JobBoard;
import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.common.attachment.model.vo.Attachment;
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
	public ArrayList<HashMap<String,Object>> selectJobListJobPaging(SqlSessionTemplate sqlSession, HashMap<String,Object> hmap) {
		return (ArrayList) sqlSession.selectList("Board.selectJobTotalPaging",hmap);
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
	public int getJobBoardListCount(SqlSessionTemplate sqlSession,String bType) {
		return sqlSession.selectOne("Board.selectJobBoardListCount",bType);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 1.
	 * @comment : Board 조회
	 */
	@Override
	public HashMap<String,Object> selectOneBoard(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("Board.selectOneJobBoard",bno);
	}

	@Override
	public Member selectWriter(SqlSessionTemplate sqlSession, int bWriter) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 2.
	 * @comment : 공지사항 페이징 조회
	 */
	@Override
	public ArrayList<HashMap<String,Object>> selectJobNoticePaging(SqlSessionTemplate sqlSession, PagingVo paging) {
		return (ArrayList) sqlSession.selectList("Board.selectJobNoticeTotalPaging",paging);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 2.
	 * @comment : 공지사항 총 리스트 카운트 조회
	 */
	@Override
	public int getJobNoticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Board.selectJobNoticeListCount");
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 3.
	 * @comment : Board 조회
	 */
	@Override
	public Board selectOneMngBoard(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("Board.selectOneBoard",bno);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 3.
	 * @comment : jobBoard 조회
	 */
	@Override
	public JobBoard selectOnejobMngBoard(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("Board.selectOneJobBoard",bno);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 3.
	 * @comment : 게시글 상태 조회
	 */
	@Override
	public String selectOneBoardStatus(SqlSessionTemplate sqlSession, int bStatus) {
		return sqlSession.selectOne("Board.selectBoardStatus",bStatus);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 5.
	 * @comment : 내가 쓴 글 페이징 조회
	 */
	@Override
	public ArrayList<HashMap<String, Object>> 
				selectListJobMyBoardPaging(SqlSessionTemplate sqlSession, HashMap<String,Object> hmap) {
		return (ArrayList)sqlSession.selectList("Board.selectListJobMyBoardPaging", hmap);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 5.
	 * @comment : 내가 쓴 글 총 갯수 조회
	 */
	@Override
	public int getJobMyJobBoardCount(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return sqlSession.selectOne("Board.selectJobMyBoardListCount", hmap);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 8.
	 * @comment : 구인구직 공지사항 첨부파일 입력
	 */
	@Override
	public int insertJobNoticeAttList(SqlSessionTemplate sqlSession, HashMap<String, Object> attHmap) {
		return sqlSession.insert("Board.insertJobNoticeAttList", attHmap);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 8.
	 * @comment : 첨부파일 currval list 조회
	 */
	@Override
	public ArrayList<Integer> getAttnoList(SqlSessionTemplate sqlSession, int size) {
		return (ArrayList)sqlSession.selectList("Board.selectAttCurrvalList",size);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 8.
	 * @comment : 첨부파일 공지사항 관리 등록
	 */
	@Override
	public int insertJobNoticeAttMng(SqlSessionTemplate sqlSession, HashMap<String, Object> attmHmap) {
		return sqlSession.insert("Board.insertJobNoticeAttManager",attmHmap);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 8.
	 * @comment : 첨부파일 리스트 조회용
	 */
	@Override
	public ArrayList<Attachment> selectListBoardAtt(SqlSessionTemplate sqlSession, int bno) {
		return (ArrayList)sqlSession.selectList("Board.selectListBoardAtt",bno);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 8.
	 * @comment : 첨부파일 1개 조회용
	 */
	@Override
	public Attachment selectOneJobAtt(SqlSessionTemplate sqlSession, int attno) {
		return sqlSession.selectOne("Board.selectOneJobAtt",attno);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 10.
	 * @comment : 구인구직 매니저 지원서 입력 
	 */
	@Override
	public int insertMngContractBoard(SqlSessionTemplate sqlSession, HashMap<String, Object> conBoardMap) {
		return sqlSession.insert("Board.insertMngContractBoard",conBoardMap);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 10.
	 * @comment : 구인구직 지원서 가져오기
	 */
	@Override
	public ArrayList<HashMap<String, Object>> selectListContBoard(SqlSessionTemplate sqlSession, int bno) {
		return (ArrayList)sqlSession.selectList("Board.selectListContBoard",bno);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 10.
	 * @comment : 구인구직 매니저 계약 입력
	 */
	@Override
	public int insertMngContract(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return sqlSession.insert("Board.insertMngContract",hmap);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 10.
	 * @comment : 구인구직 지원서 상태 계약완료로 변경
	 */
	@Override
	public int updateMngContBoard(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return sqlSession.update("Board.updateMngContBoard",hmap);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 10.
	 * @comment : 구인구직 매니저 파트너 테이블 insert
	 */
	@Override
	public int insertMngPartner(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return sqlSession.insert("Board.insertMngPartner",hmap);
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 7. 10.
	 * @comment : 계약 테이블 currval 조회
	 */
	@Override
	public int selectContCurrval(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Board.selectContCurrval");
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 10.
	 * @comment : 구인구직 매니저게시판 모집완료처리
	 */
	@Override
	public int updateJobMngBoardComplt(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return sqlSession.update("Board.updateJobMngBoardComplt",hmap);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 10.
	 * @comment : 구인구직게시판 작성자 파트너 테이블 가져오기
	 */
	@Override
	public ArrayList<HashMap<String, Object>> selectListPartner(SqlSessionTemplate sqlSession, int mno) {
		return (ArrayList)sqlSession.selectList("Board.selectListPartner",mno);
	}





	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
