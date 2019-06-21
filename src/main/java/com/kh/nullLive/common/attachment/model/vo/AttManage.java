package com.kh.nullLive.common.attachment.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttManage implements java.io.Serializable{
	//TABLE : ATT_MANAGE
	private String usage;		//USAGE
	private int amno;			//AMNO
	private int attno;			//ATTNO
	private int mno;			//MNO
	private int sno;			//SNO
	private int bno;			//BNO
	private int bcno;			//BCNO
}
