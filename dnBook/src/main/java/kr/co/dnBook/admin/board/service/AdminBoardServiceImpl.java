package kr.co.dnBook.admin.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dnBook.mapper.AdminBoardMapper;
import kr.co.dnBook.vo.BoardCommentVO;
import kr.co.dnBook.vo.BoardFileVO;
import kr.co.dnBook.vo.BoardSearchVO;
import kr.co.dnBook.vo.BoardVO;
import kr.co.dnBook.vo.PageVO;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {
	@Autowired
	AdminBoardMapper dao;
	
	public Map<String, Object> listBoard(BoardSearchVO boardSearch) throws Exception {
		Map<String, Object> result = new HashMap<>();
		result.put("list", dao.selectList(boardSearch));
		PageVO page = new PageVO(boardSearch.getPageNo(), dao.selectTotalCount(boardSearch));
		result.put("page", page);
		return result;
	}
	
	@Override
	public Map<String, Object> detailBoard(BoardVO board) throws Exception {
		Map<String, Object> result = new HashMap<>();
		board = dao.selectDetail(board.getBoardNo());
		BoardVO prev = dao.selectPrev(board);
		BoardVO next = dao.selectNext(board);
		result.put("board", board);
		result.put("prev", prev);
		result.put("next", next);
		return result;
	}
	
	@Override
	public List<BoardCommentVO> commentList(BoardCommentVO comment) throws Exception {
		return dao.selectCommentList(comment);
	}
	
	@Override
	public List<BoardCommentVO> insertComment(BoardCommentVO comment) throws Exception {
		dao.insertComment(comment);
		return dao.selectCommentList(comment);
	}
	
	
	@Override
	public List<BoardCommentVO> updateComment(BoardCommentVO comment) throws Exception {
		dao.updateComment(comment);
		return dao.selectCommentList(comment);
	}
	
	@Override
	public List<BoardCommentVO> deleteComment(BoardCommentVO comment) throws Exception {
		dao.deleteComment(comment.getCommentNo());
		return dao.selectCommentList(comment);
	}

	@Override
	public void insertBoard(BoardVO board, BoardFileVO file) throws Exception {
		int boardNo = dao.insertBoard(board);
		
//		int boardNo = dao.selectBoardNo(board);
		board.setBoardNo(boardNo);
		
		if (file != null) {
			file.setBoardNo(boardNo);
			dao.insertBoardFile(file);
		}
		
	}
	
	
	
	
}
