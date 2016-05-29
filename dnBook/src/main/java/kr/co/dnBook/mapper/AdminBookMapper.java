package kr.co.dnBook.mapper;

import java.util.List;


import kr.co.dnBook.vo.BoardVO;
import kr.co.dnBook.vo.BookVO;
import kr.co.dnBook.vo.MemberSearchVO;
import kr.co.dnBook.vo.MemberVO;

public interface AdminBookMapper {
	
	
	public void insertBook(BookVO book) throws Exception;
	public void updateBook(BookVO book) throws Exception;
	public void deleteBook(int bookCode) throws Exception;



}
