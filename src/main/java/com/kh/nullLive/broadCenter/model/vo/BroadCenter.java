package com.kh.nullLive.broadCenter.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BroadCenter implements java.io.Serializable{
	//TABLE : BROAD_CENTER
	private int bcno;				//BCNO
	private String braodAddress;	//BROAD_ADDRESS
	private String bcIntro;			//BCINTRO
	private String broadTitle;		//BROAD_TITLE
	private String broadPwd;		//BROAD_PWD
	private int mno;				//MNO
	private String isStreamer;		//IS_STREAMER
	private String broadCategory;	//BROAD_CATEGORY
	private String endingComment;	//ENDING_COMMNET
}
