package com.kh.nullLive.admin.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.nullLive.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Report {
	private int bno;				//BNO
	private String bTitle;			//BTITLE
	private String bContent;		//BCONTENT
	private Date writtenDate;		//WRITTEN_DATE
	private String reportType;		//REPORT_TYPE
	private String staDetail;
	private String mid1;			//MID1
	private String mid2;			//MID2
	private int cou; // COU

	
	
}
