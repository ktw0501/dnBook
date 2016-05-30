package kr.co.dnBook.admin.book.service;

import java.util.List;
import java.util.Map;

import kr.co.dnBook.vo.BookSearchVO;
import kr.co.dnBook.vo.BookVO;
import kr.co.dnBook.vo.ReviewVO;

public interface AdminBookService {
	
	public void deleteBook(String data) throws Exception;
	
	public void deleteReview(int bookCode) throws Exception;

	public void deleteRecom(int reviewNo) throws Exception;
	
	public void insertBook(BookVO book)throws Exception;
	
	public void updateBook(BookVO book)throws Exception;
	
	public List<ReviewVO> listReview(int bookCode)throws Exception;
	
	
	public BookVO detailBook(int bookCode)throws Exception;

	public BookVO updateFormBook(int bookCode)throws Exception;
	
	public Map<String,Object> listBook(BookSearchVO searchVO) throws Exception;	
}
