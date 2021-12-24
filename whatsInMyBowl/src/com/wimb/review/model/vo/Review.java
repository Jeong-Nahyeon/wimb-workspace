package com.wimb.review.model.vo;

public class Review {
	
	private int rCode; // 리뷰번호
	private String orderCode; // 주문번호
	private int mCode; // 회원번호
	private String pCode; // 완제품 상품코드 | 상품명
	private String rContent; // 리뷰내용
	private String rDate; // 최종등록일
	private String rMainstatus; // 메인표시여부
	private String rStatus; // 게시여부
	private String mainImg; // 대표이미지
	
	private String mName; // 회원명 => 회원 코드와 같이 조회할 경우...
	
	
	public Review() {}


	public Review(int rCode, String orderCode, int mCode, String pCode, String rContent, String rDate,
			String rMainstatus, String rStatus, String mainImg) {
		super();
		this.rCode = rCode;
		this.orderCode = orderCode;
		this.mCode = mCode;
		this.pCode = pCode;
		this.rContent = rContent;
		this.rDate = rDate;
		this.rMainstatus = rMainstatus;
		this.rStatus = rStatus;
		this.mainImg = mainImg;
	}
	

	public Review(int rCode, int mCode, String pCode, String rContent, String rDate, String mainImg, String mName) {
		super();
		this.rCode = rCode;
		this.mCode = mCode;
		this.pCode = pCode;
		this.rContent = rContent;
		this.rDate = rDate;
		this.mainImg = mainImg;
		this.mName = mName;
	}
	

	public int getrCode() {
		return rCode;
	}


	public void setrCode(int rCode) {
		this.rCode = rCode;
	}


	public String getOrderCode() {
		return orderCode;
	}


	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}


	public int getmCode() {
		return mCode;
	}


	public void setmCode(int mCode) {
		this.mCode = mCode;
	}


	public String getpCode() {
		return pCode;
	}


	public void setpCode(String pCode) {
		this.pCode = pCode;
	}


	public String getrContent() {
		return rContent;
	}


	public void setrContent(String rContent) {
		this.rContent = rContent;
	}


	public String getrDate() {
		return rDate;
	}


	public void setrDate(String rDate) {
		this.rDate = rDate;
	}


	public String getrMainstatus() {
		return rMainstatus;
	}


	public void setrMainstatus(String rMainstatus) {
		this.rMainstatus = rMainstatus;
	}


	public String getrStatus() {
		return rStatus;
	}


	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}



	public String getmName() {
		return mName;
	}


	public void setmName(String mName) {
		this.mName = mName;
	}
	
	
	public String getMainImg() {
		return mainImg;
	}


	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}


	@Override
	public String toString() {
		return "Review [rCode=" + rCode + ", orderCode=" + orderCode + ", mCode=" + mCode + ", pCode=" + pCode
				+ ", rContent=" + rContent + ", rDate=" + rDate + ", rMainstatus=" + rMainstatus + ", rStatus="
				+ rStatus + "]";
	}

}
