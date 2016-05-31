package kr.co.dnBook.user.member;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dnBook.vo.MemberVO;

/**
 * 회원정보 관련 Controller
 */
@Controller
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
	@RequestMapping("/member/joinForm.do")
	public void joinForm(HttpServletRequest req) throws Exception {
	}
/**
 * 회원가입 완료 버튼 클릭 시..
 * @param member
 * @return
 * @throws Exception
 */
	@RequestMapping("/member/join.do")
	public String join(MemberVO member) throws Exception {
		memberService.insertMember(member);
		return "redirect:/main.do";
	}
	/**
	 * 아이디 중복체크
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/member/duplCheck.json")
	@ResponseBody
	public String duplCheck(String id) throws Exception {
		String ckeckId= memberService.duplCheck(id);
		return ckeckId;
	}
	/**
	 * loginForm으로 이동.
	 * @param req
	 * @throws Exception
	 */
	@RequestMapping("/login/loginForm.do")
	public void loginForm(HttpServletRequest req) throws Exception {
	}
	/**
	 * 로그인시 아이디 체크
	 * @param member
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login/login.do")
	public String login(MemberVO member, RedirectAttributes attr, HttpSession session)throws Exception {
		MemberVO user = memberService.userOneMember(member);
		if(user == null){
			attr.addFlashAttribute("msg", "아이디 또는 비밀번호를 다시 확인하세요.");
			return "redirect:/login/loginForm.do";
		} else {
			session.setAttribute("member", member);
			return "redirect:/main.do";
		}
	}
	/**
	 * 로그아웃 
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("login/logout.do")
	public String logout(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/main.do";
	}
	/**
	 * 회원정보수정 클릭
	 * @param req
	 * @throws Exception
	 */
	@RequestMapping("/member/infoConfirmForm.do")
	public void infoConfirm(HttpServletRequest req) throws Exception {
	}
	/**
	 * 비밀번호 재확인
	 * @param member
	 * @param attr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/member/infoConfirm.do")
	public String updateMemberForm(MemberVO member, RedirectAttributes attr)throws Exception{
		MemberVO user = memberService.userOneMember(member);
		if(user == null) {
			attr.addFlashAttribute("msg", "비밀번호를 정확히 입력해주세요.");
			return "redirect:/member/infoConfirmForm.do";
		}else {
			attr.addFlashAttribute("member", user);
			return "redirect:/member/updateMemberForm.do";
		}
	}
	/**
	 * 회원정보수정 아이디 비밀번호 일치 푀원정보수정 폼으로 이동. 
	 * @param req
	 * @throws Exception
	 */
	@RequestMapping("/member/updateMemberForm.do")
	public MemberVO updateMemberForm(MemberVO member) throws Exception {
		return memberService.userOneMember(member);
	}
	/**
	 * 회원수정 완료시..
	 * @param member
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/member/updateMember.do")
	public String updateMember(MemberVO member) throws Exception {
		memberService.updateMember(member);
		return "redirect:/main.do";
	}
}
