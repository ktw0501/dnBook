package kr.co.dnBook.vo;

import java.io.Serializable;
import java.util.Date;

public class BoardVO implements Serializable {
	
	private int boardNo;
	private String id;
	private int boardType;
	private String title;
	private String content;
	private int viewCount;
	private String regDate;
	private int commentCnt;
	private int pageViewCnt;
	private BoardVO prev;
	private BoardVO next;
	
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBoardType() {
		return boardType;
	}
	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}
	public int getPageViewCnt() {
		return pageViewCnt;
	}
	public void setPageViewCnt(int pageViewCnt) {
		this.pageViewCnt = pageViewCnt;
	}
	public BoardVO getPrev() {
		return prev;
	}
	public void setPrev(BoardVO prev) {
		this.prev = prev;
	}
	public BoardVO getNext() {
		return next;
	}
	public void setNext(BoardVO next) {
		this.next = next;
	}
	
}
