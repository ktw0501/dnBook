package kr.co.dnBook.vo;

public class MemberSearchVO {
	private int pageNo;
	private int start;
	private int status;
	public MemberSearchVO(int pageNo) {
		this.start = (pageNo - 1) * 5;
		this.pageNo = pageNo;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getPageNo() {
		return pageNo;
	}
	public int getStart() {
		return start;
	}
}
