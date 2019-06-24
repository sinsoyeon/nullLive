package com.kh.nullLive.board.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

public class Board {
	private int bno;				//BNO
	private String btitle;			//BTITLE
	private String bcontent;		//BCONTENT
	private Date writtenDate;		//WRITTEN_DATE
	private Date modifyDate;		//MODIFY_DATE
	private int bcount;				//BCOUNT
	private String btype;			//BTYPE
	private String questionType;	//QUESTION_TYPE
	private int refBno;				//REF_BNO
	private String bemail;			//B_EMAIL
	private int bbno;				//BBNO
	private int bwriter;			//BWRITER
	private String reportType;		//REPORT_TYPE
	private String isQr;			//IS_QR
	private int reportMno;			//REPORT_MNO
	private int bStatus;			//B_STATUS
	//댓글리스트
	private ArrayList<Reply> replyList; 
	
	public Board() {
		// TODO Auto-generated constructor stub
	}
	
	public Board(int bno, String btitle, String bcontent, Date writtenDate, Date modifyDate, int bcount, String btype,
			String questionType, int refBno, String bemail, int bbno, int bwriter, String reportType, String isQr,
			int reportMno, int bStatus, ArrayList<Reply> replyList) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.writtenDate = writtenDate;
		this.modifyDate = modifyDate;
		this.bcount = bcount;
		this.btype = btype;
		this.questionType = questionType;
		this.refBno = refBno;
		this.bemail = bemail;
		this.bbno = bbno;
		this.bwriter = bwriter;
		this.reportType = reportType;
		this.isQr = isQr;
		this.reportMno = reportMno;
		this.bStatus = bStatus;
		this.replyList = replyList;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public Date getWrittenDate() {
		return writtenDate;
	}

	public void setWrittenDate(Date writtenDate) {
		this.writtenDate = writtenDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public String getBtype() {
		return btype;
	}

	public void setBtype(String btype) {
		this.btype = btype;
	}

	public String getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}

	public int getRefBno() {
		return refBno;
	}

	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}

	public String getBemail() {
		return bemail;
	}

	public void setBemail(String bemail) {
		this.bemail = bemail;
	}

	public int getBbno() {
		return bbno;
	}

	public void setBbno(int bbno) {
		this.bbno = bbno;
	}

	public int getBwriter() {
		return bwriter;
	}

	public void setBwriter(int bwriter) {
		this.bwriter = bwriter;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public String getIsQr() {
		return isQr;
	}

	public void setIsQr(String isQr) {
		this.isQr = isQr;
	}

	public int getReportMno() {
		return reportMno;
	}

	public void setReportMno(int reportMno) {
		this.reportMno = reportMno;
	}

	public int getbStatus() {
		return bStatus;
	}

	public void setbStatus(int bStatus) {
		this.bStatus = bStatus;
	}

	public ArrayList<Reply> getReplyList() {
		return replyList;
	}

	public void setReplyList(ArrayList<Reply> replyList) {
		this.replyList = replyList;
	}

	@Override
	public String toString() {
		return "Board [bno=" + bno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", writtenDate=" + writtenDate
				+ ", modifyDate=" + modifyDate + ", bcount=" + bcount + ", btype=" + btype + ", questionType="
				+ questionType + ", refBno=" + refBno + ", bemail=" + bemail + ", bbno=" + bbno + ", bwriter=" + bwriter
				+ ", reportType=" + reportType + ", isQr=" + isQr + ", reportMno=" + reportMno + ", bStatus=" + bStatus
				+ ", replyList=" + replyList + "]";
	}
	
	
}
