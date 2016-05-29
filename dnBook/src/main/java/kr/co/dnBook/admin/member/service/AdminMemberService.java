package kr.co.dnBook.admin.member.service;

import java.util.Map;

import kr.co.dnBook.vo.MemberVO;



public interface AdminMemberService {

//	public MemberVO updateFormMember(String id) throws Exception;
	
//	public void updateMember(MemberVO memberVO) throws Exception;
	
	public MemberVO detailMember(String id) throws Exception;
	
	public MemberVO startStatus(MemberVO memberVO) throws Exception;
	
	public MemberVO stopStatus(MemberVO memberVO) throws Exception;
	
	
	
	
}
