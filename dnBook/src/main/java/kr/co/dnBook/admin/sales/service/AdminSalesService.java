package kr.co.dnBook.admin.sales.service;

import java.util.List;

import kr.co.dnBook.vo.AdminSalesVO;

public interface AdminSalesService {
	public List<AdminSalesVO> selectDailySales(String date) throws Exception;
	public List<AdminSalesVO> selectMonthlySales(String date) throws Exception;
	public List<AdminSalesVO> selectHourlySales() throws Exception;

}
