package com.wimb.mypage.model.vo;

import java.util.Date;

public class Orders {
	
	private String orderCode;
	private int mCode;
	private String pmCode;
	private int amount;
	private String mName;
	private String address;
	private String subAddress;
	private int zipCode;
	private String phone;
	private String email;
	private String request;
	private int point;
	private String company;
	private String invoice;
	private String status;
	private Date orderDate;
	private int rNum;
	private String pCode;
	private String pName;
	private String cuCode;
	private String cuName;
	private int totalCost;
	private int finalCost;
	private String pmMethod;
	
	public Orders() {}
	
	// 리스트 조회용
	public Orders(String orderCode, int mCode, String pmCode, int amount, String mName, String address,
			String subAddress, int zipCode, String phone, String email, String request, int point, String company,
			String invoice, String status, Date orderDate, int rNum, String pCode, String pName, String cuCode,
			String cuName, int totalCost, int finalCost, String pmMethod) {
		super();
		this.orderCode = orderCode;
		this.mCode = mCode;
		this.pmCode = pmCode;
		this.amount = amount;
		this.mName = mName;
		this.address = address;
		this.subAddress = subAddress;
		this.zipCode = zipCode;
		this.phone = phone;
		this.email = email;
		this.request = request;
		this.point = point;
		this.company = company;
		this.invoice = invoice;
		this.status = status;
		this.orderDate = orderDate;
		this.rNum = rNum;
		this.pCode = pCode;
		this.pName = pName;
		this.cuCode = cuCode;
		this.cuName = cuName;
		this.totalCost = totalCost;
		this.finalCost = finalCost;
		this.pmMethod = pmMethod;
	}
	
	// 상세조회용
	public Orders(String orderCode, String mName, String address, String subAddress, int zipCode, String phone,
			String email, String request, int point, Date orderDate, String pCode, String pName, String cuCode, String cuName
			, String company, String invoice) {
		super();
		this.orderCode = orderCode;
		this.mName = mName;
		this.address = address;
		this.subAddress = subAddress;
		this.zipCode = zipCode;
		this.phone = phone;
		this.email = email;
		this.request = request;
		this.point = point;
		this.orderDate = orderDate;
		this.pCode = pCode;
		this.pName = pName;
		this.cuCode = cuCode;
		this.cuName = cuName;
		this.company = company;
		this.invoice = invoice;
	}
	
	
	

	public Orders(String orderCode, String mName, String address, String subAddress, int zipCode, String phone,
			String email, String request, int point, String company, String invoice, String status, Date orderDate,
			String pCode, String pName, String cuCode, String cuName) {
		super();
		this.orderCode = orderCode;
		this.mName = mName;
		this.address = address;
		this.subAddress = subAddress;
		this.zipCode = zipCode;
		this.phone = phone;
		this.email = email;
		this.request = request;
		this.point = point;
		this.company = company;
		this.invoice = invoice;
		this.status = status;
		this.orderDate = orderDate;
		this.pCode = pCode;
		this.pName = pName;
		this.cuCode = cuCode;
		this.cuName = cuName;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSubAddress() {
		return subAddress;
	}

	public void setSubAddress(String subAddress) {
		this.subAddress = subAddress;
	}

	public int getZipCode() {
		return zipCode;
	}

	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getInvoice() {
		return invoice;
	}

	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
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

	public int getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(int totalCost) {
		this.totalCost = totalCost;
	}

	public int getFinalCost() {
		return finalCost;
	}

	public void setFinalCost(int finalCost) {
		this.finalCost = finalCost;
	}

	public String getPmMethod() {
		return pmMethod;
	}

	public void setPmMethod(String pmMethod) {
		this.pmMethod = pmMethod;
	}

	@Override
	public String toString() {
		return "Orders [orderCode=" + orderCode + ", mCode=" + mCode + ", pmCode=" + pmCode + ", amount=" + amount
				+ ", mName=" + mName + ", address=" + address + ", subAddress=" + subAddress + ", zipCode=" + zipCode
				+ ", phone=" + phone + ", email=" + email + ", request=" + request + ", point=" + point + ", company="
				+ company + ", invoice=" + invoice + ", status=" + status + ", orderDate=" + orderDate + ", rNum="
				+ rNum + ", pCode=" + pCode + ", pName=" + pName + ", cuCode=" + cuCode + ", cuName=" + cuName
				+ ", totalCost=" + totalCost + ", finalCost=" + finalCost + ", pmMethod=" + pmMethod + "]";
	}

	
}
