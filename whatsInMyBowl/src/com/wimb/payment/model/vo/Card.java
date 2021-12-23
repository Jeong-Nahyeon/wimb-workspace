package com.wimb.payment.model.vo;

public class Card {
	
	private String pmCode;
	private String cardId;
	private String cardApproval;
	private String cardCompany;
	private int cardInstalment;
	
	public Card() {}

	public Card(String pmCode, String cardId, String cardApproval, String cardCompany, int cardInstalment) {
		super();
		this.pmCode = pmCode;
		this.cardId = cardId;
		this.cardApproval = cardApproval;
		this.cardCompany = cardCompany;
		this.cardInstalment = cardInstalment;
	}
	
	public Card(String cardId, String cardApproval, String cardCompany, int cardInstalment) {
		super();
		this.cardId = cardId;
		this.cardApproval = cardApproval;
		this.cardCompany = cardCompany;
		this.cardInstalment = cardInstalment;
	}

	public String getPmCode() {
		return pmCode;
	}

	public void setPmCode(String pmCode) {
		this.pmCode = pmCode;
	}

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public String getCardApproval() {
		return cardApproval;
	}

	public void setCardApproval(String cardApproval) {
		this.cardApproval = cardApproval;
	}

	public String getCardCompany() {
		return cardCompany;
	}

	public void setCardCompany(String cardCompany) {
		this.cardCompany = cardCompany;
	}

	public int getCardInstalment() {
		return cardInstalment;
	}

	public void setCardInstalment(int cardInstalment) {
		this.cardInstalment = cardInstalment;
	}

	@Override
	public String toString() {
		return "Card [pmCode=" + pmCode + ", cardId=" + cardId + ", cardApproval=" + cardApproval + ", cardCompany="
				+ cardCompany + ", cardInstalment=" + cardInstalment + "]";
	}
	

}
