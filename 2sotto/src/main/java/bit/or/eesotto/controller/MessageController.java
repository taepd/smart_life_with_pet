package bit.or.eesotto.controller;

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

import bit.or.eesotto.dto.Message;
import bit.or.eesotto.dto.Qna;
import bit.or.eesotto.service.MessageService;
@Controller
@RequestMapping("/message/")
public class MessageController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired
	MessageService ms;
	//임시 테스트중
	//받은쪽지 보러가기
	@RequestMapping(value = "msgRePage.bit", method = RequestMethod.GET)
	public String msgRePageView(String cp, String ps, Principal principal, Model model) {

		//String userid = (String) session.getAttribute("userid");
		String userid =  principal.getName();
		logger.info("로그인 유저 아이디: " + userid);
		
		HashMap<String, Object> map = ms.rPageView(cp, ps, userid);
		
		// view까지 전달 (forward)
		model.addAttribute("cpage", map.get("cpage"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("messageList", map.get("messageList")); 		
		model.addAttribute("pageCount", map.get("pageCount"));
		model.addAttribute("totalMsgCount", map.get("totalMsgCount"));

		return "message/msgRePage";
		}
	//받은쪽지 보러가기 끝
	
	//쪽지보낸사람 보러가기
	@RequestMapping(value = "msgSePage.bit", method = RequestMethod.GET)
	public String msgSePageView(String cp, String ps, Principal principal, Model model) {

		//String userid = (String) session.getAttribute("userid");
		String userid =  principal.getName();
		logger.info("로그인 유저 아이디: " + userid);
		
		HashMap<String, Object> map = ms.sPageView(cp, ps, userid);
		
		// view까지 전달 (forward)
		model.addAttribute("cpage", map.get("cpage"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("messageList", map.get("messageList")); 		
		model.addAttribute("pageCount", map.get("pageCount"));
		model.addAttribute("totalMsgCount", map.get("totalMsgCount"));

		return "message/msgSePage";
	}
	//쪽지 보낸사람 보러가기 끝
	
	//쪽지 보내기 시작
	// 쪽지>쪽지 페이지 view
	// 쪽지>보낸사람 view
	@RequestMapping(value = "msgWrite.bit", method = RequestMethod.GET)
	public String msgWrite(String suserid) {

		// 쪽지 할예정

		return "message/msgWrite";
	}
	
	@RequestMapping(value = "msgWrite.bit", method = RequestMethod.POST)
	public String msgWrite(Message message, Principal principal) {
		logger.info("값이 들어오니?");
		//String userid = (String) session.getAttribute("userid");
		String userid =  principal.getName();
		logger.info("로그인 유저 아이디: " + userid);
	
		// 세션 userid post객체에 입력
		message.setSuserid(userid);

		// 임시 petindex 입력
		//message.setMsindex(1);

		int result = ms.writeMessage(message);
		if (result == 1) {
			
			logger.info("쪽지 보내기 성공");

			return "redirect:/message/msgRePage.bit";
			
		} else { 

			logger.info("쪽지 보내기 실패");

			return "redirect:/message/msgRePage.bit";
		}

	}
	
	
	//쪽지보내기 끝
	//임시 테스트중
	
	//받은쪽지 보러가기
	@RequestMapping(value = "rPage.bit", method = RequestMethod.GET)
	public String rPageView(String cp, String ps, Principal principal, Model model) {

		//String userid = (String) session.getAttribute("userid");
		String userid =  principal.getName();
		logger.info("로그인 유저 아이디: " + userid);
		
		HashMap<String, Object> map = ms.rPageView(cp, ps, userid);
		
		// view까지 전달 (forward)
		model.addAttribute("cpage", map.get("cpage"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("messageList", map.get("messageList")); 		
		model.addAttribute("pageCount", map.get("pageCount"));
		model.addAttribute("totalMsgCount", map.get("totalMsgCount"));

		return "message/msgSePage";
		}
	// 쪽지>보낸사람 view
		@RequestMapping(value = "write.bit", method = RequestMethod.GET)
		public String write(String suserid) {

			// 쪽지 할예정

			return "message/write";
		}
		

			
			
		// 쪽지>쪽지 페이지 view
		@RequestMapping(value = "write.bit", method = RequestMethod.POST)
		public String write(Message message, Principal principal) {
			logger.info("값이 들어오니?");
			//String userid = (String) session.getAttribute("userid");
			String userid =  principal.getName();
			logger.info("로그인 유저 아이디: " + userid);
		
			// 세션 userid post객체에 입력
			message.setSuserid(userid);

			// 임시 petindex 입력
			//message.setMsindex(1);

			int result = ms.writeMessage(message);
			if (result == 1) {
				
				logger.info("쪽지 보내기 성공");

				return "redirect:/message/msgRePage.bit";
				
			} else { // 회원가입 실패시 어찌할지 로직구현해야 함

				logger.info("쪽지 보내기 실패");

				return "redirect:/message/msgRePage.bit";
			}

		}
		
		
		// 쪽지 팝업
		@RequestMapping(value = "popmain.bit", method = RequestMethod.GET)
		public String popmain(String suserid, String cp, String ps, Principal principal, 
								HttpServletRequest request, Model model) {
			
			String userid =  principal.getName();
			logger.info("로그인 유저 아이디: " + userid);
			HashMap<String, Object> map = ms.rPageView(cp, ps, userid);
			
			//받는 사람 id
			String ruserid = request.getParameter("ruserid");
			logger.info("쪽지 수신 아이디: "+ ruserid);
			
			// view까지 전달 (forward)
			model.addAttribute("cpage", map.get("cpage"));
			model.addAttribute("pageSize", map.get("pageSize"));
			model.addAttribute("messageList", map.get("messageList")); 		
			model.addAttribute("pageCount", map.get("pageCount"));
			model.addAttribute("totalMsgCount", map.get("totalMsgCount"));
			model.addAttribute("ruserid", ruserid);

			// 쪽지 할예정

			return "message/popmain";
		}
		// a에게 쪽지보내기 페이지 view
		@RequestMapping(value = "popmain.bit", method = RequestMethod.POST)
		public String popmain(Message message, Principal principal) {

			//String userid = (String) session.getAttribute("userid");
			String userid =  principal.getName();
			logger.info("로그인 유저 아이디: " + userid);
		
			// 세션 userid post객체에 입력
			message.setSuserid(userid);

			// 임시 petindex 입력
			//message.setMsindex(1);

			int result = ms.writeMessage(message);
			if (result == 1) {
				
				logger.info("쪽지 보내기 성공");

				return "redirect:/message/popmain.bit";
				
			} else { // 회원가입 실패시 어찌할지 로직구현해야 함

				logger.info("쪽지 보내기 실패");

				return "redirect:/message/popmain.bit";
			}

		}
		
		//message보낸사람 보러가기
		@RequestMapping(value = "sPage.bit", method = RequestMethod.GET)
		public String sPageView(String cp, String ps, Principal principal, Model model) {
	
			//String userid = (String) session.getAttribute("userid");
			String userid =  principal.getName();
			logger.info("로그인 유저 아이디: " + userid);
			
			HashMap<String, Object> map = ms.sPageView(cp, ps, userid);
			
			// view까지 전달 (forward)
			model.addAttribute("cpage", map.get("cpage"));
			model.addAttribute("pageSize", map.get("pageSize"));
			model.addAttribute("messageList", map.get("messageList")); 		
			model.addAttribute("pageCount", map.get("pageCount"));
			model.addAttribute("totalMsgCount", map.get("totalMsgCount"));
	
			return "message/sPage";
		}
		
		// Message 상세 페이지 view
		@RequestMapping(value = "msgDetail.bit", method = RequestMethod.GET)
		public String detail(String msindex, Principal principal, Model model) {
			
			String ruserid = principal.getName(); //현재 로그인 유저의 아이디
			
			Message message = ms.getMessage(msindex, ruserid);
			logger.info("내 Message  조회 완료");
			model.addAttribute("message", message);
			
			return "message/msgDetail";
		}
		
		// message > 글 삭제 처리
		@RequestMapping(value = "delete.bit", method = {RequestMethod.GET, RequestMethod.POST})
		public String delete(Message message, HttpServletRequest request, Model model) {
			logger.info("여기까지 들어오는건가??");				
			//String msg = null;
			//String url = null;
			String[] msindexArr =request.getParameterValues("msindexes");	
			System.out.println("arr"+ msindexArr.toString());
			
			int result =1;
			
			for(String msindex: msindexArr) {
				message.setMsindex(Integer.parseInt(msindex));
				result *= ms.deleteMessage(message);
			}
			
			
			if(result != 0) { // 만일 result중 하나라도 실패가 있으면 0이 됨
				
				logger.info("message 글 삭제 완료");
				//msg = "Qna 글 삭제 완료";
		        //url = "main.bit";
				return "redirect:/message/msgRePage.bit";
			}else { 
				
				logger.info("message 글 삭제 실패");
				//msg = "Qna 글 삭제 실패";
		        //url = "javascript:history.back();";
				return "javascript:history.back()";
			}
			
			//model.addAttribute("msg", msg);
			//model.addAttribute("url", url);
			
			//return "redirect";	
			
		}
		
		
		// message > 글 삭제 처리
				@RequestMapping(value = "detailDelete.bit", method = {RequestMethod.GET, RequestMethod.POST})
				public String detailDelete(Message message, HttpServletRequest request, Model model) {
					logger.info("여기까지 들어오는건가??");				
					//String msg = null;
					//String url = null;
					String[] msindexArr =request.getParameterValues("msindex");	
					System.out.println("arr"+ msindexArr.toString());
					
					int result =1;
					
					for(String msindex: msindexArr) {
						message.setMsindex(Integer.parseInt(msindex));
						result *= ms.deleteMessage(message);
					}
					
					
					if(result != 0) { // 만일 result중 하나라도 실패가 있으면 0이 됨
						
						logger.info("message 글 삭제 완료");
						//msg = "Qna 글 삭제 완료";
				        //url = "main.bit";
						return "redirect:/message/msgRePage.bit";
					}else { 
						
						logger.info("message 글 삭제 실패");
						//msg = "Qna 글 삭제 실패";
				        //url = "javascript:history.back();";
						return "javascript:history.back()";
					}
					
					//model.addAttribute("msg", msg);
					//model.addAttribute("url", url);
					
					//return "redirect";	
					
				}
		
			
				
				
				
			//받은쪽지 보러가기
			@RequestMapping(value = "popRePage.bit", method = RequestMethod.GET)
			public String popRePage(String cp, String ps, Principal principal, Model model) {

				//String userid = (String) session.getAttribute("userid");
				String userid =  principal.getName();
				logger.info("로그인 유저 아이디: " + userid);
				
				HashMap<String, Object> map = ms.rPageView(cp, ps, userid);
				
				// view까지 전달 (forward)
				model.addAttribute("cpage", map.get("cpage"));
				model.addAttribute("pageSize", map.get("pageSize"));
				model.addAttribute("messageList", map.get("messageList")); 		
				model.addAttribute("pageCount", map.get("pageCount"));
				model.addAttribute("totalMsgCount", map.get("totalMsgCount"));

				return "message/popmain";
				}
		
				
			// 팝업창에서 메시지 삭제  > 글 삭제 처리
			@RequestMapping(value = "popDelete.bit", method = {RequestMethod.GET, RequestMethod.POST})
			public String popDelete(Message message, HttpServletRequest request, Model model) {
				logger.info("여기까지 들어오는건가??");				
				//String msg = null;
				//String url = null;
				String[] msindexArr =request.getParameterValues("msindexes");	
				System.out.println("arr"+ msindexArr.toString());
				
				int result =1;
				
				for(String msindex: msindexArr) {
					message.setMsindex(Integer.parseInt(msindex));
					result *= ms.deleteMessage(message);
				}
				
				
				if(result != 0) { // 만일 result중 하나라도 실패가 있으면 0이 됨
					
					logger.info("message 글 삭제 완료");
					//msg = "Qna 글 삭제 완료";
			        //url = "main.bit";
					return "redirect:/message/popRePage.bit";
				}else { 
					
					logger.info("message 글 삭제 실패");
					//msg = "Qna 글 삭제 실패";
			        //url = "javascript:history.back();";
					return "javascript:history.back()";
				}
				
				//model.addAttribute("msg", msg);
				//model.addAttribute("url", url);
				
				//return "redirect";	
				
			}


}
