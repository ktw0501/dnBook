package kr.co.dnBook.admin.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dnBook.mapper.AdminMemberMapper;
import kr.co.dnBook.vo.MemberVO;





@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Autowired
	private AdminMemberMapper dao;

//	
//	@Override
//	public MemberVO updateFormMember(String id) throws Exception {
//		return dao.selectOneMember(id);
//	}
//	@Override
//	public void updateMember(MemberVO memberVO) throws Exception {
//		dao.updateMember(memberVO);
//		
//	}

	@Override
	public MemberVO detailMember(String id) throws Exception {
		MemberVO member = dao.selectOneMember(id);
		return member;
	}

	@Override
	public MemberVO startStatus(MemberVO memberVO) throws Exception {
		dao.startStatus(memberVO);
		MemberVO member = dao.selectOneMember(memberVO.getId());
		return member;
		
		
		
	}

	@Override
	public MemberVO stopStatus(MemberVO memberVO) throws Exception {
		dao.stopStatus(memberVO);
		MemberVO member = dao.selectOneMember(memberVO.getId());
		return member;
	}
	

	
	
	
	
}
