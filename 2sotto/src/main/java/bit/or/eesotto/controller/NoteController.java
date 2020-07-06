package bit.or.eesotto.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
@Controller
@RequestMapping("/note/")
public class NoteController {
	//쪽지 보내러 가기 보러가기
		@RequestMapping(value = "main.bit", method = RequestMethod.GET)
		public String noteMain() {

			return "note/main";
		}
		//note 보러가기
		@RequestMapping(value = "notePage.bit", method = RequestMethod.GET)
		public String notePage() {

			return "note/notePage";
		}
		//note 내용보러가기
		@RequestMapping(value = "noteDetail.bit", method =  RequestMethod.GET)
		public String noteDetail() {

			return "note/noteDetail";
		}
}
