package com.wimb.member.model.vo;

import java.sql.Date;

public class Point {
	
	private int pointCode;
	private int mCode;
	private String orderCode;
	private int pointTypeCode;
	private int point;
	private String pointReason;
	private String modifyDate;
	
	// 포인트 전체조회문시 필요한 변수 세팅
	private String mId;
	private String pointName;
	private int mPoint;
	
	// 전체포인트 조회시 필요한 변수
	private int ttlPoint;
	

	public Point() {}

	public Point(int pointCode, int mCode, String orderCode, int pointTypeCode, int point, String pointReason) {
		super();
		this.pointCode = pointCode;
		this.mCode = mCode;
		this.orderCode = orderCode;
		this.pointTypeCode = pointTypeCode;
		this.point = point;
		this.pointReason = pointReason;
	}

	
	// 포인트 전체조회용
	public Point(int mCode, String mId, String orderCode, String pointName ,int point, String pointReason, String modifyDate,
			int mPoint, int pointTypeCode) {
		super();
		this.mCode = mCode;
		this.orderCode = orderCode;
		this.point = point;
		this.pointReason = pointReason;
		this.modifyDate = modifyDate;
		this.mId = mId;
		this.pointName = pointName;
		this.mPoint = mPoint;
		this.pointTypeCode = pointTypeCode;
	}

	
	
	public int getTtlPoint() {
		return ttlPoint;
	}
	
	public void setTtlPoint(int ttlPoint) {
		this.ttlPoint = ttlPoint;
	}
	public int getmPoint() {
		return mPoint;
	}

	public void setmPoint(int mPoint) {
		this.mPoint = mPoint;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getPointName() {
		return pointName;
	}

	public void setPointName(String pointName) {
		this.pointName = pointName;
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

	public String getPointReason() {
		return pointReason;
	}

	public void setPointReason(String pointReason) {
		this.pointReason = pointReason;
	}

	@Override
	public String toString() {
		return "Point [pointCode=" + pointCode + ", mCode=" + mCode + ", orderCode=" + orderCode + ", pointTypeCode="
				+ pointTypeCode + ", point=" + point + ", pointReason=" + pointReason + "]";
	}
	
	

}
