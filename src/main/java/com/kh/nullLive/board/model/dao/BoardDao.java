package com.kh.nullLive.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.board.model.exception.BoardSelectListException;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.PageInfo;

public interface BoardDao {
	//고객센터 FAQ 전체 게시글 수 조회
	int getFListCount(SqlSessionTemplate sqlSession);

	//고객센터 FAQ 전체 게시글 조회
	ArrayList<Board> selectFBoardList(SqlSessionTemplate sqlSession, PageInfo pi);

}
