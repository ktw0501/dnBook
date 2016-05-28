package kr.co.dnBook.user.mypage.sales;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dnBook.vo.MemberVO;

@Controller
public class SalesController {
	
	@Autowired
	private SalesService salesService;
	
	@RequestMapping("/salesList.do")
	public void selectSalesBoard(HttpSession session,Model model) throws Exception{
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		Map<String, Object> result = salesService.salesListBoard(user.getId());
		model.addAttribute("sales", result.get("sales"));
		
	}
}