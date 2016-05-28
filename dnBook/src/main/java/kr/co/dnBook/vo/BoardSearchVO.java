package kr.co.dnBook.vo;

public class BoardSearchVO {
	private int pageNo;
	private int start;
	private int boardType;
	public BoardSearchVO(int pageNo) {
		this.start = (pageNo - 1) * 5;
		this.pageNo = pageNo;
	}
	
	public int getBoardType() {
		return boardType;
	}
	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}
	public int getPageNo() {
		return pageNo;
	}
	public int getStart() {
		return start;
	}
	
}
