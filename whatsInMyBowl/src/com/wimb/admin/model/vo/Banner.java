package com.wimb.admin.model.vo;

import java.sql.Date;

public class Banner {
	
	
	private int bCode;        // 배너번호
	private String bName;     // 배너명
	private Date startDate;   // 게시일
	private String status;    // 게시여부(Y|N)
	private String bPostion;  // 배너위치
	private String bPath;     // 배너이미지파일경로
	
	public Banner() {}

	public Banner(int bCode, String bName, Date startDate, String status, String bPostion, String bPath) {
		super();
		this.bCode = bCode;
		this.bName = bName;
		this.startDate = startDate;
		this.status = status;
		this.bPostion = bPostion;
		this.bPath = bPath;
	}

	public int getbCode() {
		return bCode;
	}

	public void setbCode(int bCode) {
		this.bCode = bCode;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getbPostion() {
		return bPostion;
	}

	public void setbPostion(String bPostion) {
		this.bPostion = bPostion;
	}

	public String getbPath() {
		return bPath;
	}

	public void setbPath(String bPath) {
		this.bPath = bPath;
	}

	@Override
	public String toString() {
		return "Banner [bCode=" + bCode + ", bName=" + bName + ", startDate=" + startDate + ", status=" + status
				+ ", bPostion=" + bPostion + ", bPath=" + bPath + "]";
	}
	
}
