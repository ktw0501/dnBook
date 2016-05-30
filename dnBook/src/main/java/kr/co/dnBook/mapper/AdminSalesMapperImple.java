package kr.co.dnBook.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dnBook.vo.AdminSalesVO;

@Repository
public class AdminSalesMapperImple implements AdminSalesMapper{
	
	private final String NAMESPACE="kr.co.dnBook.mapper.AdminSalesMapper";
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<AdminSalesVO> selectDailySales(String date) throws Exception {
		return session.selectList(NAMESPACE+".selectDaily",date);
	}

	@Override
	public List<AdminSalesVO> selectMonthlySales(String date) throws Exception {
		return session.selectList(NAMESPACE+".selectMonthly",date);
	}

	@Override
	public List<AdminSalesVO> selectHourlySales() throws Exception {	
		return session.selectList(NAMESPACE+".selectHourly");
	}

}
