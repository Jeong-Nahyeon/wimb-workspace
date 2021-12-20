package com.wimb.payment.model.vo;

public class PaymentCustom {
	
	private String cuCode;
	private String cuName;
	private int cuPrice;
	private int cuCount;
	private String cuMainImg;
	
	public PaymentCustom() {}
	
	public PaymentCustom(String cuCode, String cuName, int cuPrice, int cuCount, String cuMainImg) {
		super();
		this.cuCode = cuCode;
		this.cuName = cuName;
		this.cuPrice = cuPrice;
		this.cuCount = cuCount;
		this.cuMainImg = cuMainImg;
	}
	
	

	public PaymentCustom(String cuCode, String cuName, int cuPrice, String cuMainImg) {
		super();
		this.cuCode = cuCode;
		this.cuName = cuName;
		this.cuPrice = cuPrice;
		this.cuMainImg = cuMainImg;
	}

	public String getCuCode() {
		return cuCode;
	}

	public void setCuCode(String cuCode) {
		this.cuCode = cuCode;
	}

	public String getCuName() {
		return cuName;
	}

	public void setCuName(String cuName) {
		this.cuName = cuName;
	}

	public int getCuPrice() {
		return cuPrice;
	}

	public void setCuPrice(int cuPrice) {
		this.cuPrice = cuPrice;
	}

	public int getCuCount() {
		return cuCount;
	}

	public void setCuCount(int cuCount) {
		this.cuCount = cuCount;
	}

	public String getCuMainImg() {
		return cuMainImg;
	}

	public void setCuMainImg(String cuMainImg) {
		this.cuMainImg = cuMainImg;
	}

	@Override
	public String toString() {
		return "PaymentCustom [cuCode=" + cuCode + ", cuName=" + cuName + ", cuPrice=" + cuPrice + ", cuCount="
				+ cuCount + ", cuMainImg=" + cuMainImg + "]";
	}
	
	

}
