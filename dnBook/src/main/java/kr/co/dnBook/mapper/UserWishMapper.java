package kr.co.dnBook.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.dnBook.vo.WishVO;

public interface UserWishMapper {
	public List<WishVO> selectWish(String id) throws Exception;	
	public int selectWishCount(String id) throws Exception;
}
