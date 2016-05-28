package kr.co.dnBook.mapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dnBook.vo.BoardFileVO;
import kr.co.dnBook.vo.BoardVO;
import kr.co.dnBook.vo.BookRecomVO;

@Repository
public class UserBookMapperImpl implements UserBookMapper{
	@Autowired
	private SqlSessionTemplate session;
	
	private final String NAMESPACE = "kr.co.dnBook.mapper.UserBookMapper";
	
	// detailBook ----------------------------------------------------------------
	public void updatePageViewCnt(int no) throws Exception {
		session.update(NAMESPACE + ".updatePageViewCnt", no);
	}

	public BoardVO selectOneBoard(int no) throws Exception {
		return session.selectOne(NAMESPACE + ".selectOneBoard", no);
	}

	public BoardVO selectPrevBoard(int no) throws Exception {
		return session.selectOne(NAMESPACE + ".selectPrevBoard", no);
	}
	
	public BoardVO selectNextBoard(int no) throws Exception {
		return session.selectOne(NAMESPACE + ".selectNextBoard", no);
	}
	
	public int selectRecomCount(BookRecomVO bookRecomVO) throws Exception {
		return session.selectOne(NAMESPACE + ".selectRecomCount", bookRecomVO);
	}
	public BoardFileVO selectBoardFile(int no) throws Exception {
		return session.selectOne(NAMESPACE + ".selectBoardFile", no);
	}
	//----------------------------------------------------------------------------
}
