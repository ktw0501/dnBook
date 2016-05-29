package kr.co.dnBook.mapper;

import java.util.List;

import kr.co.dnBook.vo.BoardVO;
import kr.co.dnBook.vo.BookRecomVO;
import kr.co.dnBook.vo.BookSearchVO;
import kr.co.dnBook.vo.BookVO;
import kr.co.dnBook.vo.ReviewVO;
import kr.co.dnBook.vo.WishVO;

public interface UserBookMapper {
	// 리스트 ----------------------------------------------------------------
	public List<BookVO> selectList(BookSearchVO bookSearch) throws Exception;
	public int selectTotalCount(BookSearchVO bookSearch) throws Exception;
	// detailBook ----------------------------------------------------------------
	public BookVO selectOneBoard(int bookCode) throws Exception;
	public int selectRecomCount(BookRecomVO bookRecomVO) throws Exception;		// 추천하기 바꿔야함 ★
//	public BookVO selectCoverImg(int bookCode) throws Exception;
	public void insertWish(WishVO wishVO) throws Exception;
	public void deleteWish(WishVO wishVO) throws Exception;
	
	
	public void insertReview(ReviewVO reviewVO) throws Exception;
	public void updateReview(ReviewVO reviewVO) throws Exception;
	public List<ReviewVO> selectReview(int bookCode) throws Exception;
	public ReviewVO selectReviewByPk(int reviewNo) throws Exception;
	public void deleteReview(int reviewNo) throws Exception;
	//----------------------------------------------------------------------------
}
