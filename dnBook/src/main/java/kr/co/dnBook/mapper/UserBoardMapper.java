package kr.co.dnBook.mapper;

import java.util.List;

import kr.co.dnBook.vo.BoardSearchVO;
import kr.co.dnBook.vo.BoardVO;

public interface UserBoardMapper {
	
	public List<BoardVO> selectList(BoardSearchVO boardSearch) throws Exception;
	public int selectTotalCount(BoardSearchVO boardSearch) throws Exception;
}
