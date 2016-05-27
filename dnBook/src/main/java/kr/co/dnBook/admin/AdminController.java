
package kr.co.dnBook.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("/sales.do")
	public void salesManagerForm(){}
	
	@RequestMapping("/board.do")
	public void boardManagerForm(){
		
	}
	
	
	
	
	@RequestMapping("/book.do")
	public void bookManagerForm(){}
	
	@RequestMapping("/member.do")
	public void memberManagerForm(){}
}

