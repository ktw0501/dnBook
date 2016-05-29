package kr.co.dnBook.mapper;

import java.util.List;

import kr.co.dnBook.vo.BoardVO;
import kr.co.dnBook.vo.MemberSearchVO;
import kr.co.dnBook.vo.MemberVO;



public interface AdminMemberMapper {
	
	public List<BoardVO> selectMemberList(MemberSearchVO memberSearch) throws Exception;

	public int selectTotalCount(MemberSearchVO memberSearch) throws Exception;

	public MemberVO selectOneMember(String id) throws Exception;
	
	public void startStatus(MemberVO memberVO) throws Exception;
	
	public void stopStatus(MemberVO memberVO) throws Exception;
	
	
	
	
}
