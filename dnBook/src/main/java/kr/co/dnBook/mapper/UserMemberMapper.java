package kr.co.dnBook.mapper;

import org.springframework.stereotype.Repository;

import kr.co.dnBook.vo.MemberVO;
@Repository
public interface UserMemberMapper {
	public void insertMember(MemberVO member) throws Exception;

	public String selectId(String id) throws Exception;
}
