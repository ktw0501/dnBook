package kr.co.dnBook.mapper;

import java.util.List;

import kr.co.dnBook.vo.AdminSalesVO;

public interface AdminSalesMapper {
	
	public List<AdminSalesVO> selectDailySales(String date) throws Exception;
	public List<AdminSalesVO> selectMonthlySales(String date) throws Exception;
	public List<AdminSalesVO> selectHourlySales() throws Exception;

}
