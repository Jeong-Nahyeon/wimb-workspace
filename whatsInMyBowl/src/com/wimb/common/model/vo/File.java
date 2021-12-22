package com.wimb.common.model.vo;

public class File {
	
	private int fCode;         // 파일번호
	private String fName;      // 파일원본명
	private String fRename;    // 파일수정명
	private String fPath;      // 파일저장경로
	private String fExtension; // 확장자
	private String fRef;       // 리뷰(R)|1:1문의(I)|상품문의(P)|공지사항(N)
	private int fRefCode;      // 글번호
	
	public File() {}

	public File(int fCode, String fName, String fRename, String fPath, String fExtension, String fRef, int fRefCode) {
		super();
		this.fCode = fCode;
		this.fName = fName;
		this.fRename = fRename;
		this.fPath = fPath;
		this.fExtension = fExtension;
		this.fRef = fRef;
		this.fRefCode = fRefCode;
	}
		
	public File(String fName, String fRename, String fPath) {
		super();
		this.fName = fName;
		this.fRename = fRename;
		this.fPath = fPath;
	}

	public int getfCode() {
		return fCode;
	}

	public void setfCode(int fCode) {
		this.fCode = fCode;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getfRename() {
		return fRename;
	}

	public void setfRename(String fRename) {
		this.fRename = fRename;
	}

	public String getfPath() {
		return fPath;
	}

	public void setfPath(String fPath) {
		this.fPath = fPath;
	}

	public String getfExtension() {
		return fExtension;
	}

	public void setfExtension(String fExtension) {
		this.fExtension = fExtension;
	}

	public String getfRef() {
		return fRef;
	}

	public void setfRef(String fRef) {
		this.fRef = fRef;
	}

	public int getfRefCode() {
		return fRefCode;
	}

	public void setfRefCode(int fRefCode) {
		this.fRefCode = fRefCode;
	}

	@Override
	public String toString() {
		return "File [fCode=" + fCode + ", fName=" + fName + ", fRename=" + fRename + ", fPath=" + fPath
				+ ", fExtension=" + fExtension + ", fRef=" + fRef + ", fRefCode=" + fRefCode + "]";
	}
	
	
}
