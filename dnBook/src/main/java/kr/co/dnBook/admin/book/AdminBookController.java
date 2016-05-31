package kr.co.dnBook.admin.book;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dnBook.admin.book.service.AdminBookService;
import kr.co.dnBook.util.PdfImage;
import kr.co.dnBook.vo.BookSearchVO;
import kr.co.dnBook.vo.BookVO;
import kr.co.dnBook.vo.PageVO;
import kr.co.dnBook.vo.ReviewVO;

@Controller
@RequestMapping("/admin/book")
public class AdminBookController {

	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private AdminBookService adminBookService;
	
	
	@RequestMapping("/list.do")
	public void listBook(@RequestParam(value="pageNo" , required=false, defaultValue = "1")int pageNo,Model model) throws Exception
	{
		BookSearchVO searchVO = new BookSearchVO(pageNo);
		Map<String,Object> result = adminBookService.listBook(searchVO);
		
		model.addAttribute("list",result.get("list"));
		
		int totalCount = (Integer)result.get("totalCount");
	
		PageVO page = new PageVO(pageNo, totalCount);
		model.addAttribute("page",page);
	}

	/**
	 * 책 등록 폼 
	 * @param mReq
	 * @throws Exception
	 */
	@RequestMapping("/regist.do")
	public String registBook(MultipartHttpServletRequest mReq) throws Exception
	{
		BookVO book = new BookVO();
		book.setTitle(mReq.getParameter("title"));
		book.setPublisher(mReq.getParameter("publisher"));
		book.setAuthor(mReq.getParameter("author"));
		book.setTranslator(mReq.getParameter("translator"));
		book.setDescription(mReq.getParameter("description"));
		book.setPrice(Integer.parseInt(mReq.getParameter("price")));
		book.setRentPrice(Integer.parseInt(mReq.getParameter("rentPrice")));
		book.setPubDate(mReq.getParameter("pubDate"));
		book.setCategoryCode(mReq.getParameter("categoryCode"));
		String uploadPath = servletContext.getRealPath("/upload/");
		String path = book.getPubDate()+"/"+book.getTitle();
		uploadPath+=path;
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists())
		{
			uploadDir.mkdirs();
		}
		
