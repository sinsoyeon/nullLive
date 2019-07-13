package com.kh.nullLive.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Subscription implements Serializable{
	//TABLE : SUBSCRIPTION_HIS
	private int suno;
	private int mno;
	private String mid;			//MEMBER.MID
	private int sno;
	private String sid;			//STREAMER>MEMBER.MID
	private String nickName;	//STREAMER>MEMBER.NICK_NAME
	private Date su_start_date;
	private Date su_period_date;
	private String su_status;
	private String broadAddress;//STREAMER>MEMBER>BROAD_CENTER.BROAD_ADDRESS
	private String byn;			//방송여부
}
