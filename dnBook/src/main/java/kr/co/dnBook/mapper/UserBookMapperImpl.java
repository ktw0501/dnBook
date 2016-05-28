package kr.co.dnBook.mapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dnBook.vo.BoardFileVO;
import kr.co.dnBook.vo.BookRecomVO;
import kr.co.dnBook.vo.BookVO;

@Repository
public class UserBookMapperImpl implements UserBookMapper{
	@Autowired
	private SqlSessionTemplate session;
	
	private final String NAMESPACE = "kr.co.dnBook.mapper.UserBookMapper";
	
	// detailBook ----------------------------------------------------------------
	public BookVO selectOneBoard(int bookCode) throws Exception {
		return session.selectOne(NAMESPACE + ".selectOneBook", bookCode);
	}

	public int selectRecomCount(BookRecomVO bookRecomVO) throws Exception {
		return session.selectOne(NAMESPACE + ".selectRecomCount", bookRecomVO);
	}
	
	public BookVO selectCoverImg(int bookCode) throws Exception {					// 미완성
		return session.selectOne(NAMESPACE + ".selectBoardFile", bookCode);
	}
	//----------------------------------------------------------------------------
}
