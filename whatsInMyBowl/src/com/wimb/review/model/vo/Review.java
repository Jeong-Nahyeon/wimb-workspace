package com.wimb.review.model.vo;

public class Review {
	
	private int rCode; // 리뷰번호
	private String orderCode; // 주문번호
	private int mCode; // 회원번호
	private String pCode; // 완제품 상품코드 
	private String rContent; // 리뷰내용
	private String rDate; // 최종등록일
	private String rMainstatus; // 메인표시여부
	private String rStatus; // 게시여부
	private String mainImg; // 대표이미지
	private String pointStatus;
	
	private String mName; // 회원명 => 회원 코드와 같이 조회할 경우...
	private String mId; // 회원 아이디
	private String pName; // 상품명
	
	public Review() {}


	public Review(int rCode, String orderCode, int mCode, String pCode, String rContent, String rDate,
			String rMainstatus, String rStatus, String mainImg, String pointStatus) {
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
		this.pointStatus = pointStatus;
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
	
	

	public Review(int rCode, String pCode, String rContent, String rDate, String rMainstatus, String rStatus,
			String pointStatus, String mName) {
		super();
		this.rCode = rCode;
		this.pCode = pCode;
		this.rContent = rContent;
		this.rDate = rDate;
		this.rMainstatus = rMainstatus;
		this.rStatus = rStatus;
		this.pointStatus = pointStatus;
		this.mName = mName;
	}


	public Review(int rCode, int mCode, String pCode, String rContent, String rDate, String mainImg, String mName,
			String pName) {
		super();
		this.rCode = rCode;
		this.mCode = mCode;
		this.pCode = pCode;
		this.rContent = rContent;
		this.rDate = rDate;
		this.mainImg = mainImg;
		this.mName = mName;
		this.pName = pName;
	}


	public Review(int rCode, int mCode, String pCode, String rContent, String mainImg, String pName) {
		super();
		this.rCode = rCode;
		this.mCode = mCode;
		this.pCode = pCode;
		this.rContent = rContent;
		this.mainImg = mainImg;
		this.pName = pName;
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
	

	public String getPointStatus() {
		return pointStatus;
	}


	public void setPointStatus(String pointStatus) {
		this.pointStatus = pointStatus;
	}

	
	public String getmId() {
		return mId;
	}
	
	
	public void setmId(String mId) {
		this.mId = mId;
	}

	
	
	public String getpName() {
		return pName;
	}
	
	
	public void setpName(String pName) {
		this.pName = pName;
	}
	
	
	@Override
	public String toString() {
		return "Review [rCode=" + rCode + ", orderCode=" + orderCode + ", mCode=" + mCode + ", pCode=" + pCode
				+ ", rContent=" + rContent + ", rDate=" + rDate + ", rMainstatus=" + rMainstatus + ", rStatus="
				+ rStatus + "]";
	}




}
