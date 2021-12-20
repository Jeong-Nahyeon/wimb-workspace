package com.wimb.payment.model.vo;

public class PaymentProduct {
	
	private String pCode;
	private String pName;
	private int pPrice;
	private int pCount;
	private String pMainImg;
	
	public PaymentProduct() {}

	public PaymentProduct(String pCode, String pName, int pPrice, int pCount, String pMainImg) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pCount = pCount;
		this.pMainImg = pMainImg;
	}
	

	public PaymentProduct(String pCode, String pName, String pMainImg) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.pMainImg = pMainImg;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getpCount() {
		return pCount;
	}

	public void setpCount(int pCount) {
		this.pCount = pCount;
	}

	public String getpMainImg() {
		return pMainImg;
	}

	public void setpMainImg(String pMainImg) {
		this.pMainImg = pMainImg;
	}

	@Override
	public String toString() {
		return "PaymentProduct [pCode=" + pCode + ", pName=" + pName + ", pPrice=" + pPrice + ", pCount=" + pCount
				+ ", pMainImg=" + pMainImg + "]";
	}
	

}
