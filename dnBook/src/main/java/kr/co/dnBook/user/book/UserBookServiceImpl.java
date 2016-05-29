package kr.co.dnBook.user.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dnBook.mapper.UserBookMapper;
import kr.co.dnBook.vo.BookRecomVO;
import kr.co.dnBook.vo.BookVO;
import kr.co.dnBook.vo.ReviewVO;
import kr.co.dnBook.vo.WishVO;

@Service
public class UserBookServiceImpl implements UserBookService{
	@Autowired
	private UserBookMapper dao;
	
	@Override
	public Map<String, Object> detailBook(BookRecomVO bookRecomVO) throws Exception {
		int bookCode = bookRecomVO.getBookCode();
		// 게시물 정보 조회
		BookVO book = dao.selectOneBoard(bookCode);
		// 추천수 조회
		int recomCount = dao.selectRecomCount(bookRecomVO);		    // 추천하기 바꿔야함 ★
		// 책이미지
//		BookVO coverImg = dao.selectCoverImg(bookCode);
		
		Map<String, Object> result = new HashMap<>();
		result.put("book", book);
		result.put("recomCount", recomCount);
//		result.put("coverImg", coverImg);
		return result;
	}
	
	@Override
	public void registWish(WishVO wishVO) throws Exception {
		dao.insertWish(wishVO);
	}

	@Override
	public void deleteWish(WishVO wishVO) throws Exception {
		dao.deleteWish(wishVO);
	}
	
	
	
	@Override
	public ReviewVO registReview(ReviewVO reviewVO) throws Exception {
		// 댓글 등록
		dao.insertReview(reviewVO);
		// 등록된 댓글 반환
		return dao.selectReviewByPk(reviewVO.getReviewNo());
	}
	@Override
	public void updateReview(ReviewVO reviewVO) throws Exception {
		dao.updateReview(reviewVO);
	}
	@Override
	public List<ReviewVO> selectReview(int bookCode) throws Exception {
		return dao.selectReview(bookCode);
	}
	@Override
	public List<ReviewVO> deleteReview(ReviewVO reviewVO) throws Exception {
		// 댓글 삭제
		dao.deleteReview(reviewVO.getReviewNo());
		// 댓글 정보 조회
		List<ReviewVO> commentList = dao.selectReview(reviewVO.getBookCode());
		return commentList;
	}
}
