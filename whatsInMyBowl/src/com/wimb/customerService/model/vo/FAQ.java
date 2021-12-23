package com.wimb.customerService.model.vo;

public class FAQ {
	
	private int faqCode;
	private String faqCategory;
	private String faqTitle;
	private String faqContent;
	private String faqShow;
	
	public FAQ() {}

	public FAQ(int faqCode, String faqCategory, String faqTitle, String faqContent, String faqShow) {
		super();
		this.faqCode = faqCode;
		this.faqCategory = faqCategory;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqShow = faqShow;
	}
	
	public FAQ(int faqCode, String faqCategory, String faqTitle, String faqContent) {
		super();
		this.faqCode = faqCode;
		this.faqCategory = faqCategory;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
	}
	
	
	public FAQ(int faqCode, String faqTitle, String faqContent) {
		super();
		this.faqCode = faqCode;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
	}

	public int getFaqCode() {
		return faqCode;
	}

	public void setFaqCode(int faqCode) {
		this.faqCode = faqCode;
	}

	public String getFaqCategory() {
		return faqCategory;
	}

	public void setFaqCategory(String faqCategory) {
		this.faqCategory = faqCategory;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public String getFaqShow() {
		return faqShow;
	}

	public void setFaqShow(String faqShow) {
		this.faqShow = faqShow;
	}

	@Override
	public String toString() {
		return "FAQ [faqCode=" + faqCode + ", faqCategory=" + faqCategory + ", faqTitle=" + faqTitle + ", faqContent="
				+ faqContent + ", faqShow=" + faqShow + "]";
	}

	
	
	
	
}
