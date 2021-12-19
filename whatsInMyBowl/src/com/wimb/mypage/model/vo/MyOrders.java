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
	private String cuMainImg;	   // 커스텀제품이미지
	private String pName;		   // 완제품이름
	private String pMainImg;	   // 완제품 이미지
	private int pmTotalCost;       // 원결제금액
	private String pmCode;		   // 결제번호
	private String filePath;       // 저장경로
	
	// 메인페이지에서만 사용
	private int statusCount;	   // 주문상태별 갯수
	
	// 취소|환불 조회시 사용
	private int pmFinalCost;	   // 최종결제금액
	private String cancelCode;	   // 취소코드
	private String cancelStatus;    // 취소처리상태
	private Date cancelCompDate;   // 처리일자
	private String reCode;		   // 환불코드
	private String rStatus;		   // 환불처리상태
	private Date rcompDate;        // 처리일자
	private String cReason;        // 취소사유
	private String rReason;        // 환불사유





	public MyOrders() {}

	// 주문만조회시 사용
	public MyOrders(String orderCode, int orderAmount, String orderCompany, String orderInvoice, String orderStatus,
			Date orderDate, String cuName, String cuMainImg, String pName, String pMainImg, int pmTotalCost,
			String pmCode, String filePath) {
		super();
		this.orderCode = orderCode;
		this.orderAmount = orderAmount;
		this.orderCompany = orderCompany;
		this.orderInvoice = orderInvoice;
		this.orderStatus = orderStatus;
		this.orderDate = orderDate;
		this.cuName = cuName;
		this.cuMainImg = cuMainImg;
		this.pName = pName;
		this.pMainImg = pMainImg;
		this.pmTotalCost = pmTotalCost;
		this.pmCode = pmCode;
		this.filePath = filePath;
	}

	
	
	// 취소|환불 조회시 사용
	public MyOrders(String orderCode, int orderAmount, String orderStatus, Date orderDate, String cuName,
			String cuMainImg, String pName, String pMainImg, int pmTotalCost, String filePath,
			int pmFinalCost, String cancelCode, String cancelStatus, Date cancelCompDate, String reCode, String rStatus,
			Date rcompDate) {
		super();
		this.orderCode = orderCode;
		this.orderAmount = orderAmount;
		this.orderStatus = orderStatus;
		this.orderDate = orderDate;
		this.cuName = cuName;
		this.cuMainImg = cuMainImg;
		this.pName = pName;
		this.pMainImg = pMainImg;
		this.pmTotalCost = pmTotalCost;
		this.filePath = filePath;
		this.pmFinalCost = pmFinalCost;
		this.cancelCode = cancelCode;
		this.cancelStatus = cancelStatus;
		this.cancelCompDate = cancelCompDate;
		this.reCode = reCode;
		this.rStatus = rStatus;
		this.rcompDate = rcompDate;
	}


	// 취소|환불 상세조회시 사용
	public MyOrders(String orderCode, int orderAmount, Date orderDate, String cuName, String pName, int pmTotalCost,
			 int pmFinalCost, String cancelCode, String cancelStatus,
			Date cancelCompDate, String reCode, String rStatus, Date rcompDate, String cReason, String rReason) {
		super();
		this.orderCode = orderCode;
		this.orderAmount = orderAmount;
		this.orderDate = orderDate;
		this.cuName = cuName;
		this.pName = pName;
		this.pmTotalCost = pmTotalCost;
		this.pmFinalCost = pmFinalCost;
		this.cancelCode = cancelCode;
		this.cancelStatus = cancelStatus;
		this.cancelCompDate = cancelCompDate;
		this.reCode = reCode;
		this.rStatus = rStatus;
		this.rcompDate = rcompDate;
		this.cReason = cReason;
		this.rReason = rReason;
	}

	public String getcReason() {
		return cReason;
	}

	public void setcReason(String cReason) {
		this.cReason = cReason;
	}

	public String getrReason() {
		return rReason;
	}

	public void setrReason(String rReason) {
		this.rReason = rReason;
	}

	public String getReCode() {
		return reCode;
	}

	public void setReCode(String reCode) {
		this.reCode = reCode;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public Date getRcompDate() {
		return rcompDate;
	}

	public void setRcompDate(Date rcompDate) {
		this.rcompDate = rcompDate;
	}

	public String getCancelStatus() {
		return cancelStatus;
	}


	public void setCancelStatus(String canceStatus) {
		this.cancelStatus = cancelStatus;
	}


	public MyOrders(int statusCount) {
		super();
		this.statusCount = statusCount;
	}
	
	
	public int getPmFinalCost() {
		return pmFinalCost;
	}
	
	
	public void setPmFinalCost(int pmFinalCost) {
		this.pmFinalCost = pmFinalCost;
	}
	
	
	public String getCancelCode() {
		return cancelCode;
	}
	
	
	public void setCancelCode(String cancelCode) {
		this.cancelCode = cancelCode;
	}
	
	
	public Date getCancelCompDate() {
		return cancelCompDate;
	}
	
	
	public void setCancelCompDate(Date cancelCompDate) {
		this.cancelCompDate = cancelCompDate;
	}
	

	public String getPmCode() {
		return pmCode;
	}
	
	public void setPmCode(String pmCode) {
		this.pmCode = pmCode;
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

	public String getCuMainImg() {
		return cuMainImg;
	}

	public void setCuMainImg(String cuMainImg) {
		this.cuMainImg = cuMainImg;
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

	public int getStatusCount() {
		return statusCount;
	}

	public void setStatusCount(int statusCount) {
		this.statusCount = statusCount;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
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
				+ ", cuName=" + cuName + ", cuMainImg=" + cuMainImg + ", pName=" + pName + ", pMainImg=" + pMainImg
				+ ", pmTotalCost=" + pmTotalCost + ", pmCode=" + pmCode + ", filePath=" + filePath + ", statusCount="
				+ statusCount + ", pmFinalCost=" + pmFinalCost + ", cancelCode=" + cancelCode + ", cancelStatus="
				+ cancelStatus + ", cancelCompDate=" + cancelCompDate + ", reCode=" + reCode + ", rStatus=" + rStatus
				+ ", rcompDate=" + rcompDate + ", cReason=" + cReason + ", rReason=" + rReason + "]";
	}

	

}
