package kr.co.dnBook.admin.sales;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dnBook.admin.sales.service.AdminSalesService;
import kr.co.dnBook.vo.AdminSalesVO;

@Controller
@RequestMapping("/admin/sales")
public class AdminSalesController {
	@Autowired
	private AdminSalesService service;
	
	@RequestMapping("/main.do")
	public void mainSales() throws Exception {}
	
	@ResponseBody
	@RequestMapping("/daily.do")
	public List<AdminSalesVO> DailySales(String date,Model model) throws Exception{
		return service.selectDailySales(date);
	}
	@ResponseBody
	@RequestMapping("/monthly.do")
	public List<AdminSalesVO> MonthlySales(String date,Model model) throws Exception{
		return service.selectMonthlySales(date);
	}
	@ResponseBody
	@RequestMapping("/hourly.do")
	public List<AdminSalesVO> HourlySales(Model model) throws Exception{
		return service.selectHourlySales();
	}

	

}
