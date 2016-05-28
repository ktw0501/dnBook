package kr.co.dnBook.mapper;

import java.util.List;

import kr.co.dnBook.vo.SalesVO;

public interface UserSalesMapper {
	public List<SalesVO> selectSales(String id) throws Exception;	
}
