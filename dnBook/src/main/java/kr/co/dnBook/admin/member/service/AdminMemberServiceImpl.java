package kr.co.dnBook.admin.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dnBook.mapper.AdminMemberMapper;
import kr.co.dnBook.vo.MemberVO;



@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Autowired
	private AdminMemberMapper dao;

	@Override
	public void updateMember(MemberVO memberVO) throws Exception {
		dao.updateMember(memberVO);
		
	}

	@Override
	public MemberVO updateFormMember(String id) throws Exception {
		return dao.selectOneMember(id);
	}
	

	
	
	
	
}
