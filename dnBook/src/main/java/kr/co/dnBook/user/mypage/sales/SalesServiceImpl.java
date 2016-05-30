package kr.co.dnBook.user.mypage.sales;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dnBook.mapper.UserSalesMapper;
import kr.co.dnBook.vo.BoardSearchVO;
import kr.co.dnBook.vo.PageVO;
import kr.co.dnBook.vo.SalesVO;

@Service
public class SalesServiceImpl implements SalesService{
	@Autowired
	UserSalesMapper dao;
	
	@Override
	public List<SalesVO> salesListBoard(String id) throws Exception {
		System.out.println(id);
		List<SalesVO> list = dao.selectSales(id);
		System.out.println(list.size());
		return list;
	}



	
}
