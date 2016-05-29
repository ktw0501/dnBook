package kr.co.dnBook.admin.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dnBook.admin.member.service.AdminMemberService;
import kr.co.dnBook.vo.BoardSearchVO;
import kr.co.dnBook.vo.BoardVO;
import kr.co.dnBook.vo.MemberSearchVO;
import kr.co.dnBook.vo.MemberVO;
import kr.co.dnBook.vo.PageVO;



@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private AdminMemberService memberService;
	
	@RequestMapping("/list.do")
	public void memberList(Model model, int status, @RequestParam(value="pageNo", required=false, defaultValue="1")int pageNo) throws Exception {
		MemberSearchVO memberSearch = new MemberSearchVO(pageNo);
		memberSearch.setStatus(status);
		Map<String, Object> result = memberService.listMember(memberSearch);
		List<MemberVO> list = (List<MemberVO>) result.get("list");
		PageVO page = (PageVO) result.get("page");
		model.addAttribute("list", list);
		model.addAttribute("page", page);
	}

	
	@RequestMapping("/detail.do")
	public void detailMember(Model model, @RequestParam(value="id", required=false) String id) throws Exception {
		
		MemberVO member = memberService.detailMember(id);
		model.addAttribute("member", member);
		
	}
	
	
	@RequestMapping("/startStatus.do")
	public String startStatus(
			HttpSession session, MemberVO memberVO, Model model) throws Exception {
/*		
		주석 풀어야함
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		// VO에 설정하기
		memberVO.setId(user.getId());
*/		
		// VO에 설정하기
		memberVO.setId("a");
		
		memberService.startStatus(memberVO);
		
		return "redirect:detail.do?id=" + memberVO.getId();
	}
	
	
	@RequestMapping("/stopStatus.do")
	public String stopStatus(
			HttpSession session, MemberVO memberVO, Model model) throws Exception {
		
		/*//주석 풀어야함
		MemberVO user = (MemberVO)session.getAttribute("user");
		// VO에 설정하기
		memberVO.setId(user.getId());
		*/
		memberVO.setId("a");
		
		memberService.stopStatus(memberVO);
		
		return "redirect:detail.do?id=" + memberVO.getId();
	}
	
	
	
	
}
