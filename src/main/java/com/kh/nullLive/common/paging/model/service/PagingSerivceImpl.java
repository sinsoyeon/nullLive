package com.kh.nullLive.common.paging.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.common.paging.model.dao.PagingDao;
import com.kh.nullLive.common.paging.model.vo.PagingVo;

@Service
public class PagingSerivceImpl implements PagingService{

	@Autowired
	private PagingDao pd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 25.
	 * @comment : 페이징 모듈화 테스트중
	 */
	@Override
	public ArrayList<Board> selectPaging(PagingVo paging) {
		return pd.selectPaging(sqlSession,paging);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 6. 25.
	 * @comment : 페이징 모듈화 테스트중
	 */
	@Override
	public int selectTotalPaging() {
		
		return pd.selectTotalPaging(sqlSession);
	}

}
