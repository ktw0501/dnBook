package kr.co.dnBook.mapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dnBook.vo.MemberVO;



@Repository("kr.co.dnBook.mapper.AdminMemberMapperImpl")
public class AdminMemberMapperImpl implements AdminMemberMapper {
	@Autowired
	private SqlSessionTemplate session;

	private static final String MEMBER_DAO_NAMESPACE = "kr.co.dnBook.mapper.AdminMemberMapper";
	
	@Override
	public void updateMember(MemberVO member) throws Exception {
		session.update(MEMBER_DAO_NAMESPACE + ".updateMember", member);
		
	}

	@Override
	public MemberVO selectOneMember(String id) throws Exception {
		return session.selectOne(MEMBER_DAO_NAMESPACE + ".selectOneMember", id);
	}
	
	

	
		
		
	
	
	
}
