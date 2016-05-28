package kr.co.dnBook.user.mypage.sales;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dnBook.mapper.UserSalesMapper;
import kr.co.dnBook.vo.SalesVO;

@Service
public class SalesServiceImpl implements SalesService{
	@Autowired
	UserSalesMapper mapper;
	
	@Override
	public List<SalesVO> salesListBoard(String id) throws Exception {
		List<SalesVO> list = mapper.selectSales(id);
		return list;
	}


	
}
