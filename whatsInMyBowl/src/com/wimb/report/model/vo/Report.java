package com.wimb.report.model.vo;

public class Report {
	
	private int reportCode;
	private int mCode;
	private int rCode;
	private String reportDate;
	private String reportCategory;
	private String reportContent;
	
	
	public Report () {}


	public Report(int reportCode, int mCode, int rCode, String reportDate, String reportCategory,
			String reportContent) {
		super();
		this.reportCode = reportCode;
		this.mCode = mCode;
		this.rCode = rCode;
		this.reportDate = reportDate;
		this.reportCategory = reportCategory;
		this.reportContent = reportContent;
	}
	

	public Report(int mCode, int rCode, String reportCategory, String reportContent) {
		super();
		this.mCode = mCode;
		this.rCode = rCode;
		this.reportCategory = reportCategory;
		this.reportContent = reportContent;
	}


	public int getReportCode() {
		return reportCode;
	}


	public void setReportCode(int reportCode) {
		this.reportCode = reportCode;
	}


	public int getmCode() {
		return mCode;
	}


	public void setmCode(int mCode) {
		this.mCode = mCode;
	}


	public int getrCode() {
		return rCode;
	}


	public void setrCode(int rCode) {
		this.rCode = rCode;
	}


	public String getReportDate() {
		return reportDate;
	}


	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}


	public String getReportCategory() {
		return reportCategory;
	}


	public void setReportCategory(String reportCategory) {
		this.reportCategory = reportCategory;
	}


	public String getReportContent() {
		return reportContent;
	}


	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}


	@Override
	public String toString() {
		return "Report [reportCode=" + reportCode + ", mCode=" + mCode + ", rCode=" + rCode + ", reportDate="
				+ reportDate + ", reportCategory=" + reportCategory + ", reportContent=" + reportContent + "]";
	}
	
}
