package kr.co.dnBook.admin.book.service;

import kr.co.dnBook.vo.BookVO;

public interface AdminBookService {
	
	public void deleteBook(int bookCode) throws Exception;
	
	public void deleteReview(int bookCode) throws Exception;

	public void deleteRecom(int reviewNo) throws Exception;
	
	public void insertBook(BookVO book)throws Exception;
	
	public void updateBook(BookVO book)throws Exception;
	
	public void updateBookForm(BookVO book)throws Exception;
}
