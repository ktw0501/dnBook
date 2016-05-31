package kr.co.dnBook.admin.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dnBook.admin.board.service.AdminBoardService;
import kr.co.dnBook.vo.BoardCommentVO;
import kr.co.dnBook.vo.BoardFileVO;
import kr.co.dnBook.vo.BoardSearchVO;
import kr.co.dnBook.vo.BoardVO;
import kr.co.dnBook.vo.PageVO;


@Controller
@RequestMapping("/admin/board")
public class AdminBoardController {
	
	@Autowired
	ServletContext servletContext;

	@Autowired
	AdminBoardService service;
	
	@RequestMapping("/list.do")
	public void boardList(Model model, int boardType, @RequestParam(value="pageNo", required=false, defaultValue="1")int pageNo) throws Exception {
		BoardSearchVO boardSearch = new BoardSearchVO(pageNo);
		boardSearch.setBoardType(boardType);
		Map<String, Object> result = service.listBoard(boardSearch);
		List<BoardVO> list = (List<BoardVO>) result.get("list");
		PageVO page = (PageVO) result.get("page");
		model.addAttribute("boardType", boardType);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
	}
	
	@RequestMapping("/detail.do")
	public void boardDetail(BoardVO board, Model model) throws Exception {
		Map<String, Object> result = service.detailBoard(board);
		model.addAttribute("board", result.get("board"));
		model.addAttribute("prev", result.get("prev"));
		model.addAttribute("next", result.get("next"));
	}
	
	@RequestMapping("/commentList.json")
	@ResponseBody
	public List<BoardCommentVO> commentList(BoardCommentVO comment)throws Exception {
		return service.commentList(comment);
	}
	
	@RequestMapping("/insertComment.json")
	@ResponseBody
	public List<BoardCommentVO> insertComment(BoardCommentVO comment) throws Exception {
		return service.insertComment(comment);
	}
	
	@RequestMapping("/updateComment.json")
	@ResponseBody
	public List<BoardCommentVO> updateComment(BoardCommentVO comment) throws Exception {
		return service.updateComment(comment);
	}
	
	@RequestMapping("/deleteComment.json")
	@ResponseBody
	public List<BoardCommentVO> deleteComment(BoardCommentVO comment) throws Exception {
		return service.deleteComment(comment);
	}
	
	@RequestMapping("/regist.do")
	public String insertBoard(MultipartHttpServletRequest mRequest) throws Exception {
		// 데이터베이스에 파일 정보 추가
		String savePath = servletContext.getRealPath("upload");
		System.out.println("savePath ::: " + savePath);
		
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String str = sdf.format(new Date());
		
		File f = new File(savePath + str);
//		System.out.println(f.mkdirs());
		
		String title = mRequest.getParameter("title");
		String id = mRequest.getParameter("id");
		String content = mRequest.getParameter("content");
		int boardType = Integer.parseInt(mRequest.getParameter("boardType"));
		
		BoardVO board = new BoardVO();
		board.setTitle(title);
		board.setId(id);
		board.setContent(content);
		board.setBoardType(boardType);
		
		BoardFileVO file = null;
		MultipartFile mFile = mRequest.getFile("attachFile");
		// 원본 파일명
		String oriFileName = mFile.getOriginalFilename();
		if(oriFileName != null && !oriFileName.equals("")) {
			
			// 확장자 처리
			String ext = "";
			// 뒤쪽에 있는 . 의 위치 
			int index = oriFileName.lastIndexOf(".");
			if (index != -1) {
				// 파일명에서 확장자명(.포함)을 추출
				ext = oriFileName.substring(index);
			}
			
			// 파일 사이즈
			long fileSize = mFile.getSize();
			System.out.println("파일 사이즈 : " + fileSize);
			
			// 고유한 파일명 만들기	
			String saveFileName = "dnBook-" + UUID.randomUUID().toString() + ext;
			System.out.println("저장할 파일명 : " + saveFileName);
		
			// 임시저장된 파일을 원하는 경로에 저장
			mFile.transferTo(new File(savePath + "/" + saveFileName));

			// 파일 관련 데이터 저장
			file = new BoardFileVO();
			file.setFilePath(str);
			file.setOriFileName(mFile.getOriginalFilename());
			file.setRealFileName(saveFileName);
			file.setFileSize(mFile.getSize());
		}
		service.insertBoard(board, file);
		return "redirect:list.do?boardType=" + board.getBoardType();
	}	
	
	
	@RequestMapping("/registForm.do")
	public void registForm(Model model, int boardType) throws Exception {
		model.addAttribute("boardType", boardType);
	}
	
	@ResponseBody
	@RequestMapping("/delete.do")
	public String deleteBoard(String data, int boardType) throws Exception {
		// 게시물 삭제 처리 호출
		service.deleteBoard(data);
		// 페이지 이동
		return "redirect:list.do?boardType=" + boardType;
	}
	
}
