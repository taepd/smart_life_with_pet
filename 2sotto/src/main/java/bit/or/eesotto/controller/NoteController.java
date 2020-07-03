package bit.or.eesotto.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class NoteController {
	//쪽지 보내러 가기 보러가기
		@RequestMapping(value = "noteWrite.bit", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView noteWrite(HttpSession session) throws IOException {


			/* 생성한 url 전달 */
			ModelAndView mav = new ModelAndView();
			mav.setViewName("note/noteWrite");

			return mav;
		}
		//note 보러가기
		@RequestMapping(value = "notePage.bit", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView notePage(HttpSession session) throws IOException {


			/* 생성한 url 전달 */
			ModelAndView mav = new ModelAndView();
			mav.setViewName("note/notePage");

			return mav;
		}
		//note 내용보러가기
		@RequestMapping(value = "noteDetail.bit", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView noteDetail(HttpSession session) throws IOException {


			/* 생성한 url 전달 */
			ModelAndView mav = new ModelAndView();
			mav.setViewName("note/noteDetail");

			return mav;
		}
}
