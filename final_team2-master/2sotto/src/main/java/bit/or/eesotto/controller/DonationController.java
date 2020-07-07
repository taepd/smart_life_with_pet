package bit.or.eesotto.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bit.or.eesotto.dao.DonateDao;
import bit.or.eesotto.dto.Donate;
import bit.or.eesotto.service.DonationService;





@Controller
@RequestMapping("/donation/")
public class DonationController {
	
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	@Autowired
	DonationService ds;
	
	

	/*
	 * // donation게시글 보러가기
	 * 
	 * @RequestMapping(value = "main.bit", method = RequestMethod.GET) public String
	 * donationMain() {
	 * 
	 * return "donation/main"; }
	 */

	/*
	 * // donation 상세보기보러가기
	 * 
	 * @RequestMapping(value = "qaView.bit", method = RequestMethod.GET) public
	 * String donationQaView() {
	 * 
	 * return "donation/qaView"; }
	 */

	// donation 글쓰러가기보러가기
	@RequestMapping(value = "donationWrite.bit", method = RequestMethod.GET)
	public String donationWrite() {

		return "donation/donationWrite";
	}
	
	//후원글 쓰기
	@RequestMapping(value = "donationWrite.bit", method = RequestMethod.POST) 
	public String donationWrite(Donate donate , HttpServletRequest request, Principal principal, Model model) throws IOException, ClassNotFoundException, SQLException {
		logger.info("글작성 ");
		
		
		
		//파일에 대한 처리부분
		List<CommonsMultipartFile> files = donate.getFiles();
		List<String> filenames = new ArrayList<String>();
		if(files != null && files.size() > 0) { //최소 1개의 업로드가 있다면 
			for(CommonsMultipartFile multifile : files) {
				String filename = multifile.getOriginalFilename();
				String path = request.getServletContext().getRealPath("/views/upload");
				
				String fpath = path + "\\"+ filename; 
				
				if(!filename.equals("")) { //실 파일 업로드
					FileOutputStream fs = new FileOutputStream(fpath);
					fs.write(multifile.getBytes());
					fs.close();
				}
				filenames.add(filename); //파일명을 별도 관리 (DB insert)
			}
			
		}
		
		
		/* donate.setWriter (principal.getName()); */
		
		//DB 파일명 저장
		donate.setDimg(filenames.get(0));
		logger.info("파일 업로드 완료 ");
		//int result = ds.donationWrite(donate, request, principal);
		
		int result = ds.donationWrite(donate, request, principal);// 이 result값이 service로, service에서 mapper(dao)로 가서 db하고 연동 된다고...
		if(result==1) {
			
			logger.info("정상적으로 입력 성공");
 
			return "donation/main";
			
		}else { //회원가입 실패시 어찌할지 로직구현해야 함
			
			logger.info("정상적으로 입력 실패");

			return "redirect:/";
		}
		/*
		 * if(result==1) { ("donate", donate.getTitle()); logger.info("글입력 처리 완료");
		 * 
		 * return "redirect:/";
		 * 
		 * }else { //회원가입 실패시 어찌할지 로직구현해야 함
		 * redirectAttributes.addFlashAttribute("failedLogin", "failed");
		 * logger.info("회원가입 실패");
		 * 
		 * return "redirect:/"; }
		 */
		
		/* return "donation/main"; */
			
	}
	
	//글 목록 보기
	@RequestMapping(value = "main.bit", method = RequestMethod.GET)
	public String getDonationList(String pg , String f , String q , Model model) throws ClassNotFoundException, SQLException{
		
		List<Donate> list = ds.getDonationList(pg, f, q);
		model.addAttribute("list", list);
		
		return "donation/main"; //"notice.jsp";
	}
	
	//글 상세보기
	@RequestMapping(value = "getDonationDetail.bit", method = RequestMethod.GET)
	public String getDonationDetail(String dindex , Model model) {
			
			Donate donate = ds.getDonationDetail(dindex);//ds 
			model.addAttribute("donate", donate);
			
			return "donation/donationDetail"; //"noticeDetail.jsp";
	}

}
