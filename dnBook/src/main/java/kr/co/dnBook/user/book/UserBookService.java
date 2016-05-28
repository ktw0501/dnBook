package kr.co.dnBook.user.book;

import java.util.Map;

import kr.co.dnBook.vo.BookRecomVO;

public interface UserBookService {

	public Map<String, Object> detailBook(BookRecomVO bookRecomVO) throws Exception;

}
