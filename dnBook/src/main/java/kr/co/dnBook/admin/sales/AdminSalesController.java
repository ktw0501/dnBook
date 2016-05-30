package kr.co.dnBook.admin.sales;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/sales")
public class AdminSalesController {
	@RequestMapping("/daily.do")
	public void DailySales() throws Exception{}
	@RequestMapping("/weekly.do")
	public void WeeklySales() throws Exception{}
	@RequestMapping("/monthly.do")
	public void MonthlySales() throws Exception{}
	@RequestMapping("/hourly.do")
	public void HourlySales() throws Exception{}

	

}
