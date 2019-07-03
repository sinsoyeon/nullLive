package com.kh.nullLive.subscription.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

public interface SubscriptionDao {

	/**
	 * @author : uukk
	 * @date : 2019. 7. 3.
	 * @comment : 구독자수 조회
	 */
	int getSubscriptionCount(SqlSessionTemplate sqlSession, int sno);

}
