package kr.co.dnBook.mapper;

import kr.co.dnBook.vo.MemberVO;


public interface AdminMemberMapper {
	
	public void updateMember(MemberVO member) throws Exception;

	public MemberVO selectOneMember(String id) throws Exception;
	
}
