package com.kh.nullLive.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.nullLive.board.model.dao.BoardDao;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.common.attachment.model.vo.Attachment;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao bd;

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager transactionManager;


	//고객센터 FAQ 전체 게시글 수 조회
	@Override
	public int getFListCount() {
		return bd.getFListCount(sqlSession);
	}

	//고객센터 FAQ 전체 게시글 조회
	@Override
	public ArrayList<Board> selectFBoardList(PageInfo pi){
		return bd.selectFBoardList(sqlSession, pi);
	}

	//고객센터 FAQ 검색한 게시글 수 조회
	@Override
	public int getSearchFListCount(int condition) {			
		return bd.getSearchFListCount(sqlSession, condition);	
	}

	//고객센터 FAQ 검색한 게시글 조회
	@Override
	public ArrayList<Board> searchFBoardList(PageInfo pi, int condition) {
		return bd.searchFBoardList(sqlSession, pi, condition);					
	}

	//고객센터 공지사항 전체 게시글 수 조회
	@Override
	public int getNListCount() {
		return bd.getNListCount(sqlSession);
	}

	//고객센터 공지사항 전체 게시글 조회
	@Override
	public ArrayList<Board> selectNBoardList(PageInfo pi) {
		return bd.selectNBoardList(sqlSession, pi);
	}

	//고객센터 FAQ 상세 조회
	@Override
	public ArrayList<Board> selectOneFBoard(int num) {
		return bd.selectOneFBoard(sqlSession, num);
	}

	//고객센터 공지사항 상세 조회
	@Override
	public ArrayList<Board> selectOneNBoard(int num) {
		return bd.selectOneNBoard(sqlSession, num);
	}

	//고객센터 FAQ 조회수 증가
	@Override
	public int updateFBoardCount(int num) {
		return bd.updateFBoardCount(sqlSession, num);
	}

	//고객센터 공지사항 조회수 증가
	@Override
	public int updateNBoardCount(int num) {
		return bd.updateNBoardCount(sqlSession, num);
	}

	//고객센터 1:1 문의 작성(첨부파일 포함)
	@Override
	public int insertQuestion(Board b, Attachment att) {
		int result = 0;

		//1. 보드 넣기
		result = bd.insertQuestionBoard(sqlSession, b);

		//2. Attachment 삽입
		result = bd.insertServiceAtt(sqlSession, att);

		//3. currval 가져오기
		int bno = bd.getScurrval(sqlSession);
		System.out.println("등록한 게시글 번호 : " + bno);
		int attno = bd.getAcurrval(sqlSession);
		System.out.println("등록한 첨부파일 번호 : " + attno);

		//4. AttachmentManage에 등록
		result = bd.insertServiceAttM(sqlSession, bno, attno);

		return result;
	}

	//고객센터 1:1 문의 작성
	@Override
	public int insertQuestion2(Board b) {
		return bd.insertQuestionBoard(sqlSession, b);
	}

	//고객센터 신고하기(첨부파일 포함)
	@Override
	public int insertReport(Board b, Attachment att) {
		int result = 0;

		//1. 보드 넣기
		result = bd.insertReportBoard(sqlSession, b);

		//2. Attachment 삽입
		result = bd.insertServiceAtt(sqlSession, att);

		//3. currval 가져오기
		int bno = bd.getScurrval(sqlSession);
		System.out.println("등록한 게시글 번호 : " + bno);
		int attno = bd.getAcurrval(sqlSession);
		System.out.println("등록한 첨부파일 번호 : " + attno);

		//4. AttachmentManage에 등록
		result = bd.insertServiceAttM(sqlSession, bno, attno);

		return result;
	}

	//고객센터 신고자 아이디로 mno 가져오기
	@Override
	public int selectRmno(String rmid) {
		return bd.selectRmno(sqlSession, rmid);
	}

	//고객센터 신고하기
	@Override
	public int insertReport2(Board b) {
		return bd.insertReportBoard(sqlSession, b);
	}

	//고객센터 나의문의내역 전체 게시글 수 조회
	@Override
	public int getmQListCount(int mno) {
		return bd.getmQListCount(sqlSession, mno);
	}

	//고객센터 나의문의내역 전체 게시글 조회
	@Override
	public ArrayList<HashMap<String, Object>> selectmQBoardList(PageInfo pi, int mno) {
		return bd.selectmQBoardList(sqlSession, pi, mno);
	}

	//고객센터 나의문의내역 조회수 증가
	@Override
	public int updateMQBoardCount(int num) {
		return bd.updateMQBoardCount(sqlSession, num);
	}

	//고객센터 나의문의내역 상세 조회
	@Override
	public ArrayList<HashMap<String, Object>> selectOneMQBoard(int num) {
		return bd.selectOneMQBoard(sqlSession, num);
	}
}
