package com.wimb.customerService.model.vo;

import java.sql.Date;

public class Notice {

	private int noticeCode;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private int noticeView;
	private String noticeStatus;
	
	public Notice() {}

	public Notice(int noticeCode, String noticeTitle, String noticeContent, Date noticeDate, int noticeView,
			String noticeStatus) {
		super();
		this.noticeCode = noticeCode;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeView = noticeView;
		this.noticeStatus = noticeStatus;
	}
	
	public Notice(int noticeCode, String noticeTitle, Date noticeDate, int noticeView) {
		super();
		this.noticeCode = noticeCode;
		this.noticeTitle = noticeTitle;
		this.noticeDate = noticeDate;
		this.noticeView = noticeView;
	}
	
	public Notice(int noticeCode, String noticeTitle, String noticeContent, Date noticeDate, int noticeView) {
		super();
		this.noticeCode = noticeCode;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeView = noticeView;
	}
	
	public Notice(String noticeTitle, String noticeContent) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
	}
	
	
	public int getNoticeCode() {
		return noticeCode;
	}

	public void setNoticeCode(int noticeCode) {
		this.noticeCode = noticeCode;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public int getNoticeView() {
		return noticeView;
	}

	public void setNoticeView(int noticeView) {
		this.noticeView = noticeView;
	}

	public String getNoticeStatus() {
		return noticeStatus;
	}

	public void setNoticeStatus(String noticeStatus) {
		this.noticeStatus = noticeStatus;
	}

	@Override
	public String toString() {
		return "Notice [noticeCode=" + noticeCode + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeDate=" + noticeDate + ", noticeView=" + noticeView + ", noticeStatus=" + noticeStatus + "]";
	}
	
	
	
	
}
