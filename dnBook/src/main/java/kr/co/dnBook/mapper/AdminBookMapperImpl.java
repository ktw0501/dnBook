package kr.co.dnBook.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dnBook.vo.BookSearchVO;
import kr.co.dnBook.vo.BookVO;
import kr.co.dnBook.vo.ReviewVO;

@Repository
public class AdminBookMapperImpl implements AdminBookMapper{

	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	private static final String NAMESPACE ="kr.co.dnBook.mapper.AdminBookMapper";
	
	public void insertBook(BookVO book) throws Exception {
		sessionTemplate.insert(NAMESPACE+".insertBook",book);
	}

	public void updateBook(BookVO book) throws Exception {
		sessionTemplate.update(NAMESPACE+".updateBook",book);
	}

	public void deleteBook(int bookCode) throws Exception {
	}

	@Override
	public BookVO selectOneBook(int bookCode) throws Exception {
		return sessionTemplate.selectOne(NAMESPACE+".selectOneBook",bookCode);
	}

	@Override
	public List<ReviewVO> selectReview(int bookCode) throws Exception {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList(NAMESPACE+".selectReview",bookCode);
	}

	@Override
	public int selectBookCount() throws Exception {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne(NAMESPACE+".selectBookCount");
	}

	@Override
	public List<BookVO> selectBook(BookSearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList(NAMESPACE+".selectBook",searchVO);
	}
	
	
	
}
