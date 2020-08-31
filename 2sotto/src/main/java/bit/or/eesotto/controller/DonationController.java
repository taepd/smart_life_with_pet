package bit.or.eesotto.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bit.or.eesotto.dao.DonationDao;
import bit.or.eesotto.dao.UserDao;
import bit.or.eesotto.dto.*;
import bit.or.eesotto.service.*;

@Controller
@RequestMapping("/donation/")
public class DonationController {

	private static final Logger logger = LoggerFactory.getLogger(DonationController.class);

	@Autowired
	DonationService ds;

	@Autowired
	PayService payservice;
	
	@Autowired
	LoginService ls;

	@Autowired
	SqlSession sqlsession;

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
	@RequestMapping(value = "write.bit", method = RequestMethod.GET)
	public String write() {

		return "donation/write";
	}

	// 후원글 쓰기
	@RequestMapping(value = "write.bit", method = RequestMethod.POST)
	public String write(Donation donate, HttpServletRequest request, Principal principal, Model model)
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

		int result = ds.write(donate, request, principal);// 이 result값이 service로, service에서 mapper(dao)로 가서 db하고 연동
															// 된다고...
		if (result == 1) {

			logger.info("정상적으로 입력 성공");

			return "redirect:main.bit";

		} else { // 회원가입 실패시 어찌할지 로직구현해야 함

			logger.info("정상적으로 입력 실패");

			return "redirect:write.bit";
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

	/*
	 * //글 목록 보기
	 * 
	 * @RequestMapping("main.bit") public String getDonationList(String pg , String
	 * f , String q , Model model) throws ClassNotFoundException, SQLException{
	 * 
	 * 
	 * List<Donate> list = ds.getDonationList(pg, f, q); model.addAttribute("list",
	 * list);
	 * 
	 * 
	 * return "donation/main"; //"notice.jsp"; }
	 */

	// 후원글메인 view
	@RequestMapping(value = "main.bit", method = RequestMethod.GET)
	public String main(String cp, String ps, Model model) {

		HashMap<String, Object> map = ds.main(cp, ps);
		logger.info("후원글 조회 완료");

		// view까지 전달 (forward)
		model.addAttribute("cpage", map.get("cpage"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("donationList", map.get("donationList"));
		model.addAttribute("pageCount", map.get("pageCount"));
		model.addAttribute("totaldonatecount", map.get("totaldonatecount"));
		System.out.println("//////이거 나옵니까//////: "+ map.get("cpage"));
		return "donation/main";

	}

	// 후원글메인 view 최신순으로 > Ajax 수정 필요
	@RequestMapping(value = "mainbydate.bit", method = RequestMethod.GET)
	public String mainbydate(String cp, String ps, HttpSession session, Model model) {

		/* logger.info("로그인 유저 아이디: " + userid); */

		HashMap<String, Object> map = ds.mainbydate(cp, ps);
		/* logger.info("내 블로그 글 조회 완료"); */

		// view까지 전달 (forward)
		model.addAttribute("cpage", map.get("cpage"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("donateList", map.get("donateList"));
		model.addAttribute("pageCount", map.get("pageCount"));
		model.addAttribute("totaldonatecount", map.get("totaldonatecount"));

		return "donation/mainbydate";
	}

	// 글 상세보기
	@RequestMapping(value = "detail.bit", method = RequestMethod.GET)
	public String detail(String dindex, Model model) {

		Donation donate = ds.detail(dindex);// ds
		model.addAttribute("donate", donate);

		return "donation/detail"; // "noticeDetail.jsp";
	}

	// 글 수정 view
	@RequestMapping(value = "update.bit", method = RequestMethod.GET)
	public String update(String dindex, Model model) {

		Donation donate = ds.detail(dindex);
		logger.info("내 블로그 글 조회 완료");
		model.addAttribute("donate", donate);

		return "donation/update";
	}

	// 글 수정 처리
	@RequestMapping(value = "update.bit", method = RequestMethod.POST)
	public String update(Donation donate, HttpServletRequest request, Model model)
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

		int result = ds.update(donate);// 이 result값이 service로, service에서 mapper(dao)로 가서 db하고 연동 된다고...
		if (result == 1) {
			logger.info("result입력 성공 :  " + result);
			msg = "후원글 수정 완료";
			url = "detail.bit?dindex=" + donate.getDindex();

		} else {

			return "javascript:history.back();";

		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "redirect";
	}

	// 글 삭제 처리
	@RequestMapping(value = "delete.bit", method = { RequestMethod.GET, RequestMethod.POST })
	public String delete(Donation donate) throws ClassNotFoundException, SQLException {

		int result = ds.delete(donate);

		if (result == 1) {

			return "redirect:main.bit";

		} else {

			return "javascript:history.back();";
		}
	}
	
	//유저 포인트 차감 및 현재 모금 포인트 증가 + 기부테이블에 입력
	@RequestMapping(value = "donatePoint.bit", method = RequestMethod.POST)
	public String donatePoint(Donation donate, HttpSession session, HttpServletRequest request, Principal principal, Model model) {

		String dUserid = principal.getName();
		logger.info("기부 유저 아이디: " + dUserid);

		int dpoint = Integer.parseInt(request.getParameter("dpoint"));
		logger.info("입력 기부 포인트: " + dpoint);
		
		String msg = null;
		String url = null;
		logger.info("dindex: " + donate.getDindex());

		User user = (User) session.getAttribute("user");
		logger.info("유저포인트 가져오는지 확인" + user.getUserPoint());

		
		
		int result = 0;
		int result2 = 0;
		
		
		int ccoll = Integer.parseInt(request.getParameter("ccoll"));
		int gcoll = Integer.parseInt(request.getParameter("gcoll"));

		
		//모금목표액보다 초과하거나 같을 경우의 처리.
		if ((ccoll + dpoint) > gcoll) {
			
			logger.info("ccoll값 줭" + ccoll);
			logger.info("gcoll값 줭" + gcoll);			
			msg = "목표모금액을 초과합니다." + (donate.getGcoll() - donate.getCcoll()) + "보다 작거나 같은 포인트롤 기부해 주세요";
			url = "detail.bit?dindex=" + donate.getDindex();
		
		}else if((ccoll + dpoint) == gcoll) {
			
			result = ds.donatePoint(donate, dpoint, dUserid);		
			result2  =  ds.completeDonationByColl(String.valueOf(donate.getDindex()));
						
			user.setUserPoint(user.getUserPoint() - dpoint);
			session.setAttribute("user", user);
			msg = "포인트 기부 완료";
			url = "detail.bit?dindex=" + donate.getDindex();
		
		// 목표모금액 보다 적을 경우 처리
		}else {
			if (user.getUserPoint() < dpoint) {
				logger.info("User 포인트 부족");
				msg = "보유 포인트가 부족합니다.";
				url = "detail.bit?dindex=" + donate.getDindex();
			} else {
				result = ds.donatePoint(donate, dpoint, dUserid);
				
			}

			if (result == 1) {
				// transaction 성공시 session에 point값 반영(navi '내정보'갱신을 위함)

				user.setUserPoint(user.getUserPoint() - dpoint);
				session.setAttribute("user", user);
				logger.info("포인트 기부 완료");
				msg = "포인트 기부 완료";
				url = "detail.bit?dindex=" + donate.getDindex();

			} else {

				logger.info("보유 포인트가 부족합니다");
				msg = "보유 포인트가 부족합니다";
				url = "javascript:history.back();";

			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "redirect";
		// 포인트 부족시 빠꾸
		// else문을 넣어줘야 햄
		/*
		 * if (user.getPoint() < dpoint) { logger.info("User 포인트 부족"); msg =
		 * "보유 포인트가 부족합니다."; url = "detail.bit?dindex=" + donate.getDindex(); } else {
		 * result = ds.donatePoint(donate, dpoint, dUserid); }
		 * 
		 * if (result == 1) { // transaction 성공시 session에 point값 반영(navi '내정보'갱신을 위함)
		 * 
		 * user.setPoint(user.getPoint() - dpoint); session.setAttribute("user", user);
		 * logger.info("포인트 기부 완료"); msg = "포인트 기부 완료"; url = "detail.bit?dindex=" +
		 * donate.getDindex();
		 * 
		 * } else {
		 * 
		 * logger.info("포인트 기부 실패"); msg = "포인트 기부 실패"; url =
		 * "javascript:history.back();";
		 * 
		 * }
		 */
		
	}
	
	
	
	
	// 유저 포인트 차감 및 현재 모금 포인트 증가
	/*
	  @RequestMapping(value = "donatePoint.bit", method = RequestMethod.POST)
	  public String donatePoint(Donate donate, HttpSession session,
	  HttpServletRequest request, Principal principal, Model model) {
	  
	  String dUserid = principal.getName(); logger.info("기부 유저 아이디: " + dUserid);
	  
	  int dpoint = Integer.parseInt(request.getParameter("dpoint"));
	  logger.info("입력 기부 포인트: " + dpoint);
	  
	  
	  
	  String msg = null; String url = null; logger.info("dindex: " +
	  donate.getDindex());
	  
	  User user = (User) session.getAttribute("user"); logger.info("유저포인트 가져오는지 확인"
	  + user.getUserPoint());
	  
	  int result = 0; int result2 = 0; int ccoll =
	  Integer.parseInt(request.getParameter("ccoll")); int gcoll =
	  Integer.parseInt(request.getParameter("gcoll"));
	  
	  
	  //모금목표액보다 초과하거나 같을 경우의 처리. if ((ccoll + dpoint) > gcoll) {
	  
	  logger.info("ccoll값 줭" + ccoll); logger.info("gcoll값 줭" + gcoll); msg =
	  "목표모금액을 초과합니다." + (donate.getGcoll() - donate.getCcoll()) +
	  "보다 작거나 같은 포인트롤 기부해 주세요"; url = "detail.bit?dindex=" + donate.getDindex();
	  
	  }else if((ccoll + dpoint) == gcoll) {
	  
	  result = ds.donatePoint(donate, dpoint, dUserid); result2 =
	  ds.completeDonationByColl(String.valueOf(donate.getDindex()));
	  logger.info("됐냐 이거?" + result); user.setUserPoint(user.getUserPoint() -
	  dpoint); session.setAttribute("user", user); msg = "포인트 기부 완료"; url =
	  "detail.bit?dindex=" + donate.getDindex();
	  
	  // 목표모금액 보다 적을 경우 처리 }else { if (user.getUserPoint() < dpoint) {
	  logger.info("User 포인트 부족"); msg = "보유 포인트가 부족합니다."; url =
	  "detail.bit?dindex=" + donate.getDindex(); } else { result =
	  ds.donatePoint(donate, dpoint, dUserid);
	  
	  }
	  
	  if (result == 1) { // transaction 성공시 session에 point값 반영(navi '내정보'갱신을 위함)
	  
	  user.setUserPoint(user.getUserPoint() - dpoint); session.setAttribute("user",
	  user); logger.info("포인트 기부 완료"); msg = "포인트 기부 완료"; url =
	  "detail.bit?dindex=" + donate.getDindex();
	  
	  } else {
	  
	  logger.info("보유 포인트가 부족합니다"); msg = "보유 포인트가 부족합니다"; url =
	  "javascript:history.back();";
	  
	  } }
	  
	  model.addAttribute("msg", msg); model.addAttribute("url", url);
	  
	  return "redirect"; // 포인트 부족시 빠꾸 // else문을 넣어줘야 햄
	  
	  if (user.getPoint() < dpoint) { logger.info("User 포인트 부족"); msg =
	  "보유 포인트가 부족합니다."; url = "detail.bit?dindex=" + donate.getDindex(); } else {
	  result = ds.donatePoint(donate, dpoint, dUserid); }
	  
	  if (result == 1) { // transaction 성공시 session에 point값 반영(navi '내정보'갱신을 위함)
	  
	  user.setPoint(user.getPoint() - dpoint); session.setAttribute("user", user);
	  logger.info("포인트 기부 완료"); msg = "포인트 기부 완료"; url = "detail.bit?dindex=" +
	  donate.getDindex();
	  
	  } else {
	  
	  logger.info("포인트 기부 실패"); msg = "포인트 기부 실패"; url =
	  "javascript:history.back();";
	  
	  }
	  
	  
	  
	  
	  }
	 */
	
	
	// 결제 포인트 pay 테이블에 입력 처리
	@RequestMapping(value = "payInput.bit", method = RequestMethod.GET)
	public String payInput(HttpSession session, Principal principal, HttpServletRequest request, Model model) {
		Pay pay = new Pay();
		String pamount = request.getParameter("point");
		logger.info("포인트 값을 가지고 오니?" + pamount);
		String userid = principal.getName();
		logger.info("ID를 가지고 오니?" + userid);
		int result = 0;

		pay.setPamount(Integer.parseInt(pamount));
		pay.getPamount();
		logger.info("pamount가 pay에 들어가니?" + pay.getPamount());
		pay.setUserid(userid);
		pay.getUserid();
		logger.info("가 pay에 들어가니?" + pay.getUserid());
		

		result = payservice.payInput(pay);
		logger.info("됐냐 이거?" + result);
		
		int userPoint = ls.normalLogin(userid).getUserPoint();
		logger.info("트리거 값을 가져왔는가" + userPoint);
		
		
		User user = (User)session.getAttribute("user");
		user.setUserPoint(userPoint);
		session.setAttribute("user", user);
		
		if (result == 1) {
			//성공해서 db에서 온 데이터를 입력해주는 곳이다. -> 경로로 가기전에 여기서 session에 반영한다.		
			
			//User user = (User)session.getAttribute("user");
			//성공해서 db에서 온 데이터를 입력해주는 곳이다. -> 경로로 가기전에 여기서 session에 반영한다.	 끝		
					
			
			
			return "redirect:/mypage/main.bit";

		} else {

			return "javascript:history.back();";
		}
	}

	// 결제 포인트 user point에 입력 처리
	/*
	 * @RequestMapping(value = "payInput.bit", method = RequestMethod.GET) public
	 * String payInput(User user, HttpSession session, Principal principal,
	 * HttpServletRequest request, Model model) {
	 * logger.info("payInput컨트롤러를 타기는 하는데...: "); logger.info("포인트 값  확인" +
	 * user.getPoint()); int point = user.getPoint();// session에서 user객체 정보를 가져오기 전에
	 * 기존의 point정보를 미리 저장해 놓는 것이 필요함!!! String userid = principal.getName();//단순히 현재
	 * session의 userid이름을 받아주는 String 변수
	 * 
	 * System.out.println("가져온 포인트: " + point);
	 * 
	 * //Handler에서 작업한 Session에서 가져온 user정보 -> 여기를 기점으로 point 정보 바뀌니까 참고 user =
	 * (User)session.getAttribute("user");//-> Handler에서 session에 넣어둔 user객체 값을 이용하는
	 * 것. 그래서 set이 아니라 get이다.
	 * 
	 * System.out.println("기존 포인트: " + user.getPoint()); user.setPoint(point +
	 * user.getPoint()); logger.info("총 포인트 값: "+ user.getPoint());//더해진 총 포인트 //int
	 * point = Integer.parseInt(request.getParameter("point"));//아... 이렇게 하면 기존 거
	 * 하고...
	 * 
	 * int result = payservice.payInput(user); if (result >= 1) {
	 * logger.info("포인트 사용 내역 입력 성공"); return "redirect:/mypage/main.bit";
	 * 
	 * } else { // 회원가입 실패시 어찌할지 로직구현해야 함 logger.info("포인트 사용 내역 입력 실패"); return
	 * "javascript:history.back();";
	 * 
	 * }
	 * 
	 * }
	 */

	/*
	 * @RequestMapping(value="completeDonationByColl.bit",
	 * method=RequestMethod.POST) public String completeDonationByColl(String
	 * dindex, HttpRequest request, int ccoll) { String msg = null; String url =
	 * null;
	 * 
	 * //DonateDao donatedao; //donatedao = sqlsession.getMapper(DonateDao.class);
	 * 
	 * int result = donatedao.completeDonationByColl(Integer.parseInt(dindex)); int
	 * result = ds.completeDonationByColl(dindex, ccoll);
	 * 
	 * 
	 * if(result==1) {
	 * 
	 * logger.info("포인트 기부 완료"); msg = "포인트 기부 완료"; url = "main.bit?";
	 * 
	 * }else {
	 * 
	 * logger.info("포인트 기부 실패"); msg = "포인트 기부 실패"; url =
	 * "javascript:history.back();";
	 * 
	 * }
	 * 
	 * 
	 * return null; }
	 */

	// ajax 페이징 컨트롤러
	// 페이징 ajax 처리
	@ResponseBody
	@RequestMapping("donationListAjax.bit")
	public Map<String, Object> donationListAjax(HttpServletRequest request) {

		String ps = request.getParameter("ps"); // pagesize
		String cp = request.getParameter("cp"); // current page

		// List 페이지 처음 호출 ...
		if (ps == null || ps.trim().equals("")) {
			// default 값 설정
			ps = "5"; // 5개씩
		}

		if (cp == null || cp.trim().equals("")) {
			// default 값 설정
			cp = "1"; // 1번째 페이지 보겠다
		}
		System.out.println(ps);
		System.out.println(cp);
		int pagesize = Integer.parseInt(ps);
		int cpage = Integer.parseInt(cp);
		int pagecount = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		List<Donation> donationList = null;
		try {
			DonationDao dao = sqlsession.getMapper(DonationDao.class);
			donationList = dao.main(cpage, pagesize);
			// request.setAttribute("emplist", emplist);

			int totaldonationcount = dao.getDonationCount();
			System.out.println(totaldonationcount);

			if (totaldonationcount % pagesize == 0) {
				pagecount = totaldonationcount / pagesize;

			} else {
				pagecount = (totaldonationcount / pagesize) + 1;
			}

			map.put("donationList", donationList);
			map.put("cpage", cpage);
			map.put("totaldonationcount", totaldonationcount);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return map;

	}

	// 후원글 댓글 ajax 기능 controller 구문
	// 후원글 댓글 입력 Ajax 처리
	@ResponseBody
	@RequestMapping(value = "writeComment.bit", method = { RequestMethod.POST })
	public int writeComment(DonationComment donationComment, HttpServletRequest request, Model model)
			throws IOException {
		logger.info("댓글입력 컨트롤러를 타기는 하는데.. ");
		// 비밀글 체크 여부
		if (donationComment.getScstate() == null) {

			donationComment.setScstate("N");
		}

		int result = ds.writeCommnet(donationComment);
		logger.info("writeCommnet 메서드 " + result);

		if (result == 1) {
			logger.info("후원글 " + donationComment.getDindex() + "번글 댓글 입력 처리 완료");
		} else {
			logger.info("후원글 " + donationComment.getDindex() + "번글 댓글 입력 처리 실패");
		}

		return result;
	}

	// 후원글 댓글 수정 Ajax 처리
	@ResponseBody
	@RequestMapping(value = "editComment.bit", method = { RequestMethod.POST })
	public int editComment(DonationComment donationComment, HttpServletRequest request, Model model)
			throws IOException {

		// 비밀글 체크 여부
		if (donationComment.getScstate() == null) {

			donationComment.setScstate("N");
		}

		int result = ds.editComment(donationComment);

		if (result == 1) {
			logger.info("후원글 " + donationComment.getDindex() + "번글 댓글 수정 처리 완료");
		} else {
			logger.info("후원글 " + donationComment.getDindex() + "번글 댓글 수정 처리 실패");
		}

		return result;
	}

	// 후원글 댓글 조회 Ajax
	@ResponseBody
	@RequestMapping(value = "getCommentList.bit", method = { RequestMethod.GET })
	public List<DonationComment> getCommentList(HttpServletRequest request, Model model) throws IOException {

		String dindex = request.getParameter("dindex");

		List<DonationComment> commentList = ds.getCommentList(dindex);

		if (commentList != null) {
			logger.info("후원글 " + dindex + "번글 댓글내역 조회 완료");
		} else {
			logger.info("후원글 " + dindex + "번글 댓글입력 조회 실패");
		}

		return commentList;
	}

	// 후원글 > 댓글 삭제 처리
	@RequestMapping(value = "deleteComment.bit", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteComment(DonationComment donationComment, Model model) {

		int result = ds.deleteComment(donationComment);
		int dindex = donationComment.getDindex();
		if (result == 1) {

			logger.info("후원글 글 삭제 완료");

			return "redirect:/donation/detail.bit?dindex=" + dindex + "";

		} else {

			logger.info("후원글 글 삭제 실패");

			return "javascript:history.back()";
		}

	}

	// 후원글 대댓글 입력 Ajax 처리
	@ResponseBody
	@RequestMapping(value = "writeRecomment.bit", method = { RequestMethod.POST })
	public int writeRecomment(DonationComment donationComment, HttpServletRequest request, Model model)
			throws IOException {

		// 비밀글 체크 여부
		if (donationComment.getScstate() == null) {

			donationComment.setScstate("N");
		}

		int result = ds.writeRecomment(donationComment);

		if (result == 1) {
			logger.info("후원글 " + donationComment.getDindex() + "번글 대댓글 입력 처리 완료");
		} else {
			logger.info("후원글 " + donationComment.getDindex() + "번글 대댓글 입력 처리 실패");
		}

		return result;
	}

}
