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

}
