package kr.co.dnBook.mapper;

import kr.co.dnBook.vo.BoardFileVO;
import kr.co.dnBook.vo.BookRecomVO;
import kr.co.dnBook.vo.BookVO;

public interface UserBookMapper {
	// detailBook ----------------------------------------------------------------
	public BookVO selectOneBoard(int bookCode) throws Exception;
	public int selectRecomCount(BookRecomVO bookRecomVO) throws Exception;
	public BookVO selectCoverImg(int bookCode) throws Exception;
	//----------------------------------------------------------------------------
}
