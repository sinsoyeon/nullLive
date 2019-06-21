package com.kh.nullLive.common.attachment.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Attachment implements java.io.Serializable {
	//TABLE : ATTACHMENT
	private int attno;			//ATTNO
	private Date uploadDate;	//UPLOAD_DATE
	private String filePath;	//FILE_PATH
	private Date modifyDate;	//MODIFY_DATE
	private int download;		//DOWNLOAD
	private String originName;	//ORIGIN_NAME
	private String changeName;	//CHANGE_NAME
	private String attDiv;		//ATT_DIV
	private String attStatus;	//ATT_STATUS
}
