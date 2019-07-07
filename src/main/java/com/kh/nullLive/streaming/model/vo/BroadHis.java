package com.kh.nullLive.streaming.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BroadHis {
	//TABLE : BROAD_HIS
	private int bhno;				//BHNO
	private Date startDate;			//BH_START_DATE
	private Date endDate;			//BH_END_DATE
	private String bhStatus;		//BH_STATUS
	private int countViewers;		//COUNT_VIEWERS
	private int bcno;				//BCNO
	private String streamerId;		//BROAD_CENTER 조인 후 MEBMER.MID
	private int countRecommendation;//COUNT_RECOMMENDATION
	private String btitle;			//BROAD_TITLE
	private String bpwd;			//BROAD_PWD
	private String pwdCheck;
	private String bcategory;		//BROAD_CATEGORY
	private String adult;			//ADULT
}