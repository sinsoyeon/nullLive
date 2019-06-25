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
	private int suno;
	private int mno;
	private int sno;
	private Date su_start_date;
	private Date su_period_date;
	private String su_status;
}
