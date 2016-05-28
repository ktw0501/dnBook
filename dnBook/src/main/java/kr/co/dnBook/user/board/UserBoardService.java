package kr.co.dnBook.user.board;

import java.util.Map;

import kr.co.dnBook.vo.BoardSearchVO;

public interface UserBoardService {
	public Map<String, Object> listBoard(BoardSearchVO boardSearch) throws Exception;
}
