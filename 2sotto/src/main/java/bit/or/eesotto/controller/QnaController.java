package bit.or.eesotto.controller;

import java.io.IOException;
import java.security.*;
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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import bit.or.eesotto.dto.Blog;
import bit.or.eesotto.dto.BlogComment;
import bit.or.eesotto.dto.Qna;
import bit.or.eesotto.dto.QnaComment;
import bit.or.eesotto.service.QnaService;


@Controller
@RequestMapping("/qna/")
public class QnaController {

	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired
	QnaService qnas;
	
	
	// Qna 보러가기
	@RequestMapping(value = "main.bit", method = RequestMethod.GET)
	public String mainView(String cp, String ps, Principal principal, Model model) {
		
		//String userid = (String) session.getAttribute("userid");
		String userid =  principal.getName();
		logger.info("로그인 유저 아이디: " + userid);
		
		HashMap<String, Object> map = qnas.mainView(cp, ps, userid);
		
		// view까지 전달 (forward)
		model.addAttribute("cpage", map.get("cpage"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("qnaList", map.get("qnaList")); 		
		model.addAttribute("pageCount", map.get("pageCount"));
		model.addAttribute("totalMsgcount", map.get("totalMsgcount"));
		
		return "qna/main";
	}


	// QNA 상세 페이지 view
	@RequestMapping(value = "detail.bit", method = RequestMethod.GET)
	public String detail(String qaindex, Model model) {

		Qna qna = qnas.getPost(qaindex);
		logger.info("내 Qna 글 조회 완료");
		
		int result = 0;
		
		//자신의 글이 아니면 조회수 증가
		if(!qna.getUserid().equals(qaindex)) {
			result = qnas.updateQnaCount(qaindex);  
		}
		
		if (result == 1) {
			logger.info(qaindex+"번 블로그 글 조회수 업데이트 성공");
		}
		
		
		model.addAttribute("qna", qna);
		
		return "qna/detail";
	}
	
	// Qna > Qna글 수정 view
		@RequestMapping(value = "edit.bit", method = RequestMethod.GET)
		public String update(String qaindex, Model model) {
			
			Qna qna = qnas.getPost(qaindex);
			logger.info("내 QNA 글 조회 완료");
			model.addAttribute("qna", qna);
			
			return "qna/edit";	
		}
		// Qna > Qna글 답글작성 view
	
		@RequestMapping(value = "reply.bit", method = RequestMethod.GET)
		public String replyUpdate(String qaindex, Model model) {
			
			Qna qna = qnas.getPost(qaindex);
			logger.info("답글 작성 뷰 완료");
			model.addAttribute("qna", qna);
			
			return "qna/reply";	
		}
		
		
		// Qna > 글 수정 처리
		@RequestMapping(value = "edit.bit", method = RequestMethod.POST)
		public String update(Qna qna, Model model) {
												
			String msg = null;
			String url = null;
				
			int result = qnas.editPost(qna);
		
			if(result==1) {
				
				logger.info("Qna 글 수정 완료");
				msg = "Qna 글 수정 완료";
		        url = "main.bit";	
			}else { 
				
				logger.info("Qna 글 수정 실패");
				msg = "Qna 글 수정 실패";
		        url = "javascript:history.back();";
			}
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "redirect";	
			
		}
		

		// Qna > 관리자 답글 처리
		
		@RequestMapping(value = "reply.bit", method = RequestMethod.POST)
		public String replyUpdate(Qna qna, Model model) {
												
			String msg = null;
			String url = null;
				
		int result = qnas.editReplyPost(qna);
		
			if(result==1) {
				
				logger.info("관리자 답글 작성 완료");
				msg = "관리자 답글 작성 완료";
		        url = "main.bit";
				
			}else { 
				
				logger.info("관리자 답글 작성 실패");
				msg = "관리자 답글 작성 실패";
		        url = "javascript:history.back();";

			}
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "redirect";	
			
		}	
		
			
		// Qna > 글 댓글 처리
		/*
		@RequestMapping(value = "reply.bit", method = RequestMethod.POST)
		public String insertReply(Qna qna, Model model) {
														
			//String msg = null;
			//String url = null;
						
			int result = qnas.editPost(qna);
				
			if(result==1) {
						
				logger.info("Qna 글 답글 완료");
			//	msg = "Qna 글 답글 완료";
			//	url = "main.bit";
				return "redirect:/qna/main.bit";
			}else { 
						
				logger.info("Qna 글 답글 실패");
			//	msg = "Qna 글 답글 실패";
			//	url = "javascript:history.back();";
				return "redirect:/qna/main.bit";
			}
					
		//	model.addAttribute("msg", msg);
		//	model.addAttribute("url", url);
					
		//	return "redirect";	
					
		}
		*/

		// Qna > 글 삭제 처리
		@RequestMapping(value = "delete.bit", method = {RequestMethod.GET, RequestMethod.POST})
		public String delete(Qna post, Model model) {
												
			//String msg = null;
			//String url = null;
				
			int result = qnas.deletePost(post);
		
			if(result==1) {
				
				logger.info("Qna 글 삭제 완료");
				//msg = "Qna 글 삭제 완료";
		        //url = "main.bit";
				return "redirect:/qna/main.bit";
			}else { 
				
				logger.info("Qna 글 삭제 실패");
				//msg = "Qna 글 삭제 실패";
		        //url = "javascript:history.back();";
				return "javascript:history.back()";
			}
			
			//model.addAttribute("msg", msg);
			//model.addAttribute("url", url);
			
			//return "redirect";	
			
		}
	

	// Qna write보러가기
	@RequestMapping(value = "write.bit", method = RequestMethod.GET)
	public String qaWrite() {
	
		return "qna/write";
	}

	// Qna>글쓰기 페이지 view
			@RequestMapping(value = "write.bit", method = RequestMethod.POST)
			public String write(Qna qna, Principal principal) {

				//String userid = (String) session.getAttribute("userid");
				String userid =  principal.getName();
				logger.info("로그인 유저 아이디: " + userid);
			
				// 세션 userid post객체에 입력
				qna.setUserid(userid);

				// 임시 petindex 입력
				//message.setMsindex(1);

				int result = qnas.writeQna(qna);
				if (result == 1) {
					
					logger.info("Qna 글작성  성공");

					return "redirect:/qna/main.bit";
					
				} else { // 회원가입 실패시 어찌할지 로직구현해야 함

					logger.info("Qna 글작성 실패");

					return "redirect:/qna/main.bit";
				}
	

			}
			
			
		// Qna 댓글 입력 Ajax 처리  
		@ResponseBody
		@RequestMapping(value = "writeComment.bit", method = { RequestMethod.POST })
		public int writeComment(QnaComment qnaComment, HttpServletRequest request, Model model) throws IOException {
			
			//비밀글 체크 여부 
			if(qnaComment.getScstate() == null) {

				qnaComment.setScstate("N");
			}
			
			int result = qnas.writeCommnet(qnaComment);
			
			if(result==1) {
				logger.info("Qna"+qnaComment.getQaindex()+"번글 댓글 입력 처리 완료");
			}else {
				logger.info("Qna"+qnaComment.getQaindex()+"번글 댓글 입력 처리 실패");
			}
			
			return result;
		}
		
		// Qna 댓글 수정 Ajax 처리  
		@ResponseBody
		@RequestMapping(value = "editComment.bit", method = { RequestMethod.POST })
		public int editComment(QnaComment qnaComment, HttpServletRequest request, Model model) throws IOException {
			
			//비밀글 체크 여부 
			if(qnaComment.getScstate() == null) {

				qnaComment.setScstate("N");
			}
			
			int result = qnas.editComment(qnaComment);
			
			if(result==1) {
				logger.info("Qna"+qnaComment.getQaindex()+"번글 댓글 수정 처리 완료");
			}else {
				logger.info("Qna"+qnaComment.getQaindex()+"번글 댓글 수정 처리 실패");
			}
			
			return result;
		}
		
		// Qna 댓글 조회 Ajax  
		@ResponseBody
		@RequestMapping(value = "getCommentList.bit", method = { RequestMethod.GET })
		public List<QnaComment> getCommentList(HttpServletRequest request, Model model) throws IOException {
			
			String qaindex = request.getParameter("qaindex");
			
			List<QnaComment> commentList = qnas.getCommentList(qaindex);
			
			if(commentList!=null) {
				logger.info("Qna"+qaindex+"번글 댓글내역 조회 완료");
			}else {
				logger.info("Qna"+qaindex+"번글 댓글입력 조회 실패");
			}
			
			return commentList;
		}
		
			
		// QNA > 댓글 삭제 처리
		@RequestMapping(value = "deleteComment.bit", method = {RequestMethod.GET, RequestMethod.POST})
		public String deleteComment(QnaComment comment, Model model) {

//			String msg = null;
//			String url = null;

			int result = qnas.deleteComment(comment);
			int qaindex = comment.getQaindex();
			if(result==1) {

				logger.info("QNA 댓글 삭제 완료");
//				msg = "블로그 댓글 삭제 완료";
//		        url = "main.bit";
				return "redirect:/qna/detail.bit?qaindex="+qaindex+"";
				
			}else { 

				logger.info("QNA 댓글 삭제 실패");
//				msg = "블로그 댓글 삭제 실패";
//		        url = "javascript:history.back();";
		        return "javascript:history.back()";
			}

//			model.addAttribute("msg", msg);
//			model.addAttribute("url", url);

			//return "redirect";	

		}	
			
			
			
			
			
			
}
