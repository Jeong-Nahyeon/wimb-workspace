package com.wimb.customerService.model.vo;

import java.sql.Date;

public class Inquiry {
	
	private int iCode;			// 1:1문의 글번호
	private int mCode;          // 회원번호
	private String iCategory;	// 문의유형(결제관련, 홈페이지이용, 배송, 상품, 취소/환불, 기타) 
	private String iTitle;      // 글제목
	private String iContent;    // 내용
	private String iAnswer;     // 답변여부 (Y|N)
	private  Date iDate;        // 최종작성일
	private String aContent;    // 답변내용
	private Date aDate;         // 답변일
	private String iStatus;     // 게시여부(Y|N)

	private String mName;		// 회원명
	
	public Inquiry(int iCode, int mCode, String iCategory, String iTitle, String iContent, String iAnswer, Date iDate,
			String aContent, Date aDate, String iStatus) {
		super();
		this.iCode = iCode;
		this.mCode = mCode;
		this.iCategory = iCategory;
		this.iTitle = iTitle;
		this.iContent = iContent;
		this.iAnswer = iAnswer;
		this.iDate = iDate;
		this.aContent = aContent;
		this.aDate = aDate;
		this.iStatus = iStatus;
	}
	
	public Inquiry(int mCode, String iCategory, String iTitle, String iContent) {
		super();
		this.mCode = mCode;
		this.iCategory = iCategory;
		this.iTitle = iTitle;
		this.iContent = iContent;
	}
	
	
	public Inquiry(int iCode, int mCode, String iCategory, String iTitle, String iContent) {
		super();
		this.iCode = iCode;
		this.mCode = mCode;
		this.iCategory = iCategory;
		this.iTitle = iTitle;
		this.iContent = iContent;
	}
		
	public Inquiry(int iCode, int mCode, String iCategory, String iTitle, String iContent, String iAnswer, Date iDate) {
		super();
		this.iCode = iCode;
		this.mCode = mCode;
		this.iCategory = iCategory;
		this.iTitle = iTitle;
		this.iContent = iContent;
		this.iAnswer = iAnswer;
		this.iDate = iDate;
	}
	
	public Inquiry(int iCode, int mCode, String iCategory, String iTitle, String iContent, String iAnswer, Date iDate,
			String aContent, Date aDate) {
		super();
		this.iCode = iCode;
		this.mCode = mCode;
		this.iCategory = iCategory;
		this.iTitle = iTitle;
		this.iContent = iContent;
		this.iAnswer = iAnswer;
		this.iDate = iDate;
		this.aContent = aContent;
		this.aDate = aDate;
	}
	
	public Inquiry(int iCode, String mName, String iCategory, String iTitle, String iContent, String iAnswer, Date iDate) {
		super();
		this.iCode = iCode;
		this.mName = mName;
		this.iCategory = iCategory;
		this.iTitle = iTitle;
		this.iContent = iContent;
		this.iAnswer = iAnswer;
		this.iDate = iDate;
	}

	
	public Inquiry(int iCode, String mName, String iCategory, String iTitle, String iContent, String iAnswer, Date iDate,
			String aContent, Date aDate) {
		super();
		this.iCode = iCode;
		this.iCategory = iCategory;
		this.iTitle = iTitle;
		this.iContent = iContent;
		this.iAnswer = iAnswer;
		this.iDate = iDate;
		this.aContent = aContent;
		this.aDate = aDate;
		this.mName = mName;
	}
	
	
	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public int getiCode() {
		return iCode;
	}

	public void setiCode(int iCode) {
		this.iCode = iCode;
	}

	public int getmCode() {
		return mCode;
	}

	public void setmCode(int mCode) {
		this.mCode = mCode;
	}

	public String getiCategory() {
		return iCategory;
	}

	public void setiCategory(String iCategory) {
		this.iCategory = iCategory;
	}

	public String getiTitle() {
		return iTitle;
	}

	public void setiTitle(String iTitle) {
		this.iTitle = iTitle;
	}

	public String getiContent() {
		return iContent;
	}

	public void setiContent(String iContent) {
		this.iContent = iContent;
	}

	public String getiAnswer() {
		return iAnswer;
	}

	public void setiAnswer(String iAnswer) {
		this.iAnswer = iAnswer;
	}

	public Date getiDate() {
		return iDate;
	}

	public void setiDate(Date iDate) {
		this.iDate = iDate;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public Date getaDate() {
		return aDate;
	}

	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}

	public String getiStatus() {
		return iStatus;
	}

	public void setiStatus(String iStatus) {
		this.iStatus = iStatus;
	}

	@Override
	public String toString() {
		return "Inquiry [iCode=" + iCode + ", mCode=" + mCode + ", iCategory=" + iCategory + ", iTitle=" + iTitle
				+ ", iContent=" + iContent + ", iAnswer=" + iAnswer + ", iDate=" + iDate + ", aContent=" + aContent
				+ ", aDate=" + aDate + ", iStatus=" + iStatus + "]";
	}
	
	
}
