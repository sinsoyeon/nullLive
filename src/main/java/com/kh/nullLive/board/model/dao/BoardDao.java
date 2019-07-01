package com.kh.nullLive.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.board.model.exception.BoardSelectListException;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.common.attachment.model.vo.Attachment;

public interface BoardDao {
	//고객센터 FAQ 전체 게시글 수 조회
	int getFListCount(SqlSessionTemplate sqlSession);

	//고객센터 FAQ 전체 게시글 조회
	ArrayList<Board> selectFBoardList(SqlSessionTemplate sqlSession, PageInfo pi);

	//고객센터 FAQ 검색한 게시글 수 조회
	int getSearchFListCount(SqlSessionTemplate sqlSession, int condition);

	//고객센터 FAQ 검색한 게시글 조회
	ArrayList<Board> searchFBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int condition);

	//고객센터 공지사항 전체 게시글 수 조회
	int getNListCount(SqlSessionTemplate sqlSession);

	//고객센터 공지사항 전체 게시글 조회
	ArrayList<Board> selectNBoardList(SqlSessionTemplate sqlSession, PageInfo pi);

	//고객센터 FAQ 상세 조회
	ArrayList<Board> selectOneFBoard(SqlSessionTemplate sqlSession, int num);

	//고객센터 공지사항 상세 조회
	ArrayList<Board> selectOneNBoard(SqlSessionTemplate sqlSession, int num);

	//고객센터 FAQ 조회수 증가
	int updateFBoardCount(SqlSessionTemplate sqlSession, int num);

	//고객센터 공지사항 조회수 증가
	int updateNBoardCount(SqlSessionTemplate sqlSession, int num);

	//고객센터 1:1 문의 작성
	int insertQuestionBoard(SqlSessionTemplate sqlSession, Board b);

	//고객센터 작성한 문의/신고 BNO 가져오기
	int getScurrval(SqlSessionTemplate sqlSession);

	//고객센터 문의/신고 첨부파일 넣기
	int insertServiceAtt(SqlSessionTemplate sqlSession, Attachment att);

	//고객센터 문의/신고 첨부파일 ATTNO 가져오기
	int getAcurrval(SqlSessionTemplate sqlSession);

	//고객센터 문의/신고 첨부파일 관리 등록
	int insertServiceAttM(SqlSessionTemplate sqlSession, int bno, int attno);
	
	//고객센터 - 신고자 아이디로 mno 가져오기
	int selectRmno(SqlSessionTemplate sqlSession, String rmid);
	
	//고객센터 신고하기
	int insertReportBoard(SqlSessionTemplate sqlSession, Board b);

	//고객센터 나의문의내역 전체 게시글 수 조회
	int getmQListCount(SqlSessionTemplate sqlSession, int mno);

	//고객센터 나의문의내역 전체 게시글 조회
	ArrayList<HashMap<String, Object>> selectmQBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int mno);
	
	//고객센터 나의문의내역 조회수 증가
	int updateMQBoardCount(SqlSessionTemplate sqlSession, int num);
	
	//고객센터 나의문의내역 상세 조회
	ArrayList<HashMap<String, Object>> selectOneMQBoard(SqlSessionTemplate sqlSession, int num);
}