package com.kh.nullLive.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDetail {
	private int mno; // MNO
	private String mid; // MID
	private String name; // NAME
	private String nickName; // NICK_NAME
	private String enrollDate; // ENROLL_DATE
	private String memStatus; // M_STATUS
	private String broadAddress; // broad_address
	private int report; // REPORT
	private int broCount; // BROCOUNT
	private int banDay; //BAN_DAY
	private int endDay; //END_DAY

}
