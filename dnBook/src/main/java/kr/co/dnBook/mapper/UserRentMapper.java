package kr.co.dnBook.mapper;

import java.util.List;

import kr.co.dnBook.vo.RentVO;

public interface UserRentMapper {
	public List<RentVO> selectRent(String id) throws Exception;	

}
