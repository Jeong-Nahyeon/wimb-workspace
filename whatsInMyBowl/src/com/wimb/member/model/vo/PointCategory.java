package com.wimb.member.model.vo;

public class PointCategory {

	private int pointTypeCode;
	private String pointName;
	private int pointAmount;
	
	public PointCategory() {}

	public PointCategory(int pointTypeCode, String pointName, int pointAmount) {
		super();
		this.pointTypeCode = pointTypeCode;
		this.pointName = pointName;
		this.pointAmount = pointAmount;
	}

	public int getPointTypeCode() {
		return pointTypeCode;
	}

	public void setPointTypeCode(int pointTypeCode) {
		this.pointTypeCode = pointTypeCode;
	}

	public String getPointName() {
		return pointName;
	}

	public void setPointName(String pointName) {
		this.pointName = pointName;
	}

	public int getPointAmount() {
		return pointAmount;
	}

	public void setPointAmount(int pointAmount) {
		this.pointAmount = pointAmount;
	}

	@Override
	public String toString() {
		return "PointCategory [pointTypeCode=" + pointTypeCode + ", pointName=" + pointName + ", pointAmount="
				+ pointAmount + "]";
	}
	
	
}
