package kr.co.dnBook.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dnBook.vo.BoardSearchVO;
import kr.co.dnBook.vo.BoardVO;

@Repository
public class AdminBoardMapperImpl implements AdminBoardMapper{

	@Autowired
	private SqlSessionTemplate session;
	
	private static final String BOARD_DAO_NAMESPACE = "kr.co.dnBook.mapper.AdminBoardMapper";
	
	public List<BoardVO> selectBoard(BoardSearchVO searchVO) throws Exception {
		return session.selectList(BOARD_DAO_NAMESPACE + ".selectBoard", searchVO);
	}

	public int selectBoardCount() throws Exception {
		return session.selectOne(BOARD_DAO_NAMESPACE + ".selectBoardCount");
	}

	
	
	
}
