package kr.co.dnBook.user.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dnBook.mapper.UserMemberMapper;
import kr.co.dnBook.vo.MemberVO;

@Service                                
public class UserMemberServiceImpl implements UserMemberService{
	@Autowired
	private UserMemberMapper dao;
	
	public void insertMember(MemberVO member) throws Exception {
		dao.insertMember(member);
	}
	@Override
	public String duplCheck(String id) throws Exception {
		return dao.selectId(id);
	}

		

}
