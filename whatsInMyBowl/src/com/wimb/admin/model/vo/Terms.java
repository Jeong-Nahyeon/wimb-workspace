package com.wimb.admin.model.vo;

import java.sql.Date;

public class Terms {
	
	private int termsCode;          // 글번호
	private String termsCategory;   // 카테고리 (이용약관,개인정보수집)
	private String termsContent;    // 내용
	private Date termsDate;         // 수정일자
	
	public Terms() {}

	public Terms(int termsCode, String termsCategory, String termsContent, Date termsDate) {
		super();
		this.termsCode = termsCode;
		this.termsCategory = termsCategory;
		this.termsContent = termsContent;
		this.termsDate = termsDate;
	}

	public int getTermsCode() {
		return termsCode;
	}

	public void setTermsCode(int termsCode) {
		this.termsCode = termsCode;
	}

	public String getTermsCategory() {
		return termsCategory;
	}

	public void setTermsCategory(String termsCategory) {
		this.termsCategory = termsCategory;
	}

	public String getTermsContent() {
		return termsContent;
	}

	public void setTermsContent(String termsContent) {
		this.termsContent = termsContent;
	}

	public Date getTermsDate() {
		return termsDate;
	}

	public void setTermsDate(Date termsDate) {
		this.termsDate = termsDate;
	}

	@Override
	public String toString() {
		return "Terms [termsCode=" + termsCode + ", termsCategory=" + termsCategory + ", termsContent=" + termsContent
				+ ", termsDate=" + termsDate + "]";
	}
	

}
