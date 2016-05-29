package kr.co.dnBook.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dnBook.vo.BookRecomVO;
import kr.co.dnBook.vo.BookVO;
import kr.co.dnBook.vo.ReviewVO;
import kr.co.dnBook.vo.WishVO;

@Repository
public class UserBookMapperImpl implements UserBookMapper{
	@Autowired
	private SqlSessionTemplate session;
	
	private final String NAMESPACE = "kr.co.dnBook.mapper.UserBookMapper";
	
	// detailBook ----------------------------------------------------------------
	public BookVO selectOneBoard(int bookCode) throws Exception {
		return session.selectOne(NAMESPACE + ".selectOneBook", bookCode);
	}

	public int selectRecomCount(BookRecomVO bookRecomVO) throws Exception {						// 추천하기 바꿔야함 ★
		return session.selectOne(NAMESPACE + ".selectRecomCount", bookRecomVO);
	}
	
//	public BookVO selectCoverImg(int bookCode) throws Exception {			
//		return session.selectOne(NAMESPACE + ".selectBoardFile", bookCode);
//	}
	public void insertWish(WishVO wishVO) throws Exception {
		session.insert(NAMESPACE + ".insertWish", wishVO);
	}
	
	public void deleteWish(WishVO wishVO) throws Exception {
		session.delete(NAMESPACE + ".deleteWish", wishVO);
	}
	
	
	
	
	public void insertReview(ReviewVO reviewVO) throws Exception {
		session.insert(NAMESPACE + ".insertReview", reviewVO);
	}
	
	public List<ReviewVO> selectReview(int no) throws Exception {
		return session.selectList(NAMESPACE + ".selectReview", no);
	}

	public ReviewVO selectReviewByPk(int reviewNo) throws Exception {
		return session.selectOne(NAMESPACE + ".selectReviewByPk", reviewNo);
	}

	// 댓글 수정 
	public void updateReview(ReviewVO reviewVO) throws Exception {
		session.update(NAMESPACE + ".updateReview", reviewVO);
	}
	
	public void deleteReview(int reviewNo) throws Exception {
		session.delete(NAMESPACE + ".deleteReview", reviewNo);
	}
	//----------------------------------------------------------------------------
}
