package com.kh.nullLive.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyPartner implements java.io.Serializable{
	private int mno;			//MNO
	private String onair;		//ONAIR 방송중 여부
	private String sNnick;		//S_NICK 스트리머 닉네임
	private int perprice;		//PERPRICE
	private String startDate;		//C_SDATE
	private String endDate;		//C_EDATE
	private String ptype;		//PTYPE
}
