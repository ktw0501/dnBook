package kr.co.dnBook.admin.sales.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dnBook.mapper.AdminSalesMapper;
import kr.co.dnBook.vo.AdminSalesVO;

@Service
public class AdminSalesServiceImpl implements AdminSalesService{
	
	@Autowired
	private AdminSalesMapper mapper;

	@Override
	public List<AdminSalesVO> selectDailySales(String date) throws Exception {
		return mapper.selectDailySales(date);
	}

	@Override
	public List<AdminSalesVO> selectMonthlySales(String date) throws Exception {
		return mapper.selectMonthlySales(date);
	}

	@Override
	public List<AdminSalesVO> selectHourlySales() throws Exception {
		return mapper.selectHourlySales();
	}

}
