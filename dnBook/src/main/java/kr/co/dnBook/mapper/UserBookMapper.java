package kr.co.dnBook.mapper;

import kr.co.dnBook.vo.BoardFileVO;
import kr.co.dnBook.vo.BoardVO;
import kr.co.dnBook.vo.BookRecomVO;

public interface UserBookMapper {
	// detailBook ----------------------------------------------------------------
	public void updatePageViewCnt(int no) throws Exception;
	public BoardVO selectOneBoard(int no) throws Exception;
	public BoardVO selectPrevBoard(int no) throws Exception;
	public BoardVO selectNextBoard(int no) throws Exception;
	public int selectRecomCount(BookRecomVO bookRecomVO) throws Exception;
	public BoardFileVO selectBoardFile(int no) throws Exception;
	//----------------------------------------------------------------------------
}
