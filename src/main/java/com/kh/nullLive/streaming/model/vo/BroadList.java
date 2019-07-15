package com.kh.nullLive.streaming.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BroadList {
	/* LIVE/VOD 방송목록 */
	private int bhno;				//BHNO
	private String broadAddress;	//BROAD_ADDRESS
	private int mno;				//MNO
	private String nickName;		//NICK_NAME
	private Date startDate;			//BH_START_DATE
	private Date endDate;			//BH_END_DATE
	private String bhStatus;		//BH_STATUS
	private int countViewers;		//COUNT_VIEWERS
	private int bcno;				//BCNO
	private int countRecommendation;//COUNT_RECOMMENDATION
	private String bTitle;			//BROAD_TITLE
	private String bPwd;			//BROAD_PWD
	private String pwdCheck;
	private String bCategory;		//BROAD_CATEGORY
	private String adult;			//ADULT
	
	/* 즐겨찾기 */
	private int fano;				//FANO
	private int favCount;			//스트리머를 즐겨찾기 한 사람 수(테이블엔 없음)
	private String sGender;			//스트리머 성별
	/* 구독한BJ */
	private int suno;				//SUNO
	private int subCount;			//스트리머를 구독 한 사람 수(테이블엔 없음)
}