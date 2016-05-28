package kr.co.dnBook.user.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.dnBook.vo.BoardSearchVO;
import kr.co.dnBook.vo.BoardVO;
import kr.co.dnBook.vo.PageVO;

@Controller
@RequestMapping("/board/")
public class UserBoardController {
	@Autowired
	UserBoardService service;
	
	@RequestMapping("list.do")
	public void boardList(Model model, int boardType, @RequestParam(value="pageNo", required=false, defaultValue="1")int pageNo) throws Exception {
		BoardSearchVO boardSearch = new BoardSearchVO(pageNo);
		boardSearch.setBoardType(boardType);
		Map<String, Object> result = new HashMap<>();
		result = service.listBoard(boardSearch);
		List<BoardVO> list = (List<BoardVO>) result.get("list");
		PageVO page = (PageVO) result.get("page");
		model.addAttribute("list", list);
		model.addAttribute("page", page);
	}
	
	@RequestMapping("detail.do")
	public BoardVO boardDetail() {
		
		return null;
	}
}
