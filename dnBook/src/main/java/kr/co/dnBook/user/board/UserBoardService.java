package kr.co.dnBook.user.board;

import java.util.List;
import java.util.Map;

import kr.co.dnBook.vo.BoardCommentVO;
import kr.co.dnBook.vo.BoardSearchVO;
import kr.co.dnBook.vo.BoardVO;

public interface UserBoardService {
	public Map<String, Object> listBoard(BoardSearchVO boardSearch) throws Exception;
	public Map<String, Object> detailBoard(BoardVO board) throws Exception;
	public List<BoardCommentVO> commentList(BoardCommentVO comment) throws Exception;
	public List<BoardCommentVO> insertComment(BoardCommentVO comment) throws Exception;
	public List<BoardCommentVO> updateComment(BoardCommentVO comment) throws Exception;
	public List<BoardCommentVO> deleteComment(BoardCommentVO comment) throws Exception;
}
