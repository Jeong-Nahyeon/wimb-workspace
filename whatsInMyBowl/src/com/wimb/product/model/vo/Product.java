package com.wimb.product.model.vo;

public class Product {
	
	private String pCode; // 상품번호
	private String pName; // 상품명
	private String pCategory; // 카테고리(비건, 육류, 해산물)
	private int pPrice; // 판매가격
	private String pProvider; // 공급업체명
	private int pProvidePrice; // 공급가격
	private String pMainImg; // 대표이미지
	private String pDetailImg; //상세이미지
	private String pDetail; // 상세설명
	private String pShow; // 상품노출여부(Y,N)
	private String pDate; // 상품등록일 => 조회해 올 때 양식 변경 편하도록 문자타입으로 함
	private int pStock; // 현재 재고수량
	private String pKeyword; // 검색 키워드
	
	private String filePath; // 이미지파일경로 추가
	
	
	public Product() {}
	
	
	public Product(String pCode, String pName, String pCategory, int pPrice, String pProvider, int pProvidePrice,
			String pMainImg, String pDetailImg, String pDetail, String pShow, String pDate, int pStock, String pKeyword,
			String filePath) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.pCategory = pCategory;
		this.pPrice = pPrice;
		this.pProvider = pProvider;
		this.pProvidePrice = pProvidePrice;
		this.pMainImg = pMainImg;
		this.pDetailImg = pDetailImg;
		this.pDetail = pDetail;
		this.pShow = pShow;
		this.pDate = pDate;
		this.pStock = pStock;
		this.pKeyword = pKeyword;
		this.filePath = filePath;
	}


	public Product(String pCode, String pName, String pCategory, int pPrice, String pProvider, int pProvidePrice,
			String pMainImg, String pDetailImg, String pDetail, String pShow, String pDate, int pStock,
			String pKeyword) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.pCategory = pCategory;
		this.pPrice = pPrice;
		this.pProvider = pProvider;
		this.pProvidePrice = pProvidePrice;
		this.pMainImg = pMainImg;
		this.pDetailImg = pDetailImg;
		this.pDetail = pDetail;
		this.pShow = pShow;
		this.pDate = pDate;
		this.pStock = pStock;
		this.pKeyword = pKeyword;
	}
	

	public Product(String pName, String pCategory, int pPrice, String pProvider, int pProvidePrice,
			String pMainImg, String pDetailImg, String pDetail, String pShow, int pStock, String pKeyword,
			String filePath) {
		super();
		this.pName = pName;
		this.pCategory = pCategory;
		this.pPrice = pPrice;
		this.pProvider = pProvider;
		this.pProvidePrice = pProvidePrice;
		this.pMainImg = pMainImg;
		this.pDetailImg = pDetailImg;
		this.pDetail = pDetail;
		this.pShow = pShow;
		this.pStock = pStock;
		this.pKeyword = pKeyword;
		this.filePath = filePath;
	}


	public Product(String pCode, String pName, String pCategory, int pPrice, String pProvider, int pProvidePrice,
			String pMainImg, String pShow, int pStock, String filePath) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.pCategory = pCategory;
		this.pPrice = pPrice;
		this.pProvider = pProvider;
		this.pProvidePrice = pProvidePrice;
		this.pMainImg = pMainImg;
		this.pShow = pShow;
		this.pStock = pStock;
		this.filePath = filePath;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	
	public String getpCode() {
		return pCode;
	}


	public void setpCode(String pCode) {
		this.pCode = pCode;
	}


	public String getpName() {
		return pName;
	}


	public void setpName(String pName) {
		this.pName = pName;
	}


	public String getpCategory() {
		return pCategory;
	}


	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}


	public int getpPrice() {
		return pPrice;
	}


	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}


	public String getpProvider() {
		return pProvider;
	}


	public void setpProvider(String pProvider) {
		this.pProvider = pProvider;
	}


	public int getpProvidePrice() {
		return pProvidePrice;
	}


	public void setpProvidePrice(int pProvidePrice) {
		this.pProvidePrice = pProvidePrice;
	}


	public String getpMainImg() {
		return pMainImg;
	}


	public void setpMainImg(String pMainImg) {
		this.pMainImg = pMainImg;
	}


	public String getpDetailImg() {
		return pDetailImg;
	}


	public void setpDetailImg(String pDetailImg) {
		this.pDetailImg = pDetailImg;
	}


	public String getpDetail() {
		return pDetail;
	}


	public void setpDetail(String pDetail) {
		this.pDetail = pDetail;
	}


	public String getpShow() {
		return pShow;
	}


	public void setpShow(String pShow) {
		this.pShow = pShow;
	}


	public String getpDate() {
		return pDate;
	}


	public void setpDate(String pDate) {
		this.pDate = pDate;
	}


	public int getpStock() {
		return pStock;
	}


	public void setpStock(int pStock) {
		this.pStock = pStock;
	}


	public String getpKeyword() {
		return pKeyword;
	}


	public void setpKeyword(String pKeyword) {
		this.pKeyword = pKeyword;
	}


	@Override
	public String toString() {
		return "Product [pCode=" + pCode + ", pName=" + pName + ", pCategory=" + pCategory + ", pPrice=" + pPrice
				+ ", pProvider=" + pProvider + ", pProvidePrice=" + pProvidePrice + ", pMainImg=" + pMainImg
				+ ", pDetailImg=" + pDetailImg + ", pDetail=" + pDetail + ", pShow=" + pShow + ", pDate=" + pDate
				+ ", pStock=" + pStock + ", pKeyword=" + pKeyword + "]";
	}
	

}
