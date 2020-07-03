package bit.or.eesotto.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.or.eesotto.dto.User;
import bit.or.eesotto.service.LoginService;

@Controller
@RequestMapping("/blog/")
public class BlogController {

//	@Autowired
//	LoginService ls;

	// 블로그 메인 view
	@RequestMapping(value = "main.bit", method = RequestMethod.GET)
	public String mainView() {
		return "blog/main";
	}

	// 블로그>상세 페이지 view
	@RequestMapping(value = "detail.bit", method = RequestMethod.GET)
	public String detail() {
		return "blog/detail";
	}

	// 블로그>글쓰기 페이지 view
	@RequestMapping(value = "write.bit", method = RequestMethod.GET)
	public String write() {
		return "blog/write";
	}

	// 블로그>즐겨찾기 페이지 view
	@RequestMapping(value = "favorite.bit", method = RequestMethod.GET)
	public String favorite() {
		return "blog/favorite";
	}

}
