package kr.co.dnBook.user.include;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dnBook.user.board.UserBoardService;
import kr.co.dnBook.vo.BoardSearchVO;
import kr.co.dnBook.vo.BoardVO;

@Controller
public class IncludeController {
	@Autowired
	UserBoardService service;
	
	@RequestMapping("/user/include/noticeList.json")
	@ResponseBody
	public List<BoardVO> noticeList(@RequestParam(value="boardType", required=false, defaultValue="2")int boardType, @RequestParam(value="pageNo", required=false, defaultValue="1")int pageNo) throws Exception {
		BoardSearchVO boardSearch = new BoardSearchVO(pageNo);
		boardSearch.setBoardType(boardType);
		Map<String, Object> result = service.listBoard(boardSearch);
		List<BoardVO> list = (List<BoardVO>) result.get("list");
		return list;
	}
}
