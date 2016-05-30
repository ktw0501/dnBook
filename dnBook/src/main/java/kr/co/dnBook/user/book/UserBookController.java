package kr.co.dnBook.user.book;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dnBook.vo.BookScoreVO;
import kr.co.dnBook.vo.BookSearchVO;
import kr.co.dnBook.vo.BookVO;
import kr.co.dnBook.vo.MemberVO;
import kr.co.dnBook.vo.PageVO;
import kr.co.dnBook.vo.ReviewVO;
import kr.co.dnBook.vo.WishVO;

@Controller
@RequestMapping("/book/")
public class UserBookController {

	@Autowired
	private UserBookService UserBookService;
//======================================================리스트=====================================================
	@RequestMapping("list.do")
	public void listBook(Model model, @RequestParam(value="pageNo", required=false, defaultValue="1")int pageNo) throws Exception {
		BookSearchVO bookSearch = new BookSearchVO(pageNo);
		Map<String, Object> result = UserBookService.listBook(bookSearch);
		
		List<BookVO> list = (List<BookVO>) result.get("list");
		model.addAttribute("list", list);
		
		PageVO page = (PageVO) result.get("page");
		model.addAttribute("page", page);
		
		System.out.println(list.size());
	}
//===========================================================================================================리스트
//=======================================================디테일====================================================
	@RequestMapping("detail.do")
	public void detailBook(HttpSession session, BookScoreVO bookScoreVO, Model model) throws Exception {
//		MemberVO user = (MemberVO)session.getAttribute("user");
//		bookRecomVO.setId(user.getId());
		bookScoreVO.setId("a");
		Map<String, Object> result = UserBookService.detailBook(bookScoreVO);
		model.addAttribute("book", result.get("book"));
		model.addAttribute("recomCount", result.get("recomCount"));
	}
	
	//--------- 장바구니 ----------
	@RequestMapping("registWish.do")
	public String registWish(HttpSession session, WishVO wishVO) throws Exception {
		MemberVO user = (MemberVO)session.getAttribute("user");
//		wishVO.setId(user.getId());
		wishVO.setId("a");
		UserBookService.registWish(wishVO);
		return "redirect:detailBook.do?bookCode=" + wishVO.getBookCode();
	}
	@RequestMapping("deleteWish.do")
	public String deleteWish(HttpSession session, WishVO wishVO) throws Exception {
		MemberVO user = (MemberVO)session.getAttribute("user");
//		wishVO.setId(user.getId());
		wishVO.setId("a");
		UserBookService.deleteWish(wishVO);
		return "redirect:detailBook.do?bookCode=" + wishVO.getBookCode();
	}
	//--------------------------
	
	//---------- 댓 글 -----------
	@RequestMapping("registReview.json")
	@ResponseBody
	public ReviewVO registReview(HttpSession session, ReviewVO reviewVO) throws Exception {
		MemberVO user = (MemberVO)session.getAttribute("user");
//		reviewVO.setId(user.getId());
		reviewVO.setId("a");
		
		// 등록된 댓글 반환s
		return UserBookService.registReview(reviewVO);
	}
	
	@RequestMapping("modifyReview.json")
	@ResponseBody
	public String updateReview(ReviewVO reviewVO) throws Exception {
		// 댓글 수정
		UserBookService.updateReview(reviewVO);
		return "success";
	}
	
	@RequestMapping("listReview.json")
	@ResponseBody
	public List<ReviewVO> selectReview(int bookCode) throws Exception {
		// 댓글 정보 조회
		return UserBookService.selectReview(bookCode);
	}
	
	@RequestMapping("deleteReview.json")
	@ResponseBody
	public List<ReviewVO> deleteReview(ReviewVO reviewVO) throws Exception {
		return UserBookService.deleteReview(reviewVO);
	}
	//--------------------------
	
//===========================================================================================================디테일
	
	
}
