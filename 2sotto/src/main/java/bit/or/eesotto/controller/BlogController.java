package bit.or.eesotto.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.or.eesotto.dto.Blog;
import bit.or.eesotto.dto.BlogComment;
import bit.or.eesotto.dto.User;
import bit.or.eesotto.service.BlogService;



@Controller
@RequestMapping("/blog/")
public class BlogController {

	private static final Logger logger = LoggerFactory.getLogger(BlogController.class); 

	@Autowired
	BlogService bs;

	// 내 블로그 메인 view
	@RequestMapping(value = "myMain.bit", method = RequestMethod.GET)
	public String myMain(String cp, String ps, Principal principal, Model model) {
				
//		String userid = (String) session.getAttribute("userid");
		String userid =  principal.getName();
		logger.info("로그인 유저 아이디: " + userid);
		
		HashMap<String, Object> map = bs.myMainView(cp, ps, userid);
		logger.info("내 블로그 글 리스트 조회 완료");
		
		// view까지 전달 (forward)
		model.addAttribute("cpage", map.get("cpage"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("postList", map.get("postList")); 		
		model.addAttribute("pageCount", map.get("pageCount"));
		model.addAttribute("totalPostCount", map.get("totalPostCount"));

		return "blog/myMain";

	}
	
	// 모두의 블로그 메인 view
	@RequestMapping(value = "main.bit", method = RequestMethod.GET)
	public String main(String cp, String ps, Principal principal, Model model) {
				
//		String userid = (String) session.getAttribute("userid");
		String userid =  principal.getName();
		logger.info("로그인 유저 아이디: " + userid);
		
		HashMap<String, Object> map = bs.mainView(cp, ps, null);
		logger.info("모두의 블로그 글 리스트 조회 완료");
		
		// view까지 전달 (forward)
		model.addAttribute("cpage", map.get("cpage"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("postList", map.get("postList")); 		
		model.addAttribute("pageCount", map.get("pageCount"));
		model.addAttribute("totalPostCount", map.get("totalPostCount"));

		return "blog/main";

	}

	// 블로그 > 상세 페이지 view
	@RequestMapping(value = "detail.bit", method = RequestMethod.GET)
	public String detail(String bindex, Model model) {
		
		Blog post = bs.getPost(bindex);
		logger.info("내 블로그 글 조회 완료");
		model.addAttribute("post", post);
		
		return "blog/detail";	
	}
	
	// 블로그 > 글 수정 view
	@RequestMapping(value = "edit.bit", method = RequestMethod.GET)
	public String update(String bindex, Model model) {
		
		Blog post = bs.getPost(bindex);
		logger.info("내 블로그 글 조회 완료");
		model.addAttribute("post", post);
		
		return "blog/edit";	
	}
	
	// 블로그 > 글 수정 처리
	@RequestMapping(value = "edit.bit", method = RequestMethod.POST)
	public String update(Blog post, Model model) {
											
		String msg = null;
		String url = null;
			
		int result = bs.editPost(post);
	
		if(result==1) {
			
			logger.info("블로그 글 수정 완료");
			msg = "블로그 글 수정 완료";
	        url = "detail.bit?bindex="+post.getBindex();
			
		}else { 
			
			logger.info("블로그 글 수정 실패");
			msg = "블로그 글 수정 실패";
	        url = "javascript:history.back();";

		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "redirect";	
		
	}
	
	// 마이페이지 > 글 삭제 처리
	@RequestMapping(value = "delete.bit", method = {RequestMethod.GET, RequestMethod.POST})
	public String delete(Blog post, Model model) {
											
//		String msg = null;
//		String url = null;
			
		int result = bs.deletePost(post);
	
		if(result==1) {
			
			logger.info("블로그 글 삭제 완료");
//			msg = "블로그 글 삭제 완료";
//	        url = "main.bit";
			return "redirect:/blog/myMain.bit";
			
		}else { 
			
			logger.info("블로그 글 삭제 실패");
//			msg = "블로그 글 삭제 실패";
//	        url = "javascript:history.back();";
	        return "javascript:history.back()";
		}
		
//		model.addAttribute("msg", msg);
//		model.addAttribute("url", url);
		
		//return "redirect";	
		
	}
	

	// 블로그 > 글쓰기 페이지 view
	@RequestMapping(value = "write.bit", method = RequestMethod.GET)
	public String write() {
		return "blog/write";
	}

	// 블로그 > 글쓰기 처리
	@RequestMapping(value = "write.bit", method = RequestMethod.POST)
	public String write(Blog blog, HttpSession session, Principal principal) {
		
		String userid =  principal.getName();
		//String userid = (String) session.getAttribute("userid");
		logger.info("로그인 유저 아이디: " + userid);

		// 나중에 파일 업로드 구현
//		List<CommonsMultipartFile> files = donate.getFiles();
//		List<String> filenames = new ArrayList<String>();
//		if(files != null && files.size() > 0) { //최소 1개의 업로드가 있다면 
//			for(CommonsMultipartFile multifile : files) {
//				String filename = multifile.getOriginalFilename();
//				String path = request.getServletContext().getRealPath("/views/upload");
//				
//				String fpath = path + "\\"+ filename; 
//				
//				if(!filename.equals("")) { //실 파일 업로드
//					FileOutputStream fs = new FileOutputStream(fpath);
//					fs.write(multifile.getBytes());
//					fs.close();
//				}
//				filenames.add(filename); //파일명을 별도 관리 (DB insert)
//			}
//		}

		/* donate.setWriter (principal.getName()); */

		// DB 파일명 저장
//		donate.setDimg(filenames.get(0));
//		logger.info("파일 업로드 완료 ");
		// int result = donationservice.donationWrite(donate, request, principal);

		// 세션 userid, nick post객체에 입력
		blog.setUserid(userid);
		User user = (User)session.getAttribute("user");
		blog.setNick(user.getNick());
		

		// 임시 petindex 입력
		blog.setPetindex(3);

		int result = bs.writePost(blog);
		
		if (result == 1) {

			logger.info("블로그 글 입력 성공");

			return "redirect:/blog/myMain.bit";

		} else { // 회원가입 실패시 어찌할지 로직구현해야 함

			logger.info("블로그 글 입력 실패");

			return "redirect:/blog/myMain.bit";
		}

	}
	
	// 블로그>즐겨찾기 페이지 view
	@RequestMapping(value = "favorite.bit", method = RequestMethod.GET)
	public String favorite() {
		return "blog/favorite";
	}
	
	// 블로그 댓글 입력 Ajax 처리  
	@ResponseBody
	@RequestMapping(value = "writeComment.bit", method = { RequestMethod.POST })
	public int writeComment(BlogComment blogComment, HttpServletRequest request, Model model) throws IOException {
		
		//비밀글 체크 여부 
		if(blogComment.getScstate() == null) {

			blogComment.setScstate("N");
		}
		
		int result = bs.writeCommnet(blogComment);
		
		if(result==1) {
			logger.info("블로그 "+blogComment.getBindex()+"번글 댓글 입력 처리 완료");
		}else {
			logger.info("블로그 "+blogComment.getBindex()+"번글 댓글 입력 처리 실패");
		}
		
		return result;
	}
	
	// 블로그 댓글 수정 Ajax 처리  
	@ResponseBody
	@RequestMapping(value = "editComment.bit", method = { RequestMethod.POST })
	public int editComment(BlogComment blogComment, HttpServletRequest request, Model model) throws IOException {
		
		//비밀글 체크 여부 
		if(blogComment.getScstate() == null) {

			blogComment.setScstate("N");
		}
		
		int result = bs.editComment(blogComment);
		
		if(result==1) {
			logger.info("블로그 "+blogComment.getBindex()+"번글 댓글 수정 처리 완료");
		}else {
			logger.info("블로그 "+blogComment.getBindex()+"번글 댓글 수정 처리 실패");
		}
		
		return result;
	}
	
	// 블로그 댓글 조회 Ajax  
	@ResponseBody
	@RequestMapping(value = "getCommentList.bit", method = { RequestMethod.GET })
	public List<BlogComment> getCommentList(HttpServletRequest request, Model model) throws IOException {
		
		String bindex = request.getParameter("bindex");
		
		List<BlogComment> commentList = bs.getCommentList(bindex);
		
		if(commentList!=null) {
			logger.info("블로그 "+bindex+"번글 댓글내역 조회 완료");
		}else {
			logger.info("블로그 "+bindex+"번글 댓글입력 조회 실패");
		}
		
		return commentList;
	}
	
	// 블로그 > 댓글 삭제 처리
	@RequestMapping(value = "deleteComment.bit", method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteComment(BlogComment comment, Model model) {
											
//		String msg = null;
//		String url = null;
			
		int result = bs.deleteComment(comment);
		int bindex = comment.getBindex();
		if(result==1) {
			
			logger.info("블로그 글 삭제 완료");
//			msg = "블로그 댓글 삭제 완료";
//	        url = "main.bit";
			return "redirect:/blog/detail.bit?bindex="+bindex+"";
			
		}else { 
			
			logger.info("블로그 글 삭제 실패");
//			msg = "블로그 댓글 삭제 실패";
//	        url = "javascript:history.back();";
	        return "javascript:history.back()";
		}
		
//		model.addAttribute("msg", msg);
//		model.addAttribute("url", url);
		
		//return "redirect";	
		
	}

// 블로그 대댓글 입력 Ajax 처리  
	@ResponseBody
	@RequestMapping(value = "writeRecomment.bit", method = { RequestMethod.POST })
	public int writeRecomment(BlogComment blogComment, HttpServletRequest request, Model model) throws IOException {
		
		//비밀글 체크 여부 
		if(blogComment.getScstate() == null) {

			blogComment.setScstate("N");
		}
		
		int result = bs.writeRecomment(blogComment);
		
		if(result==1) {
			logger.info("블로그 "+blogComment.getBindex()+"번글 대댓글 입력 처리 완료");
		}else {
			logger.info("블로그 "+blogComment.getBindex()+"번글 대댓글 입력 처리 실패");
		}
		
		return result;
	}


}
