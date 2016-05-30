package kr.co.dnBook.admin.book.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dnBook.mapper.AdminBookMapper;
import kr.co.dnBook.vo.BookSearchVO;
import kr.co.dnBook.vo.BookVO;
import kr.co.dnBook.vo.ReviewVO;

@Service
public class AdminBookServiceImpl implements AdminBookService{
	
	@Autowired
	private AdminBookMapper mapper;

	@Override
	public void deleteBook(int bookCode) throws Exception {
	}

	@Override
	public void deleteReview(int bookCode) throws Exception {
	}

	@Override
	public void deleteRecom(int reviewNo) throws Exception {
	}

	@Override
	public void insertBook(BookVO book) throws Exception {
		mapper.insertBook(book);
	}

	@Override
	public void updateBook(BookVO book) throws Exception {
		mapper.updateBook(book);
	}

	@Override
	public BookVO updateFormBook(int bookCode) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectOneBook(bookCode);
	}

	@Override
	public BookVO detailBook(int bookCode) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectOneBook(bookCode);
	}

	@Override
	public List<ReviewVO> listReview(int bookCode) throws Exception {
		// TODO Auto-generated method stub
		List<ReviewVO> list = mapper.selectReview(bookCode);
		return list;
	}

	@Override
	public Map<String, Object> listBook(BookSearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		
		List<BookVO> list = mapper.selectBook(searchVO);
		int totalCount = mapper.selectBookCount();
		
		Map<String,Object> result = new HashMap<>();
		result.put("list", list);
		result.put("totalCount", totalCount);
		return result;
	}
	

}
