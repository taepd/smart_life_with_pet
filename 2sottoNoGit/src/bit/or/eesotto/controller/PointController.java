package bit.or.eesotto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/point/")
public class PointController {

	// point 보러가기
	@RequestMapping(value = "main.bit", method = RequestMethod.GET)
	public String pointMain() {

		return "point/main";
	}

	// pointDetail 보러가기
	@RequestMapping(value = "detail.bit", method = RequestMethod.GET)
	public String pointDetail() {

		return "point/detail";
	}

}
