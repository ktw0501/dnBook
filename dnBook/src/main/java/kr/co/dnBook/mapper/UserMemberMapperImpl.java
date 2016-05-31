package kr.co.dnBook.mapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dnBook.vo.MemberVO;

@Repository("kr.co.dnBook.mapper.MemberMapperImpl")
public class UserMemberMapperImpl implements UserMemberMapper {
	@Autowired
	private SqlSessionTemplate session;
	
	private static final String MEMBER_DAO_NAMESPACE = "kr.co.dnBook.mapper";
	
	public void insertMember(MemberVO member) throws Exception {
		session.insert(MEMBER_DAO_NAMESPACE + ".insertMember", member);
	}

	@Override
	public String selectId(String id) throws Exception {
		return session.selectOne(MEMBER_DAO_NAMESPACE + ".selectId", id);
	}

	@Override
	public MemberVO selectOneMember(MemberVO member) {
		return session.selectOne(MEMBER_DAO_NAMESPACE + ".selectOneMember", member);
	}

	@Override
	public void updateMember(MemberVO member) {
		session.update(MEMBER_DAO_NAMESPACE + ".updateMember", member);
	}

}