		Iterator<String> iter = mReq.getFileNames();
		while(iter.hasNext())
		{
			String formFileName = iter.next();
			MultipartFile mFile = mReq.getFile(formFileName);
			
			String oriFileName = mFile.getOriginalFilename();
			String saveFileName = book.getTitle();
			File file = null;
			if(oriFileName != null && !oriFileName.equals(""))
			{
				String ext = "";
				int index = oriFileName.lastIndexOf(".");
				if(index != -1)
				{
					ext = oriFileName.substring(index);
				}
				if(ext.equalsIgnoreCase(".pdf"))
				{
					saveFileName += "-PDF-"+UUID.randomUUID().toString()+ext;
					book.setPdfPath(saveFileName);
					file = new File(uploadDir , saveFileName);
					mFile.transferTo(file);
					book.setRentalDirPath(book.getPubDate()+"/"+book.getTitle());
					PdfImage.execute(uploadDir,saveFileName);

				}
				else if(ext.equalsIgnoreCase(".jpg") || ext.equalsIgnoreCase(".gif") ||
						ext.equalsIgnoreCase(".jpeg") || ext.equalsIgnoreCase(".png"))
				{
					saveFileName += "-cover-"+UUID.randomUUID().toString()+ext;
					book.setCoverImg(saveFileName);
					file = new File(uploadDir , saveFileName);
					mFile.transferTo(file);
				}
				else
				{
					/*
					 * 파일이 잘못들어왔거나 파일이 없을때 또는 갯수가 틀렸을때 에러발생하도록 처리예쩡
					 */
					System.out.println("에러처리");
				}
			}
		}
		adminBookService.insertBook(book);
		
		
		return "redirect:/admin/book/list.do";
	}
	
	/**
	 *   레지스트폼으로 이동하기
	 */
	@RequestMapping("/registform.do")
	public void registBookForm()throws Exception{}
	
	@RequestMapping("/detail.do")
	public void detailBook(int bookCode, Model model)throws Exception
	{
		BookVO book = adminBookService.detailBook(bookCode);
		List<ReviewVO> reviews = adminBookService.listReview(bookCode);
		model.addAttribute("book",book);
		model.addAttribute("reviews",reviews);
	}
	
	/**
	 * 수정폼으로 이동
	 * @param book
	 */
	@RequestMapping("/updateform.do")
	public void updateBookForm(int bookCode, Model model) throws Exception{
		BookVO book = adminBookService.updateFormBook(bookCode);
		model.addAttribute("book",book);
		
	}
	
	/**
	 * 수정적용
	 * @param book
	 */
	@RequestMapping("/update.do")
	public String updateBook(MultipartHttpServletRequest mReq) throws Exception
	{
		BookVO book = new BookVO();
		book.setBookCode(Integer.parseInt(mReq.getParameter("bookCode")));
		book.setCoverImg(mReq.getParameter("coverImg"));
		book.setRentalDirPath(mReq.getParameter("rentalDirPath"));
		book.setPdfPath(mReq.getParameter("pdfPath"));
		book.setTitle(mReq.getParameter("title"));
		book.setPublisher(mReq.getParameter("publisher"));
		book.setAuthor(mReq.getParameter("author"));
		book.setTranslator(mReq.getParameter("translator"));
		book.setDescription(mReq.getParameter("description"));
		book.setPrice(Integer.parseInt(mReq.getParameter("price")));
		book.setRentPrice(Integer.parseInt(mReq.getParameter("rentPrice")));
		book.setPubDate(mReq.getParameter("pubDate"));
		book.setCategoryCode(mReq.getParameter("categoryCode"));
		String uploadPath = servletContext.getRealPath("/upload/");
		String path = book.getPubDate()+"/"+book.getTitle();
		uploadPath+=path;
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists())
		{
			uploadDir.mkdirs();
		}
		
		Iterator<String> iter = mReq.getFileNames();
		while(iter.hasNext())
		{
			String formFileName = iter.next();
			MultipartFile mFile = mReq.getFile(formFileName);
			
			String oriFileName = mFile.getOriginalFilename();
			String saveFileName = book.getTitle();
			File file = null;
			if(oriFileName != null && !oriFileName.equals(""))
			{
				String ext = "";
				int index = oriFileName.lastIndexOf(".");
				if(index != -1)
				{
					ext = oriFileName.substring(index);
				}
				if(ext.equalsIgnoreCase(".pdf"))
				{
					saveFileName += "-PDF-"+UUID.randomUUID().toString()+ext;
					book.setPdfPath(saveFileName);
					file = new File(uploadDir , saveFileName);
					mFile.transferTo(file);
					book.setMaxPage(PdfImage.execute(uploadDir,saveFileName));
					book.setRentalDirPath(path);

				}
				else if(ext.equalsIgnoreCase(".jpg") || ext.equalsIgnoreCase(".gif") ||
						ext.equalsIgnoreCase(".jpeg") || ext.equalsIgnoreCase(".png"))
				{
					saveFileName += "-cover-"+UUID.randomUUID().toString()+ext;
					book.setCoverImg(saveFileName);
					file = new File(uploadDir , saveFileName);
					mFile.transferTo(file);
				}
			}
		}
		adminBookService.updateBook(book);
		
		
		return "redirect:/admin/book/detail.do?bookCode="+book.getBookCode();
		
	}
	
	/**
	 * 삭제하기
	 */
	@ResponseBody
	@RequestMapping("/deleteBook.do")
	public String deleteBook(String data) throws Exception
	{
		adminBookService.deleteBook(data);
		return "delete";
	}
	@RequestMapping("/down.do")
	public void download(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// 파일 다운로드 처리 진행
		String downName = req.getParameter("downName");
		String realName = req.getParameter("realName");
		// Y, y ->  화면에 이미지를 그리기
		// Y 이외의 값이면 다운로드 하기
		String draw = req.getParameter("draw");
		// 서버상에 설정된 upload 경로
		ServletContext context = req.getServletContext();
		String uploadPath = context.getRealPath("upload");
		
		// uploadPath : c:/java81/tomcat-work/wtpwebapps/Board-PRJ/upload
		// /2016/04/17/test-1.jpg
		File file = new File(uploadPath + realName);
		
		// 다운로드와 관련된 헤더 설정
		// 웹브라우져에 이미지 그리기
		if (draw != null && draw.equalsIgnoreCase("y")) {
			resp.setHeader("Content-Type", "image/jpg");
		}
		// 사용자 컴퓨터에 다운로드
		else {
			resp.setHeader("Content-Type", "application/octet-stream");
			resp.setHeader(
				"Content-Disposition", 
				"attachment;filename=" + new String(downName.getBytes("UTF-8"), "8859_1"));
			resp.setHeader("Content-Transfer-Encoding", "binary");
			resp.setHeader("Content-Length", String.valueOf(file.length()));
		}
		// 파일을 읽고 브라우져로 데이터를 전송
		if (file.isFile()) {
			FileInputStream fis = new FileInputStream(file);
			BufferedInputStream bis = new BufferedInputStream(fis);
			
			OutputStream out = resp.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(out);
			
			while (true) {
				int ch = bis.read();
				if (ch == -1) break;
				
				bos.write(ch);
			}
			bos.close();
			out.close();
			bis.close();
			fis.close();
		}
	}
	
	
}
