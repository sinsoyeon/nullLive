package com.kh.nullLive.board.model.vo;

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
public class Reply {
	private int rno;			//RNO
	private String rContent;	//RCONTENT
	private int replyDate;		//REPLY_DATE
	private String rStatus;		//R_STATUS
	private int bno;			//BNO
	private int mno;			//MNO
}
