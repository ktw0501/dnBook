package kr.co.dnBook.admin.member.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dnBook.mapper.AdminMemberMapper;
import kr.co.dnBook.vo.MemberSearchVO;
import kr.co.dnBook.vo.MemberVO;
import kr.co.dnBook.vo.PageVO;





@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Autowired
	private AdminMemberMapper dao;

	
	@Override
	public Map<String, Object> listMember(MemberSearchVO memberSearch) throws Exception {
		Map<String, Object> result = new HashMap<>();
		result.put("list", dao.selectMemberList(memberSearch));
		PageVO page = new PageVO(memberSearch.getPageNo(), dao.selectTotalCount(memberSearch));
		result.put("page", page);
		return result;
	}
	

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
