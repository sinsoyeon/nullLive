package com.kh.nullLive.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ban implements java.io.Serializable{
	private int bano;//BANO
	private Date banDate;//BAN_DATE
	private Date endDate; //BAN_END
	private String baStatus;//BA_STATUS
	private int mno; //MNO
}
