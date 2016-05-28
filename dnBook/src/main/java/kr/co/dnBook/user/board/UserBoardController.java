package kr.co.dnBook.user.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.dnBook.vo.BoardVO;

@Controller
@RequestMapping("/board/")
public class UserBoardController {
	@Autowired
	UserBoardService service;
	
	@RequestMapping("list.do")
	public List<BoardVO> boardList(BoardVO board, @RequestParam(value="pageNo", required=false, defaultValue="1")int pageNo) {
		
		return null;
	}
}
