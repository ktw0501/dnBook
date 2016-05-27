package kr.co.dnBook.mapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dnBook.vo.MemberVO;

@Repository("kr.co.dnBook.mapper.MemberMapperImpl")
public class UserMemberMapperImpl implements UserMemberMapper {
	@Autowired
	private SqlSessionTemplate session;
	
	private static final String MEMBER_DAO_NAMESPACE = "kr.co.dnBook.admin.board.repository.mapper.MemberMapper";
	
	public void insertMember(MemberVO member) throws Exception {
		session.insert(MEMBER_DAO_NAMESPACE + ".insertMember", member);
	}
}
