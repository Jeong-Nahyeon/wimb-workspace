package com.wimb.custom.model.vo;

public class CustomItemList {
    
    private String cuCode;
	private String ciCode;
	private String ciName;
	private String ciCategory;
	private String cuName;
	private int cuPrice;
	private int mCode;
	
	public CustomItemList() {}

	public CustomItemList(String cuCode, String ciCode, String ciName, String ciCategory, String cuName, int cuPrice,
			int mCode) {
		super();
		this.cuCode = cuCode;
		this.ciCode = ciCode;
		this.ciName = ciName;
		this.ciCategory = ciCategory;
		this.cuName = cuName;
		this.cuPrice = cuPrice;
		this.mCode = mCode;
	}

	public String getCuCode() {
		return cuCode;
	}

	public void setCuCode(String cuCode) {
		this.cuCode = cuCode;
	}

	public String getCiCode() {
		return ciCode;
	}

	public void setCiCode(String ciCode) {
		this.ciCode = ciCode;
	}

	public String getCiName() {
		return ciName;
	}

	public void setCiName(String ciName) {
		this.ciName = ciName;
	}

	public String getCiCategory() {
		return ciCategory;
	}

	public void setCiCategory(String ciCategory) {
		this.ciCategory = ciCategory;
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

	public int getmCode() {
		return mCode;
	}

	public void setmCode(int mCode) {
		this.mCode = mCode;
	}

	@Override
	public String toString() {
		return "CustomItemList [cuCode=" + cuCode + ", ciCode=" + ciCode + ", ciName=" + ciName + ", ciCategory="
				+ ciCategory + ", cuName=" + cuName + ", cuPrice=" + cuPrice + ", mCode=" + mCode + "]";
	}
	
}
