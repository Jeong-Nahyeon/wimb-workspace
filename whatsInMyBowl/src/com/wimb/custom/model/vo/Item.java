package com.wimb.custom.model.vo;

public class Item {
	
	private String ciCode;
	private String ciName;
	private String ciCategory;
	private String ciProvider;
	private int ciProvidePrice;
	private int ciPrice;
	private String ciImg;
	private String ciShow;
	private int ciStock;
	
	public Item() {}

	public Item(String ciCode, String ciName, String ciCategory, String ciProvider, int ciProvidePrice, int ciPrice,
			String ciImg, String ciShow, int ciStock) {
		super();
		this.ciCode = ciCode;
		this.ciName = ciName;
		this.ciCategory = ciCategory;
		this.ciProvider = ciProvider;
		this.ciProvidePrice = ciProvidePrice;
		this.ciPrice = ciPrice;
		this.ciImg = ciImg;
		this.ciShow = ciShow;
		this.ciStock = ciStock;
	}
	

	public Item(String ciCode, String ciName, String ciCategory, int ciPrice, String ciImg, int ciStock) {
		super();
		this.ciCode = ciCode;
		this.ciName = ciName;
		this.ciCategory = ciCategory;
		this.ciPrice = ciPrice;
		this.ciImg = ciImg;
		this.ciStock = ciStock;
	}
	

	public Item(String ciName, String ciCategory, String ciProvider, int ciProvidePrice, int ciPrice, String ciShow,
			int ciStock) {
		super();
		this.ciName = ciName;
		this.ciCategory = ciCategory;
		this.ciProvider = ciProvider;
		this.ciProvidePrice = ciProvidePrice;
		this.ciPrice = ciPrice;
		this.ciShow = ciShow;
		this.ciStock = ciStock;
	}
	

	public Item(String ciCode, String ciName, String ciCategory, String ciProvider, int ciProvidePrice, int ciPrice,
			String ciShow, int ciStock) {
		super();
		this.ciCode = ciCode;
		this.ciName = ciName;
		this.ciCategory = ciCategory;
		this.ciProvider = ciProvider;
		this.ciProvidePrice = ciProvidePrice;
		this.ciPrice = ciPrice;
		this.ciShow = ciShow;
		this.ciStock = ciStock;
	}

	public String getCiCode() {
		return ciCode;
	}

	public void setCiCode(String ciCode) {
		this.ciCode = ciCode;
	}

	public String getCiName() {
		return ciName;
	}

	public void setCiName(String ciName) {
		this.ciName = ciName;
	}

	public String getCiCategory() {
		return ciCategory;
	}

	public void setCiCategory(String ciCategory) {
		this.ciCategory = ciCategory;
	}

	public String getCiProvider() {
		return ciProvider;
	}

	public void setCiProvider(String ciProvider) {
		this.ciProvider = ciProvider;
	}

	public int getCiProvidePrice() {
		return ciProvidePrice;
	}

	public void setCiProvidePrice(int ciProvidePrice) {
		this.ciProvidePrice = ciProvidePrice;
	}

	public int getCiPrice() {
		return ciPrice;
	}

	public void setCiPrice(int ciPrice) {
		this.ciPrice = ciPrice;
	}

	public String getCiImg() {
		return ciImg;
	}

	public void setCiImg(String ciImg) {
		this.ciImg = ciImg;
	}

	public String getCiShow() {
		return ciShow;
	}

	public void setCiShow(String ciShow) {
		this.ciShow = ciShow;
	}

	public int getCiStock() {
		return ciStock;
	}

	public void setCiStock(int ciStock) {
		this.ciStock = ciStock;
	}

	@Override
	public String toString() {
		return "Item [ciCode=" + ciCode + ", ciName=" + ciName + ", ciCategory=" + ciCategory + ", ciProvider="
				+ ciProvider + ", ciProvidePrice=" + ciProvidePrice + ", ciPrice=" + ciPrice + ", ciImg=" + ciImg
				+ ", ciShow=" + ciShow + ", ciStock=" + ciStock + "]";
	}
	
	
}
