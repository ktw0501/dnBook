package kr.co.dnBook.mapper;

import kr.co.dnBook.vo.BookVO;

public interface AdminBookMapper {

	public void insertBook(BookVO book) throws Exception;
	public void updateBook(BookVO book) throws Exception;
	public void deleteBook(int bookCode) throws Exception;



}
