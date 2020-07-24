package bit.or.eesotto.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import bit.or.eesotto.dto.User;
import bit.or.eesotto.service.MypageService;

@RestController
@RequestMapping("/mypage/")
public class MypageAjaxController {

	private static final Logger logger = LoggerFactory.getLogger(MypageAjaxController.class); 
	
	@Autowired		
	MypageService ms;
	
	// 마이페이지 > 수정 처리
	@RequestMapping(value = "edit.bit", method = RequestMethod.POST)
	public int editUser(User user, MultipartHttpServletRequest multiFile, HttpServletRequest request) {
		
		// 파일 업로드
		MultipartFile file = multiFile.getFile("file");
		if(file != null && file.getSize() > 0) { 
		    String filename = UUID.randomUUID().toString();
			String path = request.getServletContext().getRealPath("/assets/images");
			
			String fpath = path + "\\"+ filename; 
			System.out.println("fpath: "+fpath);
				
			if(!filename.equals("")) { //실 파일 업로드
				FileOutputStream fs;
				try {
					fs = new FileOutputStream(fpath);
					fs.write(file.getBytes());
					fs.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			user.setUimg(filename); //파일명을 별도 관리 (DB insert)
		}
		
		logger.info("회원정보 수정 완료");
		return ms.editUser(user);	
	}
	
	// 마이페이지 > 회원정보 수정 시 닉네임 중복 확인
	@RequestMapping(value = "nickCheck.bit", method = { RequestMethod.POST })
	public List<String> nickCheck(String nick) throws IOException {
		//String id = request.getParameter("nick");
		return ms.nickCheck(nick);
	}
}
