package kr.co.dnBook.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dnBook.vo.BoardSearchVO;
import kr.co.dnBook.vo.BoardVO;
import kr.co.dnBook.vo.PageVO;

@Repository
public class UserBoardMapperImpl implements UserBoardMapper {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private static final String NAMESPACE = "kr.co.dnBook.mapper.UserBoardMapper"; 
	
	@Override
	public List<BoardVO> selectList(BoardSearchVO boardSearch) throws Exception{
		return sqlSessionTemplate.selectList(NAMESPACE + "selectBoard", boardSearch);
	}
	
	@Override
	public int selectTotalCount(BoardSearchVO boardSearch) throws Exception {
		return sqlSessionTemplate.selectOne(NAMESPACE + "selectBoard", boardSearch);
	}
}
