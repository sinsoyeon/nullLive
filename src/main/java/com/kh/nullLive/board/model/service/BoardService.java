package com.kh.nullLive.board.model.service;

import java.util.ArrayList;

import com.kh.nullLive.board.model.exception.BoardSelectListException;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.PageInfo;

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
}
