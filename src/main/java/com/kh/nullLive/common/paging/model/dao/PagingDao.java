package com.kh.nullLive.common.paging.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.common.paging.model.vo.PagingVo;

public interface PagingDao {

	ArrayList<Board> selectPaging(SqlSessionTemplate sqlSession, PagingVo paging);

	int selectTotalPaging(SqlSessionTemplate sqlSession);

}
