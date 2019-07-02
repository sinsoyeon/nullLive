package com.kh.nullLive.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Question {
	private int bno; // BNO
	private String qustionType;// QUESTION_TYPE
	private String name;// NAME
	private String bTitle;// BTITLE
	private String bContent;// "BCONTENT"
	private Date wDate; // WRITTEN_DATE
	private int bStatus;// B_STATUS
	private String answer; // 답변 내용 
}
