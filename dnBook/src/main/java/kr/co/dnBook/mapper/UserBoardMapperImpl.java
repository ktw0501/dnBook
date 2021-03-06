package kr.co.dnBook.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dnBook.vo.BoardCommentVO;
import kr.co.dnBook.vo.BoardFileVO;
import kr.co.dnBook.vo.BoardSearchVO;
import kr.co.dnBook.vo.BoardVO;

@Repository
public class UserBoardMapperImpl implements UserBoardMapper {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	private static final String NAMESPACE = "kr.co.dnBook.mapper.UserServiceMapper"; 
	
	@Override
	public List<BoardVO> selectList(BoardSearchVO boardSearch) throws Exception{
		return sqlSessionTemplate.selectList(NAMESPACE + ".selectList", boardSearch);
	}
	
	@Override
	public int selectTotalCount(BoardSearchVO boardSearch) throws Exception {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".selectTotalCount", boardSearch);
	}
	
	@Override
	public BoardVO selectDetail(int no) throws Exception {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".selectBoardDetail", no);
	}
	
	@Override
	public BoardVO selectNext(BoardVO board) throws Exception {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".selectNext", board);
	}
	
	@Override
	public BoardVO selectPrev(BoardVO board) throws Exception {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".selectPrev", board);
	}
	
	@Override
	public List<BoardCommentVO> selectCommentList(BoardCommentVO comment) throws Exception {
		return sqlSessionTemplate.selectList(NAMESPACE + ".selectCommentList", comment);
	}
	
	@Override
	public void insertComment(BoardCommentVO comment) throws Exception {
		sqlSessionTemplate.insert(NAMESPACE + ".insertComment", comment);
	}
	
	@Override
	public void updateComment(BoardCommentVO comment) throws Exception {
		sqlSessionTemplate.update(NAMESPACE + ".updateComment", comment);
	}
	
	@Override
	public void deleteComment(int commentNo) throws Exception {
		sqlSessionTemplate.delete(NAMESPACE + ".deleteComment", commentNo);
	}
	
	@Override
	public void insertViewCount(BoardVO board) throws Exception {
		sqlSessionTemplate.insert(NAMESPACE + ".insertViewCount", board);
	}
	
	@Override
	public BoardFileVO selectBoardFile(BoardVO board) throws Exception {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".selectBoardFile", board);
	}

}
