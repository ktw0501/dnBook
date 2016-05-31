package kr.co.dnBook.vo;

import java.util.Date;

public class WishVO {
	private String id;
	private int bookCode;
	private Date regDate;
	private String coverImg;
	private String title;
	private String author;
	private int price;
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getCoverImg() {
		return coverImg;
	}
	public void setCoverImg(String coverImg) {
		this.coverImg = coverImg;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBookCode() {
		return bookCode;
	}
	public void setBookCode(int bookCode) {
		this.bookCode = bookCode;
	}
}
