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
	
	public Orders() {}

	public Orders(String orderCode, int mCode, String pmCode, int amount, String mName, String address,
			String subAddress, int zipCode, String phone, String email, String request, int point, String company,
			String invoice, String status, Date orderDate) {
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

	@Override
	public String toString() {
		return "Orders [orderCode=" + orderCode + ", mCode=" + mCode + ", pmCode=" + pmCode + ", amount=" + amount
				+ ", mName=" + mName + ", address=" + address + ", subAddress=" + subAddress + ", zipCode=" + zipCode
				+ ", phone=" + phone + ", email=" + email + ", request=" + request + ", point=" + point + ", company="
				+ company + ", invoice=" + invoice + ", status=" + status + ", orderDate=" + orderDate + "]";
	}
	
	

}
