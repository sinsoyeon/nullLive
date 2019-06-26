package com.kh.nullLive.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Exchange {
	private int excno; //EXCNO
	private String nickName; // NICK_NAME
	private String name; // NAME
	private int excFee; // EXC_FEE
	private Date applicationDate; // APPLICATION_DATE
	private String excStatus; // EXC_STATUS
	private Date approvalDate; // APPROVAL_DATE

}
