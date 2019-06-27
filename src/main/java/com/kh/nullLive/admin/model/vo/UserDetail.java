package com.kh.nullLive.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDetail {
	private String mid; // MID
	private String name; // NAME
	private String nickName; // NICK_NAME
	private Date enrollDate; // ENROLL_DATE
	private String mStatus; // M_STATUS
	private String broadAddress; // broad_address
	private int report; // REPORT
	private int broCount; // BROCOUNT

}
