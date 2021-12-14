package com.wimb.mypage.model.vo;

import java.util.Date;

public class MyOrders {
	
	private int orderCode; 		   // 주문번호
	private int orderAmount;	   // 총수량
	private String orderCompany;   // 택배사
	private String orderInvoice;   // 운송장번호
	private String orederStatus;   // 주문상태
	private Date orderDate;		   // 주문날짜
	
	public MyOrders() {}
	
	public MyOrders(int orderCode, int orderAmount, String orderCompany, String orderInvoice, String orederStatus,
			Date orderDate) {
		super();
		this.orderCode = orderCode;
		this.orderAmount = orderAmount;
		this.orderCompany = orderCompany;
		this.orderInvoice = orderInvoice;
		this.orederStatus = orederStatus;
		this.orderDate = orderDate;
	}

	public int getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}

	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getOrderCompany() {
		return orderCompany;
	}

	public void setOrderCompany(String orderCompany) {
		this.orderCompany = orderCompany;
	}

	public String getOrderInvoice() {
		return orderInvoice;
	}

	public void setOrderInvoice(String orderInvoice) {
		this.orderInvoice = orderInvoice;
	}

	public String getOrederStatus() {
		return orederStatus;
	}

	public void setOrederStatus(String orederStatus) {
		this.orederStatus = orederStatus;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "MyOrders [orderCode=" + orderCode + ", orderAmount=" + orderAmount + ", orderCompany=" + orderCompany
				+ ", orderInvoice=" + orderInvoice + ", orederStatus=" + orederStatus + ", orderDate=" + orderDate
				+ "]";
	}
	
	
	

}
