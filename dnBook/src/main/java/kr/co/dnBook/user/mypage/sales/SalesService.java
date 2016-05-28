package kr.co.dnBook.user.mypage.sales;

import java.util.Map;

/**
 * 마이페이지의 구매내역 작업을 처리하는 서비스 레이어 클래스
 * @author Eunhaw
 */
public interface SalesService {
	public Map<String, Object> salesListBoard(String id) throws Exception;

}
	 
 