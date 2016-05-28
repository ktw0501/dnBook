package kr.co.dnBook.user.book;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dnBook.mapper.UserBookMapper;
import kr.co.dnBook.vo.BoardFileVO;
import kr.co.dnBook.vo.BoardVO;
import kr.co.dnBook.vo.BookRecomVO;

@Service
public class UserBookServiceImpl implements UserBookService{
	@Autowired
	private UserBookMapper dao;
	
	@Override
	public Map<String, Object> detailBook(BookRecomVO bookRecomVO) throws Exception {
		int no = bookRecomVO.getRecomNo();
		// 게시물 조회수 증가
		dao.updatePageViewCnt(no);
		
		// 게시물 정보 조회
		BoardVO board = dao.selectOneBoard(no);
		// 이전글
		BoardVO prev = dao.selectPrevBoard(no);
		board.setPrev(prev);
		
		// 다음글
		BoardVO next = dao.selectNextBoard(no);
		board.setNext(next);
		
		// 추천수 조회
		int recomCount = dao.selectRecomCount(bookRecomVO);
		
		// 파일 정보 조회
		BoardFileVO file = dao.selectBoardFile(no);
		Map<String, Object> result = new HashMap<>();
		result.put("board", board);
		result.put("file", file);
		result.put("recomCount", recomCount);
		return result;
	}
}
