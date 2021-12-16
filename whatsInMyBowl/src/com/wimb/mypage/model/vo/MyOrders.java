package com.wimb.mypage.model.vo;

import java.util.Date;

public class MyOrders {
	
	private String orderCode; 		   // 주문번호
	private int orderAmount;	   // 총수량
	private String orderCompany;   // 택배사
	private String orderInvoice;   // 운송장번호
	private String orderStatus;    // 주문상태
	private Date orderDate;		   // 주문날짜
	private String cuName;		   // 커스텀제품이름
	private String pName;		   // 완제품이름
	private String pMainImg;	   // 완제품 이미지
	private int pmTotalCost;       // 원결제금액
	
	private int statusCount;
	
	public int getStatusCount() {
		return statusCount;
	}

	public void setStatusCount(int statusCount) {
		this.statusCount = statusCount;
	}

	public MyOrders(int statusCount) {
		super();
		this.statusCount = statusCount;
	}

	public MyOrders() {}
	
	public MyOrders(String orderCode, int orderAmount, String orderCompany, String orderInvoice, String orderStatus,
			Date orderDate, String cuName, String pName, String pMainImg, int pmTotalCost) {
		super();
		this.orderCode = orderCode;
		this.orderAmount = orderAmount;
		this.orderCompany = orderCompany;
		this.orderInvoice = orderInvoice;
		this.orderStatus = orderStatus;
		this.orderDate = orderDate;
		this.cuName = cuName;
		this.pName = pName;
		this.pMainImg = pMainImg;
		this.pmTotalCost = pmTotalCost;
	}
	
	
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
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
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
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
	public String getpMainImg() {
		return pMainImg;
	}
	public void setpMainImg(String pMainImg) {
		this.pMainImg = pMainImg;
	}
	public int getPmTotalCost() {
		return pmTotalCost;
	}
	public void setPmTotalCost(int pmTotalCost) {
		this.pmTotalCost = pmTotalCost;
	}

	@Override
	public String toString() {
		return "MyOrders [orderCode=" + orderCode + ", orderAmount=" + orderAmount + ", orderCompany=" + orderCompany
				+ ", orderInvoice=" + orderInvoice + ", orderStatus=" + orderStatus + ", orderDate=" + orderDate
				+ ", cuName=" + cuName + ", pName=" + pName + ", pMainImg=" + pMainImg + ", pmTotalCost=" + pmTotalCost
				+ ", statusCount=" + statusCount + "]";
	}
	
	
	
	
	
	
	

	

}
