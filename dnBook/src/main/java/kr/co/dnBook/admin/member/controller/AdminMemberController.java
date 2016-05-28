package kr.co.dnBook.admin.member.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dnBook.admin.member.service.AdminMemberService;
import kr.co.dnBook.vo.MemberVO;








@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private AdminMemberService memberService;
	
	
	@RequestMapping("/updateForm.do")
	public void updateFormMember(String id, Model model) throws Exception {
		MemberVO member = memberService.updateFormMember(id);
		model.addAttribute("member", member);
	}
	
	@RequestMapping("/update.do")
	public String updateMember(MemberVO member) throws Exception {
		memberService.updateMember(member);
		return "redirect:list.do";
	}
	
	
	
	
}
