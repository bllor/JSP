package kMarket.cs.dto;

public class ReviewDTO {

	private int revNo;
	private int prodNo;
	private int content;
	private int uid;
	private int rating;
	private int regip;
	private int rdate;
	
	
	public int getRevNo() {
		return revNo;
	}
	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public int getContent() {
		return content;
	}
	public void setContent(int content) {
		this.content = content;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public int getRegip() {
		return regip;
	}
	public void setRegip(int regip) {
		this.regip = regip;
	}
	public int getRdate() {
		return rdate;
	}
	public void setRdate(int rdate) {
		this.rdate = rdate;
	}
	
	
}
