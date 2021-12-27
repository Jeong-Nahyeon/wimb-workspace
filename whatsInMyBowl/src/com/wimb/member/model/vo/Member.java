package com.wimb.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int mCode;          // 회원번호
	private String mName;       // 이름
	private String mId;         // 아이디
	private String mPwd;        // 비밀번호
	private String mPhone;      // 전화번호
	private String mBirth;      // 생년월일
	private String mGender;     // 성별
	private String mAddress;    // 주소
	private String subAddress;  // 상세주소
	private String postcode;    // 우편번호
	private String mEmail;      // 이메일
	private Date enrollDate;    // 회원가입일
	private String status;      // 회원상태
	private String quitReason;  // 탈퇴사유
	private Date quitDate;      // 탈퇴일
	private String mAd;         // 마케팅수신동의여부
	private Date mBlackDate;    // 블랙리스트등록일
	private String mBlackReason;// 블랙리스트등록사유
	private int mPoint;         // 적립금
	private int mReportCount; 	// 신고누적수
	
	private int count; // selectAllMember 구문용 구매횟수
	private int sum; // selectAllMember 구문용 구매총액
	
	public Member() {}

	public Member(int mCode, String mName, String mId, String mPwd, String mPhone, String mBirth, String mGender,
			String mAddress, String subAddress, String postcode, String mEmail, Date enrollDate, 
			String status, String quitReason, Date quitDate, String mAd, Date mBlackDate, String mBlackReason,
			 int mReportCount, int mPoint) {
		super();
		this.mCode = mCode;
		this.mName = mName;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mPhone = mPhone;
		this.mBirth = mBirth;
		this.mGender = mGender;
		this.mAddress = mAddress;
		this.subAddress = subAddress;
		this.postcode = postcode;
		this.mEmail = mEmail;
		this.enrollDate = enrollDate;
		this.status = status;
		this.quitReason = quitReason;
		this.quitDate = quitDate;
		this.mAd = mAd;
		this.mBlackDate = mBlackDate;
		this.mBlackReason = mBlackReason;
		this.mReportCount = mReportCount;
		this.mPoint = mPoint;
	}

	


	public Member(int mCode, String mName, String mId, String mPwd, String mPhone, String mBirth, String mGender,
			String mAddress, String subAddress, String postcode, String mEmail, Date enrollDate,
			String status, String quitReason, Date quitDate, String mAd, Date mBlackDate, String mBlackReason,
			int mPoint) {
		super();
		this.mCode = mCode;
		this.mName = mName;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mPhone = mPhone;
		this.mBirth = mBirth;
		this.mGender = mGender;
		this.mAddress = mAddress;
		this.subAddress = subAddress;
		this.postcode = postcode;
		this.mEmail = mEmail;
		this.enrollDate = enrollDate;
		this.status = status;
		this.quitReason = quitReason;
		this.quitDate = quitDate;
		this.mAd = mAd;
		this.mBlackDate = mBlackDate;
		this.mBlackReason = mBlackReason;
		this.mPoint = mPoint;
	}

	public Member(String mName, String mId, String mPwd, String mPhone, String mBirth, String mGender, String mAddress,
			String subAddress, String postcode, String mEmail, String mAd) {
		super();
		this.mName = mName;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mPhone = mPhone;
		this.mBirth = mBirth;
		this.mGender = mGender;
		this.mAddress = mAddress;
		this.subAddress = subAddress;
		this.postcode = postcode;
		this.mEmail = mEmail;
		this.mAd = mAd;
	}
	
	

	
	public Member(String mId, String mName, String mPhone, String mEmail, String mAddress, String subAddress, String postcode
			) {
		super();
		this.mName = mName;
		this.mId = mId;
		this.mPhone = mPhone;
		this.mEmail = mEmail;
		this.mAddress = mAddress;
		this.subAddress = subAddress;
		this.postcode = postcode;
	}

	public Member(String mId, String mPwd, String mName, String mPhone, String mEmail, String mAddress, String subAddress,
			String postcode, String mAd) {
		super();
		this.mName = mName;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mPhone = mPhone;
		this.mAddress = mAddress;
		this.subAddress = subAddress;
		this.postcode = postcode;
		this.mEmail = mEmail;
		this.mAd = mAd;
	}
	

	public Member(String mId, String mName, String mPhone, String mEmail, String mAddress, String subAddress,
			String postcode, String mAd) {
		super();
		this.mName = mName;
		this.mId = mId;
		this.mPhone = mPhone;
		this.mAddress = mAddress;
		this.subAddress = subAddress;
		this.postcode = postcode;
		this.mEmail = mEmail;
		this.mAd = mAd;
	}

	
	public Member(int mCode, String mId, String mName, String mPhone, int count, int sum, int mPoint, Date enrollDate, String status) {
		super();
		this.mCode = mCode;
		this.mId = mId;
		this.mName = mName;
		this.mPhone = mPhone;
		this.count = count;
		this.sum = sum;
		this.mPoint = mPoint;
		this.enrollDate = enrollDate;
		this.status = status;
		
	}
	
	

	public Member(String mId, String mEmail, String mName) {
		super();
		
		this.mId = mId;
		this.mEmail = mEmail;
		this.mName = mName;
		
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public int getmCode() {
		return mCode;
	}

	public void setmCode(int mCode) {
		this.mCode = mCode;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPwd() {
		return mPwd;
	}

	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmBirth() {
		return mBirth;
	}

	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
	}

	public String getmGender() {
		return mGender;
	}

	public void setmGender(String mGender) {
		this.mGender = mGender;
	}

	public String getmAddress() {
		return mAddress;
	}

	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}

	public String getSubAddress() {
		return subAddress;
	}

	public void setSubAddress(String subAddress) {
		this.subAddress = subAddress;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getQuitReason() {
		return quitReason;
	}

	public void setQuitReason(String quitReason) {
		this.quitReason = quitReason;
	}

	public Date getQuitDate() {
		return quitDate;
	}

	public void setQuitDate(Date quitDate) {
		this.quitDate = quitDate;
	}

	public String getmAd() {
		return mAd;
	}

	public void setmAd(String mAd) {
		this.mAd = mAd;
	}

	public Date getmBlackDate() {
		return mBlackDate;
	}

	public void setmBlackDate(Date mBlackDate) {
		this.mBlackDate = mBlackDate;
	}

	public String getmBlackReason() {
		return mBlackReason;
	}

	public void setmBlackReason(String mBlackReason) {
		this.mBlackReason = mBlackReason;
	}

	public int getmPoint() {
		return mPoint;
	}

	public void setmPoint(int mPoint) {
		this.mPoint = mPoint;
	}
	
	public int getmReportCount() {
		return mReportCount;
	}

	public void setmReportCount(int mReportCount) {
		this.mReportCount = mReportCount;
	}

	@Override
	public String toString() {
		return "Member [mCode=" + mCode + ", mName=" + mName + ", mId=" + mId + ", mPwd=" + mPwd + ", mPhone=" + mPhone
				+ ", mBirth=" + mBirth + ", mGender=" + mGender + ", mAddress=" + mAddress + ", subAddress="
				+ subAddress + ", postcode=" + postcode + ", mEmail=" + mEmail + ", enrollDate=" + enrollDate
				+ ", status=" + status + ", quitReason=" + quitReason + ", quitDate="
				+ quitDate + ", mAd=" + mAd + ", mBlackDate=" + mBlackDate + ", mBlackReason=" + mBlackReason
				+ ", mPoint=" + mPoint + "]";
	}

	
	

}
