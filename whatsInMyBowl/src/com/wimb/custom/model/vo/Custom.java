package com.wimb.custom.model.vo;

public class Custom {

	private String cuCode;
	private int mCode;
	private String cuName;
	private int cuPrice;
	private String cuMainImg;
	
	public Custom() {}

	public Custom(String cuCode, int mCode, String cuName, int cuPrice, String cuMainImg) {
		super();
		this.cuCode = cuCode;
		this.mCode = mCode;
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

	public int getmCode() {
		return mCode;
	}

	public void setmCode(int mCode) {
		this.mCode = mCode;
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

	public String getCuMainImg() {
		return cuMainImg;
	}

	public void setCuMainImg(String cuMainImg) {
		this.cuMainImg = cuMainImg;
	}

	@Override
	public String toString() {
		return "Custom [cuCode=" + cuCode + ", mCode=" + mCode + ", cuName=" + cuName + ", cuPrice=" + cuPrice
				+ ", cuMainImg=" + cuMainImg + "]";
	}
	
}
