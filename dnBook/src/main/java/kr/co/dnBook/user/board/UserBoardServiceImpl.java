package kr.co.dnBook.user.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dnBook.mapper.UserBoardMapper;

@Service
public class UserBoardServiceImpl implements UserBoardService {
	@Autowired
	UserBoardMapper dao;
	
	public void listBoard() {
		
	}
}
