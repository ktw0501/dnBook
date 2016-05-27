package kr.co.dnBook.user.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dnBook.mapper.UserMemberMapper;
import kr.co.dnBook.vo.MemberVO;

@Service                                
public class MemberServiceImpl implements MemberService{
	@Autowired
	private UserMemberMapper dao;
	public void insertMember(MemberVO member) throws Exception {
		dao.insertMember(member);
	}

		

}
