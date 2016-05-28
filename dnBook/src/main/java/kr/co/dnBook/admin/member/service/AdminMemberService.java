package kr.co.dnBook.admin.member.service;

import kr.co.dnBook.vo.MemberVO;


public interface AdminMemberService {

	public void updateMember(MemberVO memberVO) throws Exception;
	
	public MemberVO updateFormMember(String id) throws Exception;
	
	public MemberVO detailMember(String id) throws Exception;
}
