package kr.co.dnBook.user.book;

import java.util.List;
import java.util.Map;

import kr.co.dnBook.vo.BookScoreVO;
import kr.co.dnBook.vo.BookSearchVO;
import kr.co.dnBook.vo.ReviewVO;
import kr.co.dnBook.vo.SalesVO;
import kr.co.dnBook.vo.WishVO;

public interface UserBookService {
	public Map<String, Object> listBook(BookSearchVO bookSearch) throws Exception;
	
	public Map<String, Object> doBook(BookSearchVO bookSearch) throws Exception;
	public Map<String, Object> panBook(BookSearchVO bookSearch) throws Exception;
	public Map<String, Object> deungBook(BookSearchVO bookSearch) throws Exception;
	public Map<String, Object> juBook(BookSearchVO bookSearch) throws Exception;
	public Map<String, Object> goBook(BookSearchVO bookSearch) throws Exception;
	//---------------------------------------------------------------------------------
	public Map<String, Object> detailBook(BookScoreVO bookScoreVO) throws Exception;
	public void registWish(WishVO wishVO) throws Exception;
	public void deleteWish(WishVO wishVO) throws Exception;
	
	public ReviewVO registReview(ReviewVO reviewVO) throws Exception;
	public void updateReview(ReviewVO reviewVO) throws Exception;
	public List<ReviewVO> selectReview(int bookCode) throws Exception;
	public List<ReviewVO> deleteReview(ReviewVO reviewVO) throws Exception;

	public void passchk(SalesVO salesVO) throws Exception;

}
