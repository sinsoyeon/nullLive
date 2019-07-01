package com.kh.nullLive.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.common.attachment.model.vo.Attachment;

public interface BoardService {

	//고객센터 FAQ 전체 게시글 수 조회
	int getFListCount();

	//고객센터 FAQ 전체 게시글 조회
	ArrayList<Board> selectFBoardList(PageInfo pi);

	//고객센터 FAQ 검색한 게시글 수 조회
	int getSearchFListCount(int condition);

	//고객센터 FAQ 검색한 게시글 조회
	ArrayList<Board> searchFBoardList(PageInfo pi, int condition);

	//고객센터 공지사항 전체 게시글 수 조회
	int getNListCount();

	//고객센터 공지사항 전체 게시글 조회
	ArrayList<Board> selectNBoardList(PageInfo pi);

	//고객센터 FAQ 상세 조회
	ArrayList<Board> selectOneFBoard(int num);

	//고객센터 공지사항 상세 조회
	ArrayList<Board> selectOneNBoard(int num);

	//고객센터 FAQ 조회수 증가
	int updateFBoardCount(int num);

	//고객센터 공지사항 조회수 증가
	int updateNBoardCount(int num);

	//고객센터 1:1 문의 작성(첨부파일 포함)
	int insertQuestion(Board b, Attachment att);

	//고객센터 1:1 문의 작성
	int insertQuestion2(Board b);

	//고객센터 신고하기(첨부파일 포함)
	int insertReport(Board b, Attachment att);
	
	//고객센터 신고자 아이디로 mno가져오기
	int selectRmno(String rmid);
	
	//고객센터 신고하기
	int insertReport2(Board b);
	
	//고객센터 나의문의내역 전체 게시글 수 조회
	int getmQListCount(int mno);

	//고객센터 나의문의내역 전체 게시글 조회
	ArrayList<HashMap<String, Object>> selectmQBoardList(PageInfo pi, int mno);

	//고객센터 나의문의내역 조회수 증가
	int updateMQBoardCount(int num);

	//고객센터 나의문의내역 상세 조회
	ArrayList<HashMap<String, Object>> selectOneMQBoard(int num);
}
