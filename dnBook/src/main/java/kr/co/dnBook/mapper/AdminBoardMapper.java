package kr.co.dnBook.mapper;

import java.util.List;

import kr.co.dnBook.vo.BoardCommentVO;
import kr.co.dnBook.vo.BoardFileVO;
import kr.co.dnBook.vo.BoardSearchVO;
import kr.co.dnBook.vo.BoardVO;



public interface AdminBoardMapper {
	
	public List<BoardVO> selectList(BoardSearchVO boardSearch) throws Exception;
	
	public int selectTotalCount(BoardSearchVO boardSearch) throws Exception;
	
	public BoardVO selectDetail(int no) throws Exception;
	
	public BoardVO selectNext(BoardVO board) throws Exception;
	
	public BoardVO selectPrev(BoardVO board) throws Exception;
	
	public List<BoardCommentVO> selectCommentList(BoardCommentVO comment) throws Exception;
	
	public void insertComment(BoardCommentVO comment) throws Exception;
	
	public void updateComment(BoardCommentVO comment) throws Exception;
	
	public void deleteComment(int commentNo) throws Exception;
	
	public void insertBoard(BoardVO board) throws Exception;
	
	public int selectBoardNo(BoardVO board)throws Exception;

	public void insertBoardFile(BoardFileVO file) throws Exception;
	
	public void deleteBoard(int boardNo) throws Exception;
	
	public void deleteFileByBoardNo(int boardNo) throws Exception;
	
	public void deleteCommentByBoardNo(int boardNo) throws Exception;
	
	
	
}
