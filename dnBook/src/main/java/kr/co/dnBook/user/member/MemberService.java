package kr.co.dnBook.user.member;

import kr.co.dnBook.vo.MemberVO;

/**
 * Member에 대한 작업을 처리하는 서비스 레이어 클래스
 * @author taemoon
 */
public interface MemberService {
	public void insertMember(MemberVO member) throws Exception;
}
