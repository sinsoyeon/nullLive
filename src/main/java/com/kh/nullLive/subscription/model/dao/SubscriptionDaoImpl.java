package com.kh.nullLive.subscription.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SubscriptionDaoImpl implements SubscriptionDao{

	/**
	 * @author : uukk
	 * @date : 2019. 7. 3.
	 * @comment : 구독자수 조회
	 */
	@Override
	public int getSubscriptionCount(SqlSessionTemplate sqlSession, int sno) {
		return sqlSession.selectOne("Subscription.getSubscriptionCount",sno);
	}

}
