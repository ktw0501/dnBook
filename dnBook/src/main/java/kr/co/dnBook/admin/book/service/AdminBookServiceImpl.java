package kr.co.dnBook.admin.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dnBook.mapper.AdminBookMapper;
import kr.co.dnBook.vo.BookVO;

@Service
public class AdminBookServiceImpl implements AdminBookService{
	
	@Autowired
	private AdminBookMapper mapper;

	@Override
	public void deleteBook(String bookCode) throws Exception {
	}

	@Override
	public void deleteReview(String bookCode) throws Exception {
	}

	@Override
	public void deleteRecom(String reviewNo) throws Exception {
	}

	@Override
	public void insertBook(BookVO book) throws Exception {
	}

	@Override
	public void updateBook(BookVO book) throws Exception {
	}

	@Override
	public void updateBookForm(BookVO book) throws Exception {
	}
	

}
