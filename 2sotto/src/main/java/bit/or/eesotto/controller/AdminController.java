package bit.or.eesotto.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import bit.or.eesotto.dto.BlogComment;
import bit.or.eesotto.dto.Donate;
import bit.or.eesotto.dto.Pet;
import bit.or.eesotto.dto.Point;
import bit.or.eesotto.dto.User;

import bit.or.eesotto.service.BlogService;
import bit.or.eesotto.service.DonationService;
import bit.or.eesotto.service.PetService;
import bit.or.eesotto.service.PointService;
import bit.or.eesotto.service.UserService;
import bit.or.eesotto.utils.*;
import net.minidev.json.*;




@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	SqlSession sqlsession;
	@Autowired
	UserService us;
	
	@Autowired
	PetService ps;
	
	@Autowired
	PointService pointService;
	
	@Autowired
	DonationService donationService;
	
	JsonUtil jsonUtil;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class); 

	// human 보러가기
	@RequestMapping(value = "main.bit", method = RequestMethod.GET)
	public String adminMain() {

		return "admin/main";
	}
	// detail 보러가기
	@RequestMapping(value = "list.bit", method = RequestMethod.GET)
	public String adminlist() {

		return "admin/list";
	}

	
	
	// detail 보러가기
	@RequestMapping(value = "detail.bit", method = RequestMethod.GET)
	public String adminDetail() {

		return "admin/detail";
	}

	// 대시보드 보러가기
	@RequestMapping(value = "adminMain.bit", method = RequestMethod.GET)
	public String adminViewMain(Model model) {
		
		//동물 종류에 따른 비율 차트 
		List<Map<String, Object>> list = ps.getPetKindCount();
		JSONArray jsonArray = JsonUtil.getJsonArrayFromList(list);
		
		//회원가입 추세 차트
		List<Map<String, Object>> list2 = us.signUpCountbyDay();
		JSONArray jsonArray2 = JsonUtil.getJsonArrayFromList(list2);
		System.out.println("json: "+ jsonArray2);
		
		//회원가입 추세 차트
		List<Map<String, Object>> list3 = pointService.pCountByDay();
		JSONArray jsonArray3 = JsonUtil.getJsonArrayFromList(list3);
		System.out.println("json: "+ jsonArray3);
		
		
		
		model.addAttribute("getPetKindCount", jsonArray);
		model.addAttribute("signUpCountbyDay", jsonArray2);
		model.addAttribute("pCountByDay", jsonArray3);
		

		return "admin/adminMain";
	}
	
	
	// 유저리스트 Table 보러가기
	@RequestMapping(value = "userTable.bit", method = RequestMethod.GET)
	public String userTable() {

		return "admin/adminUserTable";
	}
	
	
	// 동물리스트 Table 보러가기
	@RequestMapping(value = "userPetTable.bit", method = RequestMethod.GET)
	public String userPetTable() {

		return "admin/adminPetTable";
	}
	
	// 포인트 내역 Table 보러가기
	@RequestMapping(value = "userPointTable.bit", method = RequestMethod.GET)
	public String userPointTable() {

		return "admin/adminPointTable";
	}
	
	// DonationTable 보러가기
	@RequestMapping(value = "userDonationTable.bit", method = RequestMethod.GET)
	public String userDonationTable() {

		return "admin/adminDonationTable";
	}
	
	// 유저리스트 조회 Ajax  
	@ResponseBody
	@RequestMapping(value = "getUserList.bit", method = { RequestMethod.GET, RequestMethod.POST })
	public List<User> getUserList(User user, Principal principal, Model model) throws IOException {
		
		String userid = principal.getName();
		logger.info("로그인 유저 아이디: " + userid);
		logger.info("로그인 유저 아이디: " + userid);
		List<User> userList = us.getUserList(userid);
		logger.info("너는?: " + userid);
		logger.info("그리고 넌는?: " + userList);
		if(userList!=null) {
			logger.info("유저 "+userid+"유저 조회 완료");
		}else {
			logger.info("유저 "+userid+"유저 조회 실패");
		}
		
		return userList;
	}
	
	// 유저가입 조회 Ajax  
	@ResponseBody
	@RequestMapping(value = "userCount.bit", method = { RequestMethod.GET, RequestMethod.POST })
	public String getUserCount(User user, Principal principal, Model model) throws IOException {
		
		String userid = principal.getName();
		logger.info("로그인 유저 아이디: " + userid);
		
		int result = us.getUserCount(user);
		logger.info("너는?: " + result);
		logger.info("그리고 넌는?: " + result);
		
		if(result==1) {
			logger.info("유저 "+result+"유저 조회 완료");
		}else {
			logger.info("유저 "+result+"유저 조회 실패");
		}
		
		return null;
	}
	
	
	
	// 반려동물리스트 조회 Ajax  
	@ResponseBody
	@RequestMapping(value = "getPetList.bit", method = { RequestMethod.GET, RequestMethod.POST })
	public List<Pet> getPetList(Pet pet, Principal principal, Model model) throws IOException {
		
		String userid = principal.getName();
		logger.info("로그인 유저 아이디: " + userid);
	
		List<Pet> petList = ps.getPetList(userid);
		logger.info("너는?: " + userid);
		logger.info("그리고 넌는?: " + petList);
		if(petList!=null) {
			logger.info("동물 "+userid+"동물 조회 완료");
		}else {
			logger.info("동물 "+userid+"동물 조회 실패");
		}
		
		return petList;
	}
	
	
	// KKH가 작업함 -> 포인트 리스트 조회
	// 포인트리스트 조회 Ajax  
		@ResponseBody
		@RequestMapping(value = "getPointList.bit", method = { RequestMethod.GET, RequestMethod.POST })
		public List<Point> getPointList(Point point, Principal principal, Model model) throws IOException {
			
			String userid = principal.getName();
			logger.info("로그인 유저 아이디: " + userid);
			
			
			List<Point> pointList = pointService.getPointList();
			logger.info("너는?: " + userid);
			logger.info("그리고 넌는?: " + pointList);
			if(pointList!=null) {
				logger.info("포인트 "+userid+"유저 조회 완료");
			}else {
				logger.info("포인트 "+userid+"유저 조회 실패");
			}
			
			return pointList;
		}
		
		// 후원리스트 조회 Ajax  
		@ResponseBody
		@RequestMapping(value = "getDonationList.bit", method = { RequestMethod.GET, RequestMethod.POST })
		public List<Donate> getDonationList(Donate donate, Principal principal, Model model) throws IOException {
			
			String userid = principal.getName();
			logger.info("로그인 유저 아이디: " + userid);
			
			
			List<Donate> donationList = donationService.getDonationList();
			logger.info("너는?: " + userid);
			logger.info("그리고 넌는?: " + donationList);
			if(donationList!=null) {
				logger.info("포인트 "+userid+"유저 조회 완료");
			}else {
				logger.info("포인트 "+userid+"유저 조회 실패");
			}
			
			return donationList;
		}

		// donation 글쓰러가기보러가기
		@RequestMapping(value = "adminDonationwrite.bit", method = RequestMethod.GET)
		public String write() {

			return "admin/adminDonationwrite";
		}
		
		
		
		// 후원글 쓰기
		@RequestMapping(value = "adminDonationwrite.bit", method = RequestMethod.POST)
		public String write(Donate donate, HttpServletRequest request, Principal principal, Model model)
				throws IOException, ClassNotFoundException, SQLException {
			logger.info("글작성 ");

			// 파일에 대한 처리부분
			List<CommonsMultipartFile> files = donate.getFiles();
			List<String> filenames = new ArrayList<String>();
			if (files != null && files.size() > 0) { // 최소 1개의 업로드가 있다면
				for (CommonsMultipartFile multifile : files) {
					String filename = multifile.getOriginalFilename();
					String path = request.getServletContext().getRealPath("/views/upload");

					String fpath = path + "\\" + filename;

					if (!filename.equals("")) { // 실 파일 업로드
						FileOutputStream fs = new FileOutputStream(fpath);
						fs.write(multifile.getBytes());
						fs.close();
					}
					filenames.add(filename); // 파일명을 별도 관리 (DB insert)
				}

			}

			/* donate.setWriter (principal.getName()); */

			// DB 파일명 저장

			if (!filenames.isEmpty()) {
				donate.setDimg(filenames.get(0));

			}

			logger.info("파일 업로드 완료 ");
			// int result = ds.donationWrite(donate, request, principal);

			int result = donationService.write(donate, request, principal);// 이 result값이 service로, service에서 mapper(dao)로 가서 db하고 연동
																// 된다고...
			if (result == 1) {

				logger.info("정상적으로 입력 성공");

				return "redirect:userDonationTable.bit";

			} else { // 회원가입 실패시 어찌할지 로직구현해야 함

				logger.info("정상적으로 입력 실패");

				return "redirect:adminDonationwrite.bit";
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
		
		
		// 글 상세보기
		@RequestMapping(value = "adminDonationdetail.bit", method = RequestMethod.GET)
		public String detail(String dindex, Model model) {

			Donate donate = donationService.detail(dindex);// ds
			model.addAttribute("donate", donate);

			return "admin/adminDonationdetail"; // "noticeDetail.jsp";
		}

		// 글 수정 view
		@RequestMapping(value = "adminDonationupdate.bit", method = RequestMethod.GET)
		public String update(String dindex, Model model) {

			Donate donate = donationService.detail(dindex);
			logger.info("내 블로그 글 조회 완료");
			model.addAttribute("donate", donate);

			return "admin/adminDonationupdate";
		}

		// 글 수정 처리
		@RequestMapping(value = "adminDonationupdate.bit", method = RequestMethod.POST)
		public String update(Donate donate, HttpServletRequest request, Model model)
				throws IOException, ClassNotFoundException, SQLException {
			String msg = null;
			String url = null;

			List<CommonsMultipartFile> files = donate.getFiles();
			List<String> filenames = new ArrayList<String>(); // 파일명관리

			if (files != null && files.size() > 0) { // 최소 1개의 업로드가 있다면
				for (CommonsMultipartFile multifile : files) {
					String filename = multifile.getOriginalFilename();
					String path = request.getServletContext().getRealPath("/customer/upload");

					String fpath = path + "\\" + filename;

					if (!filename.equals("")) { // 실 파일 업로드
						FileOutputStream fs = new FileOutputStream(fpath);
						fs.write(multifile.getBytes());
						fs.close();
					}
					filenames.add(filename); // 파일명을 별도 관리 (DB insert)
				}

			}

			// DB 파일명 저장
			if (!filenames.isEmpty()) {
				donate.setDimg(filenames.get(0));

			}

			logger.info("파일 수정 완료 ");
			// int result = ds.donationWrite(donate, request, principal);

			int result = donationService.update(donate);// 이 result값이 service로, service에서 mapper(dao)로 가서 db하고 연동 된다고...
			if (result == 1) {
				logger.info("result입력 성공 :  " + result);
				msg = "후원글 수정 완료";
				url = "adminDonationdetail.bit?dindex=" + donate.getDindex();

			} else {

				return "javascript:history.back();";

			}
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "redirect";
		}

		// 글 삭제 처리
		@RequestMapping(value = "adminDonationdelete.bit", method = { RequestMethod.GET, RequestMethod.POST })
		public String delete(Donate donate) throws ClassNotFoundException, SQLException {

			int result = donationService.delete(donate);

			if (result == 1) {

				return "redirect:userDonationTable.bit";

			} else {

				return "javascript:history.back();";
			}
		}
		
}
