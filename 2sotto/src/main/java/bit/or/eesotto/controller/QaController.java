package bit.or.eesotto.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/qa/")
public class QaController {

	// admin 보러가기
	@RequestMapping(value = "main.bit", method = RequestMethod.GET)
	public String qaMain() {

		return "qa/main";
	}


	// view 보러가기
	@RequestMapping(value = "view.bit", method = RequestMethod.GET)
	public String qaview() {

		return "qa/view";
	}

	// write보러가기
	@RequestMapping(value = "write.bit", method = RequestMethod.GET)
	public String qaWrite() {

		return "qa/write";
	}

	

}
