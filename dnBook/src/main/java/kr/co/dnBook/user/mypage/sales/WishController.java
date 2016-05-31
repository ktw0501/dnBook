package kr.co.dnBook.user.mypage.sales;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.dnBook.vo.PageVO;
import kr.co.dnBook.vo.WishVO;

@Controller
@RequestMapping("user/mypage")
public class WishController {
	@Autowired
	private WishService wishService;
	
	@RequestMapping("/wishList.do")
	public void selectWish(@RequestParam (value="pageNo", required=false, defaultValue="1") int pageNo, HttpSession session, Model model) throws Exception{
		int listSize = 5;
		int start = (pageNo -1) * listSize + 1;   		
		int end   = pageNo      * listSize;      
//		MemberVO user = (MemberVO)session.getAttribute("user");
		
//		Map<String, Object> result = rentService.rentList(user.getId());
		Map<String, Object> result = wishService.wishList("eunhwa");

//		BookSearchVO bookSearch = new BookSearchVO(pageNo);
		List<WishVO> list = (List<WishVO>) result.get("list");
		model.addAttribute("list", list);
		PageVO pageVO = new PageVO(pageNo, (Integer)result.get("totalCount"));
		model.addAttribute("pageVO", pageVO);
	}
	

	
}