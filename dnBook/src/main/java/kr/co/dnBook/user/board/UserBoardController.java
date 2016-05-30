package kr.co.dnBook.user.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dnBook.vo.BoardCommentVO;
import kr.co.dnBook.vo.BoardSearchVO;
import kr.co.dnBook.vo.BoardVO;
import kr.co.dnBook.vo.PageVO;

@Controller
@RequestMapping("/service/")
public class UserBoardController {
	@Autowired
	UserBoardService service;
	
	@RequestMapping("list2.do")
	public void boardList2(Model model, int boardType, @RequestParam(value="pageNo", required=false, defaultValue="1")int pageNo) throws Exception {
		BoardSearchVO boardSearch = new BoardSearchVO(pageNo);
		boardSearch.setBoardType(boardType);
		Map<String, Object> result = service.listBoard(boardSearch);
		List<BoardVO> list = (List<BoardVO>) result.get("list");
		PageVO page = (PageVO) result.get("page");
		System.out.println("111111");
		System.out.println("111111");
		System.out.println(boardType);
		System.out.println(boardType);
		System.out.println(boardType);
		model.addAttribute("boardType", boardType);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
	}
	
	@RequestMapping("list.do")
	public void boardList(Model model, int boardType, @RequestParam(value="pageNo", required=false, defaultValue="1")int pageNo) throws Exception {
		BoardSearchVO boardSearch = new BoardSearchVO(pageNo);
		boardSearch.setBoardType(boardType);
		Map<String, Object> result = service.listBoard(boardSearch);
		List<BoardVO> list = (List<BoardVO>) result.get("list");
		PageVO page = (PageVO) result.get("page");
		System.out.println("111111");
		System.out.println("111111");
		System.out.println(boardType);
		System.out.println(boardType);
		System.out.println(boardType);
		model.addAttribute("boardType", boardType);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
	}
	
	@RequestMapping("detail.do")
	public void boardDetail(BoardVO board, Model model) throws Exception {
		Map<String, Object> result = service.detailBoard(board);
		model.addAttribute("board", result.get("board"));
		model.addAttribute("prev", result.get("prev"));
		model.addAttribute("next", result.get("next"));
	}
	
	@RequestMapping("commentList.json")
	@ResponseBody
	public List<BoardCommentVO> commentList(BoardCommentVO comment)throws Exception {
		return service.commentList(comment);
	}
	
	@RequestMapping("insertComment.json")
	@ResponseBody
	public List<BoardCommentVO> insertComment(BoardCommentVO comment) throws Exception {
		return service.insertComment(comment);
	}
	
	@RequestMapping("updateComment.json")
	@ResponseBody
	public List<BoardCommentVO> updateComment(BoardCommentVO comment) throws Exception {
		return service.updateComment(comment);
	}
	
	@RequestMapping("deleteComment.json")
	@ResponseBody
	public List<BoardCommentVO> deleteComment(BoardCommentVO comment) throws Exception {
		System.out.println(comment.getBoardNo());
		System.out.println(comment.getCommentNo());
		return service.deleteComment(comment);
	}
	
	@RequestMapping("test.do")
	public void test() throws Exception {
		service.test();
	}
}
