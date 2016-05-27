package kr.co.dnBook.admin.book;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dnBook.vo.BookVO;

@Controller
@RequestMapping("/admin/book")
public class AdminBookController {

	@Autowired
	ServletContext servletContext;
	
	//@Autowierd
	//service
	
	/**
	 * 책 등록
	 * @param book
	 */
	@RequestMapping("/regist.do")
	public void registBook(BookVO book)
	{
		
	}
	
	/**
	 *   레지스트폼으로 이동하기
	 */
	@RequestMapping("/registform.do")
	public void registBook(){}
	
	/**
	 * 수정폼으로 이동
	 * @param book
	 */
	@RequestMapping("/updateform.do")
	public void updateBookForm(BookVO book){}
	
	/**
	 * 수정적용
	 * @param book
	 */
	@RequestMapping("/update.do")
	public void updateBook(BookVO book){}
	
	/**
	 * 삭제하기
	 */
	@RequestMapping("/deleteBook")
	public void deleteBook(BookVO book)
	{
		
	}
	
	
}
