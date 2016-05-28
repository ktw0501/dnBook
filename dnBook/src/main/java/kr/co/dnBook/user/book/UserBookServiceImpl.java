package kr.co.dnBook.user.book;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dnBook.mapper.UserBookMapper;
import kr.co.dnBook.vo.BookRecomVO;
import kr.co.dnBook.vo.BookVO;

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
		int recomCount = dao.selectRecomCount(bookRecomVO);		// 부트스트랩
		// 책이미지
		BookVO coverImg = dao.selectCoverImg(bookCode);
		
		Map<String, Object> result = new HashMap<>();
		result.put("book", book);
		result.put("recomCount", recomCount);
		result.put("coverImg", coverImg);
		return result;
	}
}
