package com.kh.nullLive.board.model.vo;

import java.sql.Date;

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
public class JobBoard {
	private int jbno;           //JBNO
	private String job;         //JOB
	private String jBtype;      //JBTYPE
	private String contContent; //CONT_CONTENT
	private int bno;            //BNO
	private Date deadLine;      //DEADLINE
	private int perprice;       //PERPRICE
}
