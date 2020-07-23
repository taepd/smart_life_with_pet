package bit.or.eesotto.controller;

import java.security.*;
import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import bit.or.eesotto.dto.*;
import bit.or.eesotto.service.*;

@Controller
@RequestMapping("/mypage/")
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class); 
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@Autowired		
	MypageService ms;
	
	@Autowired		
	BlogService bs;
	
	@Autowired
	ManagementService managementService;
	
	@Autowired
	PetService petService;
	
	
	// 마이페이지 view
	@RequestMapping(value = "main.bit", method = RequestMethod.GET)
	public String mainView(Principal principal, Model model) {
		
		String userid =  principal.getName();
		logger.info("로그인 유저 아이디: "+userid);
		
		List<Pet> petList = ms.getPetInfo(userid);
		model.addAttribute(petList);
		
		User user = ms.getUserInfo(userid);
		model.addAttribute(user);
		
		return "mypage/main";
	}

	// 마이페이지 > 수정 view
	@RequestMapping(value = "edit.bit", method = RequestMethod.GET)
	public String editView(Principal principal, Model model) {
		
		//String userid = (String)session.getAttribute("userid");
		String userid =  principal.getName();
		logger.info("로그인 유저 아이디: "+userid);
		
		User user = ms.getUserInfo(userid);
		
		if(user!=null) {
			
			logger.info("유저 정보 가져오기 성공");
			model.addAttribute(user);
			
			return "mypage/edit";
		}else {
			
			logger.info("유저 정보 가져오기 실패");
			
			return "redirect:/login/login.bit";
		}
	}
	
	/*
	// 마이페이지 > 수정 처리
	@RequestMapping(value = "edit.bit", method = RequestMethod.POST)
	public String editUser(Principal principal, String crntPwd, String pwd, Model model) {
							
		//String userid = (String)session.getAttribute("userid");
		String userid =  principal.getName();
		logger.info("로그인 유저 아이디: "+userid);
		
		User user = ms.getUserInfo(userid);
		
		String msg = null;
		String url = null;
			
		int result = ms.editUser(user);
	
		if(result==1) {
			
			logger.info("회원정보 수정 완료");
			msg = "회원정보 수정 완료";
	        url = "edit.bit";
			
		}else { 
			
			logger.info("회원정보 수정 실패");
			msg = "회원정보 수정 실패";
	        url = "edit.bit";

		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "redirect";	
		
	}	
	*/
	
	
	

	// 마이페이지 > 비밀번호 변경 view
	@RequestMapping(value = "editPwd.bit", method = RequestMethod.GET)
	public String editPwd() {
		return "mypage/editPwd";
	}
	
	// 마이페이지 > 비밀번호 변경 처리
	@RequestMapping(value = "editPwd.bit", method = RequestMethod.POST)
	public String editPwd(Principal principal, String crntPwd, String pwd, Model model) {
							
		//String userid = (String)session.getAttribute("userid");
		String userid =  principal.getName();
		logger.info("로그인 유저 아이디: "+userid);
		User user = ms.getUserInfo(userid);
		
		String msg = null;
		String url = null;
		
		//현재 비밀번호 제대로 입력했는지 확인
		if(!pwEncoder.matches(crntPwd, user.getPwd())) {
			
			logger.info("현재 비밀번호 입력 불일치");
			msg = "현재 비밀번호 입력이 일치하지 않습니다";
	        url = "javascript:history.back();";
	    
	        //현재 비밀번호와 변경할 비밀번호가 같은 경우    
		}else if(crntPwd.equals(pwd)){
			
			logger.info("현재 비밀번호와 변경 비밀번호 동일");
			msg = "현재 비밀번호와 동일한 비밀번호로 변경할 수 없습니다";
	        url = "javascript:history.back();";
			
		}else {
			
			int result = ms.editPwd(pwEncoder.encode(pwd), userid);
						
			if(result==1) {
				
				logger.info("비밀번호 변경 완료");
				msg = "비밀번호 변경 완료";
		        url = "main.bit";
				
			}else { 
				
				logger.info("비밀번호 변경 실패");
				msg = "비밀번호 변경 실패";
		        url = "javascript:history.back();";
		        
			}
		}
				
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "redirect";	
		
	}
	

	// 마이페이지 > 회원 탈퇴 view
	@RequestMapping(value = "withdrawal.bit", method = RequestMethod.GET)
	public String withdrawal(User userid) {
		
		
		return "mypage/withdrawal";
	}
	
	// 마이페이지 > 회원 탈퇴 view
	@RequestMapping(value = "withdrawal.bit", method = RequestMethod.POST)
	public String withdrawalOk(Model model, Principal principal, HttpSession session) {
		
		
		String userid =  principal.getName();
		logger.info("로그인 유저 아이디: "+userid);
		
				
		int result = ms.deleteUser(userid);
		
		String msg = null;
		String url = null;
		
		if(result==1) {
			session.removeAttribute("userid");
			session.invalidate();	
			
			logger.info("회원탈퇴 처리완료");
			msg = "회원 탈퇴가 정상적으로 처리되었습니다.";
	        url = "../index.jsp";
			
		}else { 
			
			logger.info("회원탈퇴 처리실패");
			msg = "문제가 생겨 회원탈퇴가 정상적으로 이루어지지 않았습니다.";
			url = "main.bit";

		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "redirect";	
		
	}

	// 마이페이지 > 내 반려동물 정보(반려동물 관리의 내 반려동물 정보와 동일한 내용의 페이지)
	@RequestMapping(value = "myPetsInfo.bit", method = RequestMethod.GET)
	public String myPetPage(Principal principal, Model model) {
		
		String userid =  principal.getName();
		logger.info("로그인 유저 아이디: "+userid);
		
		List<Pet> petList = ms.getPetInfo(userid);
		
		if(petList!=null) {
			
			logger.info("반려동물 정보 가져오기 성공");
			model.addAttribute(petList);
		}else {
			
			logger.info("반려동물 정보 가져오기 실패");
			
			return "redirect:/newPet.bit";
		}
		
		return "mypage/myPetsInfo";
	}
	
	// 반려동물의 마이페이지 view
	@RequestMapping(value = "petPage.bit", method = RequestMethod.GET)
	public String petPage(String cp, String ps, HttpServletRequest request, Model model) {
		
		//request객체로 세션 접근해서 userid 빼기
		String userid = ((User)request.getSession().getAttribute("user")).getUserid();
		String petindex = request.getParameter("petindex");
		
		//반려동물 정보 가져오기
		Pet pet = ms.getPet(Integer.parseInt(petindex));		
		
		//반려동물 관련 블로그 포스트 리스트 가져오기
		HashMap<String, Object> map = bs.petPostList(cp, ps, petindex);
		logger.info("내 블로그 글 리스트 조회 완료");
		
		//포스트와 관련된 pet정보를 추출하기 위한 작업//
		List<Pet> pArr = new ArrayList<Pet>();
		Set<String> pindexSet = new HashSet(); //petindex 중복 제거를 위한 임시 Set

		//postList에 담긴 모든 petindex를 검색하여 pindexSet에 추가
		List<Blog> postList = (List)map.get("postList");
		for(Blog post: postList) {
			
			String pIndexes = post.getPetindex();
			String[] arr = pIndexes.split(",");
			for(String pidx: arr) {
				
				pindexSet.add(pidx);
				System.out.println("셋: "+pindexSet);
			}
		}
		//중복이 제거된 petindex들의 pet객체 정보를 pArr에 추가
		for(String pindex: pindexSet) {
			pArr.add(managementService.editPetInfo(Integer.parseInt(pindex))); 
		}
		
		//유저가 팔로우한 반려동물인지 확인
		PetLike petLike = petService.isFollowPet(petindex, userid);		 
		
		model.addAttribute(pet);
		model.addAttribute("cpage", map.get("cpage"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("postList", map.get("postList")); 		
		model.addAttribute("pageCount", map.get("pageCount"));
		model.addAttribute("totalPostCount", map.get("totalPostCount"));
		model.addAttribute("pArr", pArr);
		model.addAttribute("petLike", petLike);
		
		return "mypage/petPage";
	}
	
	// 반려동물 팔로우(petlike) 처리
	@ResponseBody
	@RequestMapping(value = "followPet.bit", method = RequestMethod.POST)
	public int followPet(PetLike petLike, Principal principal) {
		
		petLike.setUserid(principal.getName());
		
		return petService.followPet(petLike);
	}
	
	// 반려동물 언팔로우(petlike) 처리
	@ResponseBody
	@RequestMapping(value = "unFollowPet.bit", method = RequestMethod.POST)
	public int unFollowPet(PetLike petLike, Principal principal) {
		
		petLike.setUserid(principal.getName());		
		
		return petService.unFollowPet(petLike);
	}
	
	
	
	
	

//		management로 이관했는듯 확인하고 지울 것
//		// 마이페이지 > 반려동물 상세페이지 >> 반려동물 수정 view
//		@RequestMapping(value = "editPet.bit", method = RequestMethod.GET)
//		public String editPetView(Model model, HttpSession session) {
//			String userid = (String) session.getAttribute("userid");
//		
//			logger.info("로그인 유저 아이디: "+userid);
//			
//			Pet pet = ms.getPetInfo(userid);
//			
//			if(pet!=null) {
//				
//				logger.info("유저 정보 가져오기 성공");
//				model.addAttribute(pet);
//				
//				return "mypage/editPet";
//			}else {
//				
//				logger.info("유저 정보 가져오기 실패");
//				
//				return "redirect:/login.bit";
//			}
//
//		
//		}
//		//반려동물 수정처리
//		@RequestMapping(value = "editPet.bit", method = RequestMethod.POST)
//		public String editPet(HttpSession session, Model model, @Param("userid")String userid) {
//								
//			userid = (String)session.getAttribute("userid");
//			logger.info("로그인 유저 아이디: "+userid);
//			
//			Pet pet = ms.getPetInfo(userid);
//			
//			String msg = null;
//			String url = null;
//				
//			int result = ms.editPet(pet, userid);
//		
//			if(result==1) {
//				
//				logger.info("정보 수정 완료");
//				msg = "정보 수정 완료";
//		        url = "editPet.bit";
//				
//			}else { 
//				
//				logger.info("정보 수정 실패");
//				msg = "정보 수정 실패";
//		        url = "editPet.bit";
//
//			}
//			
//			model.addAttribute("msg", msg);
//			model.addAttribute("url", url);
//			
//			return "redirect";	
//			
//		}	

}
