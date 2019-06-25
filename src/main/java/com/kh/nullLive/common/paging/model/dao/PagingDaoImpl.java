package com.kh.nullLive.common.paging.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.common.paging.model.vo.PagingVo;

@Repository
public class PagingDaoImpl implements PagingDao{

	/**
	 * @author : uukk
	 * @date : 2019. 6. 25.
	 * @comment : 페이징 모듈화 테스트중
	 */
	@Override
	public ArrayList<Board> selectPaging(SqlSessionTemplate sqlSession,PagingVo paging) {
		System.out.println("DAO");
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("Board.selectPaging",paging);
		System.out.println(list);
		return list ;
	}

	/**
	 * @author : uukk
	 * @date : 2019. 6. 25.
	 * @comment : 페이징 모듈화 테스트중
	 */
	@Override
	public int selectTotalPaging(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Board.selectTotalPaging");
	}
	

}
