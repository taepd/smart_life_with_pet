package bit.or.eesotto.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class donationController {

	//donation 보러가기
	@RequestMapping(value = "donationPage.bit", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView donationPage(HttpSession session) throws IOException {


		/* 생성한 url 전달 */
		ModelAndView mav = new ModelAndView();
		mav.setViewName("donation/donationPage");

		return mav;
	}
	//donation글쓰기 보러가기
	@RequestMapping(value = "donationWrite.bit", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView donationWrite(HttpSession session) throws IOException {


		/* 생성한 url 전달 */
		ModelAndView mav = new ModelAndView();
		mav.setViewName("donation/donationWrite");

		return mav;
	}
	//donation글상세 보러가기
	@RequestMapping(value = "donationQaView.bit", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView donationQaView(HttpSession session) throws IOException {


		/* 생성한 url 전달 */
		ModelAndView mav = new ModelAndView();
		mav.setViewName("donation/donationQaView");

		return mav;
	}

}
