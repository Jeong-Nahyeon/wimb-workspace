package com.wimb.report.model.vo;

public class Report {
	
	private int reportCode;	// 신고번호
	private int mCode; // 신고자회원번호 (신고작성회원)
	private int rCode; // 리뷰번호
	private String reportDate; // 신고날짜
	private String reportCategory; // 신고사유
	private String reportContent; // 신고상세내용
	private String reportAdminShow; // 관리자노출여부(Y | N)
	
	// 조회용 추가 필드
	private int reportedMemberCode; // 신고당한회원번호 (신고대상회원)
	private int mReportCount; // 누적신고횟수
	private String mId; // 회원아이디
	private String mName; // 회원명
	
	
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

	
	public Report(int reportCode, int mCode, int rCode, String reportDate, String reportCategory, String reportContent,
			int reportedMemberCode, int mReportCount) {
		super();
		this.reportCode = reportCode;
		this.mCode = mCode;
		this.rCode = rCode;
		this.reportDate = reportDate;
		this.reportCategory = reportCategory;
		this.reportContent = reportContent;
		this.reportedMemberCode = reportedMemberCode;
		this.mReportCount = mReportCount;
	}


	public Report(int reportCode, int mCode, int rCode, String reportDate, String reportCategory, String reportContent,
			int reportedMemberCode, int mReportCount, String mId) {
		super();
		this.reportCode = reportCode;
		this.mCode = mCode;
		this.rCode = rCode;
		this.reportDate = reportDate;
		this.reportCategory = reportCategory;
		this.reportContent = reportContent;
		this.reportedMemberCode = reportedMemberCode;
		this.mReportCount = mReportCount;
		this.mId = mId;
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
	

	public String getReportAdminShow() {
		return reportAdminShow;
	}


	public void setReportAdminShow(String reportAdminShow) {
		this.reportAdminShow = reportAdminShow;
	}


	public int getReportedMemberCode() {
		return reportedMemberCode;
	}


	public void setReportedMemberCode(int reportedMemberCode) {
		this.reportedMemberCode = reportedMemberCode;
	}


	public int getmReportCount() {
		return mReportCount;
	}


	public void setmReportCount(int mReportCount) {
		this.mReportCount = mReportCount;
	}

	
	public String getmId() {
		return mId;
	}
	
	
	public void setmId(String mId) {
		this.mId = mId;
	}

	
	public String getmName() {
		return mName;
	}
	
	
	public void setmName(String mName) {
		this.mName = mName;
	}
	
	
	
	@Override
	public String toString() {
		return "Report [reportCode=" + reportCode + ", mCode=" + mCode + ", rCode=" + rCode + ", reportDate="
				+ reportDate + ", reportCategory=" + reportCategory + ", reportContent=" + reportContent + "]";
	}




	
}
