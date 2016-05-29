package kr.co.dnBook.user.book;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dnBook.vo.BookRecomVO;
import kr.co.dnBook.vo.MemberVO;
import kr.co.dnBook.vo.ReviewVO;
import kr.co.dnBook.vo.WishVO;

@Controller
@RequestMapping("/board")
public class UserBookController {

	@Autowired
	private UserBookService UserBookService;
//리스트-----------------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------------리스트
//detailBook-----------------------------------------------------------------------------------------------------
	@RequestMapping("/detailBook.do")
	public void detailBook(HttpSession session, BookRecomVO bookRecomVO, Model model) throws Exception {
		MemberVO user = (MemberVO)session.getAttribute("user");
		bookRecomVO.setId(user.getId());
		Map<String, Object> result = UserBookService.detailBook(bookRecomVO);
		model.addAttribute("board", result.get("board"));
		model.addAttribute("recomCount", result.get("recomCount"));
//		model.addAttribute("file", result.get("file"));
	}
	
	@RequestMapping("/registWish.do")
	public String registWish(HttpSession session, WishVO wishVO) throws Exception {
		MemberVO user = (MemberVO)session.getAttribute("user");
		// VO에 설정하기
		wishVO.setId(user.getId());
		UserBookService.registWish(wishVO);
		// 페이지 이동하기
		return "redirect:detailBook.do?bookCode=" + wishVO.getBookCode();
	}
	
	@RequestMapping("/deleteWish.do")
	public String deleteWish(HttpSession session, WishVO wishVO) throws Exception {
		MemberVO user = (MemberVO)session.getAttribute("user");
		// VO에 설정하기
		wishVO.setId(user.getId());
		UserBookService.deleteWish(wishVO);
		// 페이지 이동하기
		return "redirect:detailBook.do?bookCode=" + wishVO.getBookCode();
	}
	
	
	
	@RequestMapping("/registReview.json")
	@ResponseBody
	public ReviewVO registReview(HttpSession session, ReviewVO reviewVO) throws Exception {
		MemberVO user = (MemberVO)session.getAttribute("user");
		// VO에 설정하기
		reviewVO.setId(user.getId());
		
		// 등록된 댓글 반환s
		return UserBookService.registReview(reviewVO);
	}
	
	@RequestMapping("/modifyReview.json")
	@ResponseBody
	public String updateReview(ReviewVO reviewVO) throws Exception {
		// 댓글 수정
		UserBookService.updateReview(reviewVO);
		return "success";
	}
	
	@RequestMapping("/listReview.json")
	@ResponseBody
	public List<ReviewVO> selectReview(int bookCode) throws Exception {
		// 댓글 정보 조회
		return UserBookService.selectReview(bookCode);
	}
	
	@RequestMapping("/deleteReview.json")
	@ResponseBody
	public List<ReviewVO> deleteReview(ReviewVO reviewVO) throws Exception {
		return UserBookService.deleteReview(reviewVO);
	}
//---------------------------------------------------------------------------------------------------------------
	
	
}
