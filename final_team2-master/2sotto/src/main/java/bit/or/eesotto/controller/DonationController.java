package bit.or.eesotto.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/donation/")
public class DonationController {

	// donation 보러가기
	@RequestMapping(value = "main.bit", method = RequestMethod.GET)
	public String donationMain() {

		return "donation/main";
	}

	// donation 상세보기보러가기
	@RequestMapping(value = "qaView.bit", method = RequestMethod.GET)
	public String donationQaView() {

		return "donation/qaView";
	}

	// donation 글쓰러가기보러가기
	@RequestMapping(value = "donationWrite.bit", method = RequestMethod.GET)
	public String donationWrite() {

		return "donation/donationWrite";
	}


}
