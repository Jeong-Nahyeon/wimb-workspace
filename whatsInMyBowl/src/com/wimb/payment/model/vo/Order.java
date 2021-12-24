package com.wimb.payment.model.vo;

public class Order {
	
	private String oCode;
	private int mCode;
	private String pmCode;
	private int oAmount;
	private String oName;
	private String oAddress;
	private String oSubAddress;
	private int oZipCode;
	private String oPhone;
	private String oEmail;
	private String oRequest;
	private int oPoint;
	private String oCompany;
	private String oInvoice;
	private String oStatus;
	private String oDate;
	
	public Order() {}

	public Order(String oCode, int mCode, String pmCode, int oAmount, String oName, String oAddress,
			String oSubAddress, int oZipCode, String oPhone, String oEmail, String oRequest, int oPoint,
			String oCompany, String oInvoice, String oStatus, String oDate) {
		super();
		this.oCode = oCode;
		this.mCode = mCode;
		this.pmCode = pmCode;
		this.oAmount = oAmount;
		this.oName = oName;
		this.oAddress = oAddress;
		this.oSubAddress = oSubAddress;
		this.oZipCode = oZipCode;
		this.oPhone = oPhone;
		this.oEmail = oEmail;
		this.oRequest = oRequest;
		this.oPoint = oPoint;
		this.oCompany = oCompany;
		this.oInvoice = oInvoice;
		this.oStatus = oStatus;
		this.oDate = oDate;
	}
	
	public Order(int mCode, String pmCode, int oAmount, String oName, String oAddress, String oSubAddress,
			int oZipCode, String oPhone, String oEmail, String oRequest, int oPoint, String oStatus) {
		super();
		this.mCode = mCode;
		this.pmCode = pmCode;
		this.oAmount = oAmount;
		this.oName = oName;
		this.oAddress = oAddress;
		this.oSubAddress = oSubAddress;
		this.oZipCode = oZipCode;
		this.oPhone = oPhone;
		this.oEmail = oEmail;
		this.oRequest = oRequest;
		this.oPoint = oPoint;
		this.oStatus = oStatus;
	}
	

	public Order(String oCode, int mCode, String pmCode, String oName, String oAddress, String oSubAddress,
			int oZipCode, String oPhone, String oEmail, String oRequest, int oPoint, String oDate) {
		super();
		this.oCode = oCode;
		this.mCode = mCode;
		this.pmCode = pmCode;
		this.oName = oName;
		this.oAddress = oAddress;
		this.oSubAddress = oSubAddress;
		this.oZipCode = oZipCode;
		this.oPhone = oPhone;
		this.oEmail = oEmail;
		this.oRequest = oRequest;
		this.oPoint = oPoint;
		this.oDate = oDate;
	}

	public String getoCode() {
		return oCode;
	}

	public void setoCode(String oCode) {
		this.oCode = oCode;
	}

	public int getmCode() {
		return mCode;
	}

	public void setmCode(int mCode) {
		this.mCode = mCode;
	}

	public String getPmCode() {
		return pmCode;
	}

	public void setPmCode(String pmCode) {
		this.pmCode = pmCode;
	}

	public int getoAmount() {
		return oAmount;
	}

	public void setoAmount(int oAmount) {
		this.oAmount = oAmount;
	}

	public String getoName() {
		return oName;
	}

	public void setoName(String oName) {
		this.oName = oName;
	}

	public String getoAddress() {
		return oAddress;
	}

	public void setoAddress(String oAddress) {
		this.oAddress = oAddress;
	}

	public String getoSubAddress() {
		return oSubAddress;
	}

	public void setoSubAddress(String oSubAddress) {
		this.oSubAddress = oSubAddress;
	}

	public int getoZipCode() {
		return oZipCode;
	}

	public void setoZipCode(int oZipCode) {
		this.oZipCode = oZipCode;
	}

	public String getoPhone() {
		return oPhone;
	}

	public void setoPhone(String oPhone) {
		this.oPhone = oPhone;
	}

	public String getoEmail() {
		return oEmail;
	}

	public void setoEmail(String oEmail) {
		this.oEmail = oEmail;
	}

	public String getoRequest() {
		return oRequest;
	}

	public void setoRequest(String oRequest) {
		this.oRequest = oRequest;
	}

	public int getoPoint() {
		return oPoint;
	}

	public void setoPoint(int oPoint) {
		this.oPoint = oPoint;
	}

	public String getoCompany() {
		return oCompany;
	}

	public void setoCompany(String oCompany) {
		this.oCompany = oCompany;
	}

	public String getoInvoice() {
		return oInvoice;
	}

	public void setoInvoice(String oInvoice) {
		this.oInvoice = oInvoice;
	}

	public String getoStatus() {
		return oStatus;
	}

	public void setoStatus(String oStatus) {
		this.oStatus = oStatus;
	}

	public String getoDate() {
		return oDate;
	}

	public void setoDate(String oDate) {
		this.oDate = oDate;
	}

	@Override
	public String toString() {
		return "Order [oCode=" + oCode + ", mCode=" + mCode + ", pmCode=" + pmCode + ", oAmount=" + oAmount + ", oName="
				+ oName + ", oAddress=" + oAddress + ", oSubAddress=" + oSubAddress + ", oZipCode=" + oZipCode
				+ ", oPhone=" + oPhone + ", oEmail=" + oEmail + ", oRequest=" + oRequest + ", oPoint=" + oPoint
				+ ", oCompany=" + oCompany + ", oInvoice=" + oInvoice + ", oStatus=" + oStatus + ", oDate=" + oDate
				+ "]";
	}
	
}
