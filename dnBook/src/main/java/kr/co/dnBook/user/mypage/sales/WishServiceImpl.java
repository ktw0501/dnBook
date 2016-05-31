package kr.co.dnBook.user.mypage.sales;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dnBook.mapper.UserWishMapper;
import kr.co.dnBook.vo.WishVO;
@Service
public class WishServiceImpl implements WishService {
	@Autowired
	UserWishMapper dao;

	@Override
	public Map<String, Object> wishList(String id) throws Exception {
		List<WishVO> list = dao.selectWish(id);
			
		// 전체 게시글 카운트
		int totalCount = dao.selectWishCount(id);
				
		Map<String, Object> result = new HashMap<>();
		result.put("list", list);
		result.put("totalCount", totalCount);
		return result;
			}
		}