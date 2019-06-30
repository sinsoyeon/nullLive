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
	private int fno;				//FNO (고객센터 FAQ)
	private int snno;				//SNNO (고객센터 공지사항)
	private int qno;				//SNNO (고객센터 문의)
	private String bTitle;			//BTITLE
	private String bContent;		//BCONTENT
	private Date writtenDate;		//WRITTEN_DATE
	private Date modifyDate;		//MODIFY_DATE
	private int bCount;				//BCOUNT
	private String bType;			//BTYPE
	private String questionType;	//QUESTION_TYPE
	private int refBno;				//REF_BNO
	private String bEmail;			//B_EMAIL
	private int bbno;				//BBNO
	private int bWriter;			//BWRITER
	private String reportType;		//REPORT_TYPE
	private String isQr;			//IS_QR
	private int reportMno;			//REPORT_MNO
	private int bStatus;			//B_STATUS
	//댓글리스트
	private ArrayList<Reply> replyList;
}
