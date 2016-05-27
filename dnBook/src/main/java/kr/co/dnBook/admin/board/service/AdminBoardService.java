package kr.co.dnBook.admin.board.service;

import java.util.Map;

import kr.co.dnBook.vo.BoardSearchVO;

public interface AdminBoardService {
	
	public Map<String, Object> listBoard(BoardSearchVO searchVO) throws Exception;
}
