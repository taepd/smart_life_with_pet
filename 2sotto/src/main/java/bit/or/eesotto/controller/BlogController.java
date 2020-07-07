package bit.or.eesotto.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.or.eesotto.dto.Post;
import bit.or.eesotto.dto.User;
import bit.or.eesotto.service.BlogService;
import bit.or.eesotto.service.JoinService;
import bit.or.eesotto.service.LoginService;

@Controller
@RequestMapping("/blog/")
public class BlogController {
	
	private static final Logger logger = LoggerFactory.getLogger(BlogController.class);
	
	@Autowired
	BlogService bs;

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
	
	// 블로그>글쓰기 페이지 view
	@RequestMapping(value = "write.bit", method = RequestMethod.POST)
	public String write(Post post, HttpSession session) {
		
		String userid = (String)session.getAttribute("userid");
		logger.info("로그인 유저 아이디: "+userid);

		// 나중에 파일 업로드 구현		
//		List<CommonsMultipartFile> files = donate.getFiles();
//		List<String> filenames = new ArrayList<String>();
//		if(files != null && files.size() > 0) { //최소 1개의 업로드가 있다면 
//			for(CommonsMultipartFile multifile : files) {
//				String filename = multifile.getOriginalFilename();
//				String path = request.getServletContext().getRealPath("/views/upload");
//				
//				String fpath = path + "\\"+ filename; 
//				
//				if(!filename.equals("")) { //실 파일 업로드
//					FileOutputStream fs = new FileOutputStream(fpath);
//					fs.write(multifile.getBytes());
//					fs.close();
//				}
//				filenames.add(filename); //파일명을 별도 관리 (DB insert)
//			}
//		}
		
		
		/* donate.setWriter (principal.getName()); */
		
		//DB 파일명 저장
//		donate.setDimg(filenames.get(0));
//		logger.info("파일 업로드 완료 ");
		//int result = donationservice.donationWrite(donate, request, principal);
		
		//세션 userid post객체에 입력
		post.setUserid(userid);
		
		//임시 petindex 입력
		post.setPetindex(1);
		
		int result = bs.writePost(post);
		if(result==1) {
			
			logger.info("블로그 글 입력 성공");
 
			return "blog/main";
			
		}else { //회원가입 실패시 어찌할지 로직구현해야 함
			
			logger.info("블로그 글 입력 실패");

			return "blog/main";
		}
		
	}

	// 블로그>즐겨찾기 페이지 view
	@RequestMapping(value = "favorite.bit", method = RequestMethod.GET)
	public String favorite() {
		return "blog/favorite";
	}

}
