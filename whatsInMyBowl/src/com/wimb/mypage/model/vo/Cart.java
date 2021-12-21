package com.wimb.mypage.model.vo;

import java.sql.Date;

public class Cart {
	
	private int mCode;
	private String caCategory;
	private String caCode;
	private String caAmount;
	private Date caDate;
	
	public Cart() {}

	public Cart(int mCode, String caCategory, String caCode, String caAmount, Date caDate) {
		super();
		this.mCode = mCode;
		this.caCategory = caCategory;
		this.caCode = caCode;
		this.caAmount = caAmount;
		this.caDate = caDate;
	}

	public int getmCode() {
		return mCode;
	}

	public void setmCode(int mCode) {
		this.mCode = mCode;
	}

	public String getCaCategory() {
		return caCategory;
	}

	public void setCaCategory(String caCategory) {
		this.caCategory = caCategory;
	}

	public String getCaCode() {
		return caCode;
	}

	public void setCaCode(String caCode) {
		this.caCode = caCode;
	}

	public String getCaAmount() {
		return caAmount;
	}

	public void setCaAmount(String caAmount) {
		this.caAmount = caAmount;
	}

	public Date getCaDate() {
		return caDate;
	}

	public void setCaDate(Date caDate) {
		this.caDate = caDate;
	}

	@Override
	public String toString() {
		return "Cart [mCode=" + mCode + ", caCategory=" + caCategory + ", caCode=" + caCode + ", caAmount=" + caAmount
				+ ", caDate=" + caDate + "]";
	}
	
	

}
