package bit.or.eesotto.controller;

import java.security.*;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.or.eesotto.dto.Message;
import bit.or.eesotto.service.MessageService;
@Controller
@RequestMapping("/message/")
public class MessageController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired
	MessageService ms;
	
	//쪽지 메인 보러가기
		@RequestMapping(value = "main.bit", method = RequestMethod.GET)
		public String mainView(String cp, String ps, Principal principal, Model model) {

			//String userid = (String) session.getAttribute("userid");
			String userid =  principal.getName();
			logger.info("로그인 유저 아이디: " + userid);
			
			HashMap<String, Object> map = ms.mainView(cp, ps, userid);
			
			// view까지 전달 (forward)
			model.addAttribute("cpage", map.get("cpage"));
			model.addAttribute("pageSize", map.get("pageSize"));
			model.addAttribute("messageList", map.get("messageList")); 		
			model.addAttribute("pageCount", map.get("pageCount"));
			model.addAttribute("totalMsgCount", map.get("totalMsgCount"));

			return "message/main";
		}
		// 쪽지>보낸사람 view
			@RequestMapping(value = "write.bit", method = RequestMethod.GET)
			public String write(String suserid) {

				// 쪽지 할예정

				return "message/write";
			}
		

			
			
		// 블로그>글쓰기 페이지 view
		@RequestMapping(value = "write.bit", method = RequestMethod.POST)
		public String write(Message message, Principal principal) {

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

				return "redirect:/message/main.bit";
				
			} else { // 회원가입 실패시 어찌할지 로직구현해야 함

				logger.info("쪽지 보내기 실패");

				return "redirect:/message/main.bit";
			}

		}
		
		//message보낸사람 보러가기
		@RequestMapping(value = "messagePage.bit", method = RequestMethod.GET)
		
		public String messagePage(String cp, String ps, Principal principal, Model model) {
	
			//String userid = (String) session.getAttribute("userid");
			String userid =  principal.getName();
			logger.info("로그인 유저 아이디: " + userid);
			
			HashMap<String, Object> map = ms.messagePageView(cp, ps, userid);
			
			// view까지 전달 (forward)
			model.addAttribute("cpage", map.get("cpage"));
			model.addAttribute("pageSize", map.get("pageSize"));
			model.addAttribute("messageList", map.get("messageList")); 		
			model.addAttribute("pageCount", map.get("pageCount"));
			model.addAttribute("totalMsgCount", map.get("totalMsgCount"));
	
			return "message/messagePage";
		}


}
