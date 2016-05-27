package kr.co.dnBook.mapper;

import java.util.List;

import kr.co.dnBook.vo.BoardSearchVO;
import kr.co.dnBook.vo.BoardVO;



public interface AdminBoardMapper {
	
	public List<BoardVO> selectBoard(BoardSearchVO searchVO) throws Exception;
	public int selectBoardCount() throws Exception;
}
