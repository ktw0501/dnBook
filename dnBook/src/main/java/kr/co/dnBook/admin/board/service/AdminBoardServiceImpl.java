package kr.co.dnBook.admin.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dnBook.mapper.AdminBoardMapper;
import kr.co.dnBook.vo.BoardSearchVO;
import kr.co.dnBook.vo.BoardVO;

@Service
public class AdminBoardServiceImpl implements AdminBoardService{
	
	@Autowired
	private AdminBoardMapper dao;

	@Override
	public Map<String, Object> listBoard(BoardSearchVO searchVO) throws Exception {
		List<BoardVO> list = dao.selectBoard(searchVO);
		
		// 전체 게시글 카운트
		int totalCount = dao.selectBoardCount();
		
		Map<String, Object> result = new HashMap<>();
		result.put("list", list);
		result.put("totalCount", totalCount);
		return result;
	}
	
	
}
