package com.wimb.custom.model.vo;

public class CustomItem {

	private String cuCode;
	private String ciCode;
	private int ciAmount;
	
	public CustomItem() {}

	public CustomItem(String cuCode, String ciCode, int ciAmount) {
		super();
		this.cuCode = cuCode;
		this.ciCode = ciCode;
		this.ciAmount = ciAmount;
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

	public int getCiAmount() {
		return ciAmount;
	}

	public void setCiAmount(int ciAmount) {
		this.ciAmount = ciAmount;
	}

	@Override
	public String toString() {
		return "CustomItem [cuCode=" + cuCode + ", ciCode=" + ciCode + ", ciAmount=" + ciAmount + "]";
	}
	
}
