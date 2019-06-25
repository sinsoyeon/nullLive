package com.kh.nullLive.streamer.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Streamer implements Serializable{
	private int sno;
	private int mno;
	private Date bstart_date;
	private int cumulative_selection;
	private int bank_code;
	private String account;
	private String holder;
	private String is_auth;
	private String nickName;	//Member.nickName
}
