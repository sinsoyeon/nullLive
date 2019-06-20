package com.kh.nullLive.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member implements java.io.Serializable{
	//TABLE : MEMBER
	private int mno;			//MNO
	private String mid;			//MID
	private String mpwd;		//MPWD
	private String email;		//EMAIL
	private String emailC;		//EMAIL_CHECK
	private String phone;		//PHONE
	private String agency;		//AGENCY
	private String name;		//NAME
	private String nickName;	//NICK_NAME
	private String gender;		//GENDER
	private Date enrollDate;	//ENROLL_DATE
	private int point;			//POINT
	private String isAdmin;		//IS_ADMIN
	private int receivedLikes;	//RECEIVED_LIKES
	private int cumulativeReport;//CUMULATIVE_REPORT
	private String mstatus;		//M_STATUS
	private Date pwdModifyDate;	//PWD_MODIFY_DATE
	private Date withdrawalDate;//WITHDRAWAL_DATE
	private String isStreamer;	//IS_STREAMER
	private Date birthday;		//BIRTHDAY
	private String adult;		//ADULT
}
