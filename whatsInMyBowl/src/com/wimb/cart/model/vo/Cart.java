package com.wimb.cart.model.vo;

public class Cart {
	
	private int mCode;
	private String cuCode;
	private String pCode;
	private int caAmount;
	private String caDate;
	private String cuName;
	private String pName;
	private int cuPrice;
	private int pPrice;
	
	public Cart() {}

	public Cart(int mCode, String cuCode, String pCode, int caAmount, String caDate, String cuName, String pName,
			int cuPrice, int pPrice) {
		super();
		this.mCode = mCode;
		this.cuCode = cuCode;
		this.pCode = pCode;
		this.caAmount = caAmount;
		this.caDate = caDate;
		this.cuName = cuName;
		this.pName = pName;
		this.cuPrice = cuPrice;
		this.pPrice = pPrice;
	}

	public Cart(int mCode, String cuCode, String pCode, int caAmount, String cuName, String pName, int cuPrice,
			int pPrice) {
		super();
		this.mCode = mCode;
		this.cuCode = cuCode;
		this.pCode = pCode;
		this.caAmount = caAmount;
		this.cuName = cuName;
		this.pName = pName;
		this.cuPrice = cuPrice;
		this.pPrice = pPrice;
	}

	public int getmCode() {
		return mCode;
	}

	public void setmCode(int mCode) {
		this.mCode = mCode;
	}

	public String getCuCode() {
		return cuCode;
	}

	public void setCuCode(String cuCode) {
		this.cuCode = cuCode;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public int getCaAmount() {
		return caAmount;
	}

	public void setCaAmount(int caAmount) {
		this.caAmount = caAmount;
	}

	public String getCaDate() {
		return caDate;
	}

	public void setCaDate(String caDate) {
		this.caDate = caDate;
	}

	public String getCuName() {
		return cuName;
	}

	public void setCuName(String cuName) {
		this.cuName = cuName;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	
	public int getCuPrice() {
		return cuPrice;
	}

	public void setCuPrice(int cuPrice) {
		this.cuPrice = cuPrice;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	@Override
	public String toString() {
		return "Cart [mCode=" + mCode + ", cuCode=" + cuCode + ", pCode=" + pCode + ", caAmount=" + caAmount
				+ ", caDate=" + caDate + ", cuName=" + cuName + ", pName=" + pName + "]";
	}

	

	
	

}
