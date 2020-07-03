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



	
	// 회원가입 view
	@RequestMapping(value = "blike.bit", method = { RequestMethod.GET, RequestMethod.POST })
	public String blike(HttpSession session, Model model)throws IOException {
	
	return "blike";
}

}
