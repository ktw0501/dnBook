package kr.co.dnBook.user.book;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dnBook.vo.BookRecomVO;
import kr.co.dnBook.vo.MemberVO;

@Controller
@RequestMapping("/board")
public class UserBookController {

	@Autowired
	private UserBookService UserBookService;
	
	@RequestMapping("/detailBook.do")
	public void detailBook(HttpSession session, BookRecomVO bookRecomVO, Model model) throws Exception {
		MemberVO user = (MemberVO)session.getAttribute("user");

		bookRecomVO.setId(user.getId());
		
		Map<String, Object> result = UserBookService.detailBook(bookRecomVO);
		model.addAttribute("board", result.get("board"));
		model.addAttribute("recomCount", result.get("recomCount"));
		model.addAttribute("file", result.get("file"));
	}
}
