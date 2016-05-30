package kr.co.dnBook.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dnBook.vo.SalesVO;
@Repository
public class UserSalesMapperImpl implements UserSalesMapper{
	@Autowired
	private SqlSessionTemplate session;
	private static final String SALES_DAO_NAMESPACE = "kr.co.dnBook.mapper.UserSalesMapper";

	@Override
	public List<SalesVO> selectSales(String id) throws Exception {
		System.out.println(id);
		
		return session.selectList(SALES_DAO_NAMESPACE+".selectSales", id);
	}

}
