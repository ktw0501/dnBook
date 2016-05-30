package kr.co.dnBook.user.mypage.sales;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dnBook.vo.SalesVO;

@Controller
@RequestMapping("user/mypage")
public class SalesController {
	
	@Autowired
	private SalesService salesService;
	
	@RequestMapping("/salesList.do")
	public void selectSalesBoard(HttpSession session,Model model) throws Exception{
//		MemberVO user = (MemberVO)session.getAttribute("user");
		
//		Map<String, Object> result = salesService.salesListBoard(user.getId());
		List<SalesVO> list = salesService.salesListBoard("eunhwa");
		model.addAttribute("list", list);
		
	}
}