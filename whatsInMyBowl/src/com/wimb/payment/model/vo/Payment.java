package com.wimb.payment.model.vo;

public class Payment {
	
	private String pmCode;
	private String pmMethod;
	private String pmDate;
	private int pmTotalPrice;
	private int pmFinalPrice;
	
	public Payment(){}

	public Payment(String pmCode, String pmMethod, String pmDate, int pmTotalPrice, int pmFinalPrice) {
		super();
		this.pmCode = pmCode;
		this.pmMethod = pmMethod;
		this.pmDate = pmDate;
		this.pmTotalPrice = pmTotalPrice;
		this.pmFinalPrice = pmFinalPrice;
	}
	
	public Payment(int pmTotalPrice, int pmFinalPrice) {
		super();
		this.pmTotalPrice = pmTotalPrice;
		this.pmFinalPrice = pmFinalPrice;
	}

	public String getPmCode() {
		return pmCode;
	}

	public void setPmCode(String pmCode) {
		this.pmCode = pmCode;
	}

	public String getPmMethod() {
		return pmMethod;
	}

	public void setPmMethod(String pmMethod) {
		this.pmMethod = pmMethod;
	}

	public String getPmDate() {
		return pmDate;
	}

	public void setPmDate(String pmDate) {
		this.pmDate = pmDate;
	}

	public int getPmTotalPrice() {
		return pmTotalPrice;
	}

	public void setPmTotalPrice(int pmTotalPrice) {
		this.pmTotalPrice = pmTotalPrice;
	}

	public int getPmFinalPrice() {
		return pmFinalPrice;
	}

	public void setPmFinalPrice(int pmFinalPrice) {
		this.pmFinalPrice = pmFinalPrice;
	}

	@Override
	public String toString() {
		return "Payment [pmCode=" + pmCode + ", pmMethod=" + pmMethod + ", pmDate=" + pmDate + ", pmTotalPrice="
				+ pmTotalPrice + ", pmFinalPrice=" + pmFinalPrice + "]";
	}
	
}
