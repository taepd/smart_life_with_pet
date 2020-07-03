package bit.or.eesotto.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BlikeController {
	@RequestMapping(value = "blike.bit", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView blike(HttpSession session) throws IOException {


		/* 생성한 url 전달 */
		ModelAndView mav = new ModelAndView();
		mav.setViewName("blike");

		return mav;
	}


	
	


}
