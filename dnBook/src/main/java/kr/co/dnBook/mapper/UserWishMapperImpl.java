package kr.co.dnBook.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dnBook.vo.WishVO;
@Repository
public class UserWishMapperImpl implements UserWishMapper{

	@Autowired
	private SqlSessionTemplate session;
	private static final String WISH_DAO_NAMESPACE = "kr.co.dnBook.mapper.UserWishMapper";
	
	@Override
	public List<WishVO> selectWish(String id) throws Exception {
		return session.selectList(WISH_DAO_NAMESPACE+".selectWish", id);
		}

		@Override
		public int selectWishCount(String id) throws Exception {
			return session.selectOne(WISH_DAO_NAMESPACE+".selectWishCount",id);
		}
}
