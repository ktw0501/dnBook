package kr.co.dnBook.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dnBook.vo.RentVO;

@Repository
public class UserRentMapperImpl implements UserRentMapper{

	@Autowired
	private SqlSessionTemplate session;
	private static final String RENT_DAO_NAMESPACE = "kr.co.dnBook.mapper.UserRentMapper";
	
	@Override
	public List<RentVO> selectRent(String id) throws Exception {
		return session.selectList(RENT_DAO_NAMESPACE+".selectRent", id);
	}
}
