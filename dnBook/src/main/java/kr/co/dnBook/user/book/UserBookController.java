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

import kr.co.dnBook.admin.book.service.AdminBookService;
import kr.co.dnBook.vo.BoardFileVO;
import kr.co.dnBook.vo.BookScoreVO;
import kr.co.dnBook.vo.BookSearchVO;
import kr.co.dnBook.vo.BookVO;
import kr.co.dnBook.vo.MemberVO;
import kr.co.dnBook.vo.PageVO;
import kr.co.dnBook.vo.ReviewVO;
import kr.co.dnBook.vo.SalesVO;
import kr.co.dnBook.vo.WishVO;

@Controller
@RequestMapping("/book/")
public class UserBookController {

	@Autowired
	private UserBookService UserBookService;
	@Autowired
	AdminBookService adservice;
//======================================================리스트=====================================================
	@RequestMapping("list.do")
	public void listBook(Model model, @RequestParam(value="no", required=false, defaultValue="1")int no, @RequestParam(value="pageNo", required=false, defaultValue="1")int pageNo) throws Exception {
		BookSearchVO bookSearch = new BookSearchVO(pageNo);
		Map<String, Object> result = null;
		
		switch (no) {
		case 1:
			result = UserBookService.doBook(bookSearch);
			break;
		case 2:
			result = UserBookService.panBook(bookSearch);
			break;
		case 3:
			result = UserBookService.deungBook(bookSearch);
			break;
		case 4:
			result = UserBookService.juBook(bookSearch);
			break;
		case 5:
			result = UserBookService.goBook(bookSearch);
			break;
		}
		
		List<BookVO> list = (List<BookVO>) result.get("list");
		model.addAttribute("list", list);
		
		PageVO page = (PageVO) result.get("page");
		model.addAttribute("page", page);
		
		System.out.println(list.size());
	}
	@RequestMapping("order.do")
	public String orderBook(Model model, int no) throws Exception {
		BookSearchVO bookSearch = new BookSearchVO(1);
		Map<String, Object> result = null;
		
		System.out.println("순서 : " + no);
		switch (no) {
		case 1:
			result = UserBookService.doBook(bookSearch);
			break;
		case 2:
			result = UserBookService.panBook(bookSearch);
			break;
		case 3:
			result = UserBookService.deungBook(bookSearch);
			break;
		case 4:
			result = UserBookService.juBook(bookSearch);
			break;
		case 5:
			result = UserBookService.goBook(bookSearch);
			break;
		}
		List<BookVO> list = (List<BookVO>) result.get("list");
		model.addAttribute("list", list);
		
		PageVO page = (PageVO) result.get("page");
		model.addAttribute("page", page);
		
		return "redirect:/book/list.do";
	}
//===========================================================================================================리스트
//=======================================================디테일====================================================
	@RequestMapping("detail.do")
	public void detailBook(HttpSession session, BookScoreVO bookScoreVO, Model model) throws Exception {
		MemberVO user = (MemberVO)session.getAttribute("user");
		bookScoreVO.setId(user.getId());
//		bookScoreVO.setId("a");
		Map<String, Object> result = UserBookService.detailBook(bookScoreVO);
		model.addAttribute("book", result.get("book"));
		model.addAttribute("wishCount", result.get("recomCount"));
		model.addAttribute("id", user.getId());
		model.addAttribute("pass", user.getPass());
	}
	
	//--------- 장바구니 ----------
	@RequestMapping("registWish1.do")
	public String registWish1(HttpSession session, WishVO wishVO) throws Exception {
		MemberVO user = (MemberVO)session.getAttribute("user");
		wishVO.setId(user.getId());
//		wishVO.setId("a");
		UserBookService.registWish(wishVO);
		return "redirect:list.do";
	}
	@RequestMapping("deleteWish1.do")
	public String deleteWish1(HttpSession session, WishVO wishVO) throws Exception {
		MemberVO user = (MemberVO)session.getAttribute("user");
		wishVO.setId(user.getId());
//		wishVO.setId("a");
		UserBookService.deleteWish(wishVO);
		return "redirect:list.do";
	}
	//--------------------------
	//--------- 장바구니 ----------
	@RequestMapping("registWish.do")
	public String registWish(HttpSession session, WishVO wishVO) throws Exception {
		MemberVO user = (MemberVO)session.getAttribute("user");
		wishVO.setId(user.getId());
//		wishVO.setId("a");
		UserBookService.registWish(wishVO);
		return "redirect:detail.do?bookCode=" + wishVO.getBookCode();
	}
	@RequestMapping("deleteWish.do")
	public String deleteWish(HttpSession session, WishVO wishVO) throws Exception {
		MemberVO user = (MemberVO)session.getAttribute("user");
		wishVO.setId(user.getId());
//		wishVO.setId("a");
		UserBookService.deleteWish(wishVO);
		return "redirect:detail.do?bookCode=" + wishVO.getBookCode();
	}
	//--------------------------
	
	//---------- 댓 글 -----------
	@RequestMapping("registReview.json")
	@ResponseBody
	public ReviewVO registReview(HttpSession session, ReviewVO reviewVO) throws Exception {
		MemberVO user = (MemberVO)session.getAttribute("user");
		reviewVO.setId(user.getId());
//		reviewVO.setId("a");
		
				// 등록된 댓글 반환
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
	//---------------------------
	//----------- 구매 확인 ------------
	@RequestMapping("passchk.do")
	@ResponseBody
	public String passchk(HttpSession session, SalesVO salesVO) throws Exception {
		
		System.out.println("아이디 : " + salesVO.getId());
		System.out.println("패스워드 : " + salesVO.getPass());			// 입력한 패스워드
		System.out.println("북코드 : " + salesVO.getBookCode());
//		return "redirect:detail.do?bookCode=" + salesVO.getBookCode();
	
		// 비번 o : 1
		// 비번 x : 0
		UserBookService.passchk(salesVO);
		return 	"";
	
	}
	
//===========================================================================================================디테일
	@RequestMapping("view.do")
	public void view(int bookCode, Model model) throws Exception {
		BookScoreVO bookScore = new BookScoreVO();
		bookScore.setBookCode(bookCode);
		model.addAttribute("book", (BookVO)UserBookService.detailBook(bookScore));
	}
}
