package kr.co.dnBook.user.member;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dnBook.vo.MemberVO;

/**
 * 회원정보 관련 Controller
 */
@Controller
@RequestMapping("/member")
public class UserMemberController {

	@Autowired
	ServletContext servletContext;

	@Autowired
	private UserMemberService memberService;
	
/**
 * 회원가입 링크 클릭 시 회원가입 폼으로 이동.
 * @param req
 * @throws Exception
 */
	@RequestMapping("/joinForm.do")
	public void joinForm(HttpServletRequest req) throws Exception {
	}
/**
 * 회원가입 완료 버튼 클릭 시..
 * @param member
 * @return
 * @throws Exception
 */
	@RequestMapping("/join.do")
	public String join(MemberVO member) throws Exception {
		memberService.insertMember(member);
		System.out.println(member.getAddress() + "," + member.getDetailAddress());
		return "redirect:/main.do";
	}
	@RequestMapping("/duplCheck.json")
	@ResponseBody
	public String duplCheck(String id) throws Exception {
		String ckeckId= memberService.duplCheck(id);
		return ckeckId;
	}
}
