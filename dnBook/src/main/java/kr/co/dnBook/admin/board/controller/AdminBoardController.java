package kr.co.dnBook.admin.board.controller;

import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.dnBook.admin.board.service.AdminBoardService;
import kr.co.dnBook.vo.BoardSearchVO;
import kr.co.dnBook.vo.PageVO;

@Controller
@RequestMapping("/admin/board")
public class AdminBoardController {
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private AdminBoardService boardService;
	
	
	@RequestMapping("/list.do")
	public void listBoard(@RequestParam(value="pageNo", required=false, defaultValue="1")
	int pageNo, Model model) throws Exception{
		
		int listSize = 5;
		int start = (pageNo - 1) * listSize + 1;
		int end = pageNo * listSize;
		
		BoardSearchVO searchVO = new BoardSearchVO();
		searchVO.setPageNo(pageNo);
		searchVO.setStart(start);
		searchVO.setEnd(end);
		
		Map<String, Object> result = boardService.listBoard(searchVO);
		model.addAttribute("list", result.get("list"));
		
		int totalCount = (int)result.get("totalCpunt");
		
		PageVO pageVO = new PageVO(pageNo, totalCount);
		model.addAttribute("pageVO", pageVO);
	}
	
	 
	
	
}
