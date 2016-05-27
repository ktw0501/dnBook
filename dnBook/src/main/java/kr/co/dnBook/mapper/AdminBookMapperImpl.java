package kr.co.dnBook.mapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dnBook.vo.BookVO;

@Repository
public class AdminBookMapperImpl implements AdminBookMapper{

	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	private static final String NAMESPACE = "kr.co.mlec.board.BookMapper";
	
	public void insertBook(BookVO book) throws Exception {
	}

	public void updateBook(BookVO book) throws Exception {
	}

	public void deleteBook(String bookCode) throws Exception {
	}
	
	
}
