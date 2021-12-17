package com.wimb.admin.model.vo;

import java.sql.Date;

public class Banner {
	
	
	private int bCode;          // 배너번호
	private String bName;       // 배너명
	private Date startDate;     // 게시일
	private String status;      // 게시여부(Y|N)
	private String bPostion;    // 배너위치
	private String bPath;       // 배너이미지파일경로
	private String bOriginName; // 파일 원본명
	private String bChangeName; // 파일 수정명
	
	private String mainImg;     // 메인에 등록할 파일 경로
	
	public Banner() {}

	public Banner(int bCode, String bName, Date startDate, String status, String bPostion, String bPath,
			String bOriginName, String bChangeName) {
		super();
		this.bCode = bCode;
		this.bName = bName;
		this.startDate = startDate;
		this.status = status;
		this.bPostion = bPostion;
		this.bPath = bPath;
		this.bOriginName = bOriginName;
		this.bChangeName = bChangeName;
	}
	
	public Banner(String bName, String bPostion, String bPath, String bOriginName, String bChangeName) {
		super();
		this.bName = bName;
		this.bPostion = bPostion;
		this.bPath = bPath;
		this.bOriginName = bOriginName;
		this.bChangeName = bChangeName;
	}
 
	public Banner(int bCode, String bName, Date startDate, String status, String bPostion) {
		super();
		this.bCode = bCode;
		this.bName = bName;
		this.startDate = startDate;
		this.status = status;
		this.bPostion = bPostion;
	}

	public Banner(int bCode, String bName, String bOriginName) {
		super();
		this.bCode = bCode;
		this.bName = bName;
		this.bOriginName = bOriginName;
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

	public String getbOriginName() {
		return bOriginName;
	}

	public void setbOriginName(String bOriginName) {
		this.bOriginName = bOriginName;
	}

	public String getbChangeName() {
		return bChangeName;
	}

	public void setbChangeName(String bChangeName) {
		this.bChangeName = bChangeName;
	}

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	@Override
	public String toString() {
		return "Banner [bCode=" + bCode + ", bName=" + bName + ", startDate=" + startDate + ", status=" + status
				+ ", bPostion=" + bPostion + ", bPath=" + bPath + ", bOriginName=" + bOriginName + ", bChangeName="
				+ bChangeName + "]";
	}

	
	
}
