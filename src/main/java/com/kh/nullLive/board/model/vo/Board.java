package com.kh.nullLive.board.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Board {
	private int bno;				//BNO
	private String btitle;			//BTITLE
	private String bcontent;		//BCONTENT
	private Date writtenDate;		//WRITTEN_DATE
	private Date modifyDate;		//MODIFY_DATE
	private int bcount;				//BCOUNT
	private String btype;			//BTYPE
	private String questionType;	//QUESTION_TYPE
	private int refBno;				//REF_BNO
	private String bemail;			//B_EMAIL
	private int bbno;				//BBNO
	private int bwriter;			//BWRITER
	private String reportType;		//REPORT_TYPE
	private String isQr;			//IS_QR
	private int reportMno;			//REPORT_MNO
	private int bStatus;			//B_STATUS
	//댓글리스트
	private ArrayList<Reply> replyList; 

	
	
}
