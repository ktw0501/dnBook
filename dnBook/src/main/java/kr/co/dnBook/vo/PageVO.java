package kr.co.dnBook.vo;

public class PageVO {
	private int listSize = 5;
	private int pageNo;
	private int beginPage;
	private int endPage;
	private int lastPage;
	
	
	public PageVO (int pageNo, int count){
		this.pageNo = pageNo;
		lastPage = (count % listSize == 0) ? count / listSize : count / listSize + 1;
		
		int tabSize = 5;
		int currTab = (pageNo - 1) / tabSize + 1;
		beginPage = (currTab - 1) * tabSize + 1;
		endPage = (currTab * tabSize < lastPage) ? currTab * tabSize : lastPage;
		
		
		
	}
	
	public int getPageNo() {
		return pageNo;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	
	
	
}
