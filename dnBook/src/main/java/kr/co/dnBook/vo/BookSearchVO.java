package kr.co.dnBook.vo;

public class BookSearchVO {
	private int pageNo;
	private int start;
	public BookSearchVO(int pageNo)
	{
		this.start = (pageNo - 1) * 5;
		this.pageNo = pageNo;
	}
	public int getPageNo() {
		return pageNo;
	}
	public int getStart() {
		return start;
	}

}