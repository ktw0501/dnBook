package kr.co.dnBook.user.mypage.sales;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dnBook.vo.MemberVO;

@Controller
@RequestMapping("/user/mypage")
public class MyPageController {
	
	@RequestMapping("/myPageHome.do")
	public void myPageForm(HttpSession session, Model model) throws Exception{
		MemberVO user = (MemberVO)session.getAttribute("user");
		model.addAttribute("user",user);
		
	}

}