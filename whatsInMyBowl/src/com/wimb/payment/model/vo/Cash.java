package com.wimb.payment.model.vo;

import java.util.Date;

public class Cash {
	
	private String pmCode;
	private String cashBank;
	private String cashName;
	private Date cashDate;
	private int cashAmount;
	private String cashCheck;
	
	public Cash() {}

	public Cash(String pmCode, String cashBank, String cashName, Date cashDate, int cashAmount, String cashCheck) {
		super();
		this.pmCode = pmCode;
		this.cashBank = cashBank;
		this.cashName = cashName;
		this.cashDate = cashDate;
		this.cashAmount = cashAmount;
		this.cashCheck = cashCheck;
	}

	
	public Cash(String cashBank, String cashName) {
		super();
		this.cashBank = cashBank;
		this.cashName = cashName;
	}

	public String getPmCode() {
		return pmCode;
	}

	public void setPmCode(String pmCode) {
		this.pmCode = pmCode;
	}

	public String getCashBank() {
		return cashBank;
	}

	public void setCashBank(String cashBank) {
		this.cashBank = cashBank;
	}

	public String getCashName() {
		return cashName;
	}

	public void setCashName(String cashName) {
		this.cashName = cashName;
	}

	public Date getCashDate() {
		return cashDate;
	}

	public void setCashDate(Date cashDate) {
		this.cashDate = cashDate;
	}

	public int getCashAmount() {
		return cashAmount;
	}

	public void setCashAmount(int cashAmount) {
		this.cashAmount = cashAmount;
	}

	public String getCashCheck() {
		return cashCheck;
	}

	public void setCashCheck(String cashCheck) {
		this.cashCheck = cashCheck;
	}

	@Override
	public String toString() {
		return "Cash [pmCode=" + pmCode + ", cashBank=" + cashBank + ", cashName=" + cashName + ", cashDate=" + cashDate
				+ ", cashAmount=" + cashAmount + ", cashCheck=" + cashCheck + "]";
	}
	
}
