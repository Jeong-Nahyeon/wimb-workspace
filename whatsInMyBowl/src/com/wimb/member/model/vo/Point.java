package com.wimb.member.model.vo;

public class Point {
	
	private int pointCode;
	private int mCode;
	private String orderCode;
	private int pointTypeCode;
	private int point;
	private String pointDeduct;
	
	public Point() {}

	public Point(int pointCode, int mCode, String orderCode, int pointTypeCode, int point, String pointDeduct) {
		super();
		this.pointCode = pointCode;
		this.mCode = mCode;
		this.orderCode = orderCode;
		this.pointTypeCode = pointTypeCode;
		this.point = point;
		this.pointDeduct = pointDeduct;
	}

	public int getPointCode() {
		return pointCode;
	}

	public void setPointCode(int pointCode) {
		this.pointCode = pointCode;
	}

	public int getmCode() {
		return mCode;
	}

	public void setmCode(int mCode) {
		this.mCode = mCode;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public int getPointTypeCode() {
		return pointTypeCode;
	}

	public void setPointTypeCode(int pointTypeCode) {
		this.pointTypeCode = pointTypeCode;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getPointDeduct() {
		return pointDeduct;
	}

	public void setPointDeduct(String pointDeduct) {
		this.pointDeduct = pointDeduct;
	}

	@Override
	public String toString() {
		return "Point [pointCode=" + pointCode + ", mCode=" + mCode + ", orderCode=" + orderCode + ", pointTypeCode="
				+ pointTypeCode + ", point=" + point + ", pointDeduct=" + pointDeduct + "]";
	}
	
	

}
