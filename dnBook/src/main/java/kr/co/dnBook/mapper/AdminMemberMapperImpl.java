package kr.co.dnBook.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dnBook.vo.BoardVO;
import kr.co.dnBook.vo.MemberSearchVO;
import kr.co.dnBook.vo.MemberVO;



@Repository("kr.co.dnBook.mapper.AdminMemberMapperImpl")
public class AdminMemberMapperImpl implements AdminMemberMapper {
	@Autowired
	private SqlSessionTemplate session;
	

	private static final String MEMBER_DAO_NAMESPACE = "kr.co.dnBook.mapper.AdminMemberMapper";
	
	
	@Override
	public List<BoardVO> selectMemberList(MemberSearchVO memberSearch) throws Exception{
		return session.selectList(MEMBER_DAO_NAMESPACE + ".selectList", memberSearch);
	}
	
	@Override
	public int selectTotalCount(MemberSearchVO memberSearch) throws Exception {
		return session.selectOne(MEMBER_DAO_NAMESPACE + ".selectTotalCount", memberSearch);
	}
	

	@Override
	public MemberVO selectOneMember(String id) throws Exception {
		return session.selectOne(MEMBER_DAO_NAMESPACE + ".selectOneMember", id);
	}
	
	public void startStatus(MemberVO memberVO) throws Exception {
		session.update(MEMBER_DAO_NAMESPACE + ".startStatus", memberVO);
	}
	
	public void stopStatus(MemberVO MemberVO) throws Exception {
		session.update(MEMBER_DAO_NAMESPACE + ".stopStatus", MemberVO);
	}

	
		
		
	
	
	
}
