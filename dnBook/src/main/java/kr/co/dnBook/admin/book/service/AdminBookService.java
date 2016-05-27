package kr.co.dnBook.admin.book.service;

import kr.co.dnBook.vo.BookVO;

public interface AdminBookService {
	
	public void deleteBook(String bookCode) throws Exception;
	
	public void deleteReview(String bookCode) throws Exception;

	public void deleteRecom(String reviewNo) throws Exception;
	
	public void insertBook(BookVO book)throws Exception;
	
	public void updateBook(BookVO book)throws Exception;
	
	public void updateBookForm(BookVO book)throws Exception;
}
