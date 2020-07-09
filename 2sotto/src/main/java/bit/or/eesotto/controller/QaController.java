package bit.or.eesotto.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import bit.or.eesotto.dto.Qna;

import bit.or.eesotto.service.QnaService;


@Controller
@RequestMapping("/qa/")
public class QaController {

	private static final Logger logger = LoggerFactory.getLogger(QaController.class);
	
	@Autowired
	QnaService qa;
	
	
	// Qa 보러가기
	@RequestMapping(value = "main.bit", method = RequestMethod.GET)
	public String mainView(String cp, String ps, HttpSession session, Model model) {
		
		String userid = (String) session.getAttribute("userid");
		logger.info("로그인 유저 아이디: " + userid);
		
		HashMap<String, Object> map = qa.mainView(cp, ps, userid);
		
		// view까지 전달 (forward)
		model.addAttribute("cpage", map.get("cpage"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("qnaList", map.get("qnaList")); 		
		model.addAttribute("pageCount", map.get("pageCount"));
		model.addAttribute("totalMsgcount", map.get("totalMsgcount"));
		
		return "qa/main";
	}


	// view 보러가기
	@RequestMapping(value = "view.bit", method = RequestMethod.GET)
	public String qnaview(String cp, String ps, HttpSession session, Model model) {

		String userid = (String) session.getAttribute("userid");
		logger.info("로그인 유저 아이디: " + userid);
		
		HashMap<String, Object> map = qa.mainView(cp, ps, userid);
		
		// view까지 전달 (forward)
		model.addAttribute("cpage", map.get("cpage"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("qnaList", map.get("qnaList")); 		
		model.addAttribute("pageCount", map.get("pageCount"));
		model.addAttribute("totalMsgcount", map.get("totalMsgcount"));
		
		
		
		
		return "qa/view";
	}

	// write보러가기
	@RequestMapping(value = "write.bit", method = RequestMethod.GET)
	public String qaWrite(String userid) {
	
		return "qa/write";
	}

	// 블로그>글쓰기 페이지 view
			@RequestMapping(value = "write.bit", method = RequestMethod.POST)
			public String write(Qna qna, HttpSession session) {

				String userid = (String) session.getAttribute("userid");
				logger.info("로그인 유저 아이디: " + userid);
			
				// 세션 userid post객체에 입력
				qna.setUserid(userid);

				// 임시 petindex 입력
				//message.setMsindex(1);

				int result = qa.writeQna(qna);
				if (result == 1) {
					
					logger.info("쪽지 보내기 성공");

					return "redirect:/qa/main.bit";
					
				} else { // 회원가입 실패시 어찌할지 로직구현해야 함

					logger.info("쪽지 보내기 실패");

					return "redirect:/qa/main.bit";
				}
	

			}
}
