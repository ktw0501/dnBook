package kr.co.dnBook.mapper;

import java.util.List;

import kr.co.dnBook.vo.BookSearchVO;
import kr.co.dnBook.vo.BookVO;
import kr.co.dnBook.vo.ReviewVO;

public interface AdminBookMapper {

	public void insertBook(BookVO book) throws Exception;
	public void updateBook(BookVO book) throws Exception;
	public void deleteBook(String data) throws Exception;
	public void deleteReview(String data) throws Exception;
	public BookVO selectOneBook(int bookCode) throws Exception;
	public List<ReviewVO> selectReview(int bookCode) throws Exception;
	public int selectBookCount() throws Exception;
	public List<BookVO> selectBook(BookSearchVO searchVO) throws Exception;



}
