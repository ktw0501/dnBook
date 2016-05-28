package kr.co.dnBook.user.board;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dnBook.mapper.UserBoardMapper;
import kr.co.dnBook.vo.BoardSearchVO;
import kr.co.dnBook.vo.PageVO;

@Service
public class UserBoardServiceImpl implements UserBoardService {
	@Autowired
	UserBoardMapper dao;
	
	public Map<String, Object> listBoard(BoardSearchVO boardSearch) throws Exception {
		Map<String, Object> result = new HashMap<>();
		result.put("list", dao.selectList(boardSearch));
		PageVO page = new PageVO(boardSearch.getPageNo(), dao.selectTotalCount(boardSearch));
		result.put("page", page);
		return result;
	}
	
	
}
