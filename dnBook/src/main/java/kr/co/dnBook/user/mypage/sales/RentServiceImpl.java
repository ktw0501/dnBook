package kr.co.dnBook.user.mypage.sales;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dnBook.mapper.UserRentMapper;

@Service
public class RentServiceImpl implements RentService{
	@Autowired
	UserRentMapper dao;

	@Override
	public Map<String, Object> rentList(String id) throws Exception {
		return null;
	}

}
