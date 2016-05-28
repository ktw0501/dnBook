package kr.co.dnBook.user.mypage.sales;

import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class SalesServiceImpl implements SalesService{

	@Override
	public Map<String, Object> salesListBoard(String id) throws Exception {
		List<SalesVO> list = userSalesMapper.selectSales();
		return null;
	}


	
}
