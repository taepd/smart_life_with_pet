package bit.or.eesotto.controller;

import java.security.*;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bit.or.eesotto.dao.PetDao;
import bit.or.eesotto.dto.Blog;
import bit.or.eesotto.dto.Mrecord;

import bit.or.eesotto.dto.Pet;
import bit.or.eesotto.dto.User;
import bit.or.eesotto.service.LoginService;
import bit.or.eesotto.service.ManagementService;
import bit.or.eesotto.service.MedicalService;

@Controller
@RequestMapping("/management/")
public class MedicalController {
	
	private static final Logger logger = LoggerFactory.getLogger(MedicalController.class);
	
	@Autowired
	private ManagementService managementService;
	
	@Autowired
	private MedicalService medicalService;
	
	

	// 병원이용 홈 보여주기
	@RequestMapping(value = "getMrecordList.bit", method = RequestMethod.GET) 
	public String getMrecordList(String cp, String ps, Principal principal, Model model) {
		
		//String userid = (String)session.getAttribute("userid");
		String userid =  principal.getName();
		logger.info("로그인 유저 아이디: "+userid);
		
		
		HashMap<String, Object> map = medicalService.getMrecordList(cp, ps, userid);		
		logger.info("병원이용 리스트 조회 완료");
		
		// view까지 전달 (forward)
		/*
		 * map.put("mrecordList", map.get("mrecordList")); 
		 * map.put("cpage", map.get("cpage")); 
		 * map.put("pageSize", map.get("pageSize"));
		 * map.put("pageCount", map.get("pageCount")); 
		 * map.put("totalMrecordCount",map.get("totalMrecordCount"));
		 */
		
		model.addAttribute("cpage", map.get("cpage"));
		model.addAttribute("pageSize", map.get("pageSize"));
		model.addAttribute("mrecordList", map.get("mrecordList"));
		model.addAttribute("pageCount", map.get("pageCount"));
		model.addAttribute("totalMrecordCount", map.get("totalMrecordCount"));
		logger.info("병원이용 정보 뷰로 쐈당");

		return "management/main";
		
		
	}

	// 병원이용기록 등록 페이지 보여주기/petname 가져오기
	@RequestMapping(value = "medicalRegister.bit", method = RequestMethod.GET)
	public String writeMedical(Principal principal, Model model) {
		
		String userid =  principal.getName();
		logger.info("로그인 유저 아이디: "+userid);
		
		HashMap<String, Object> map = medicalService.getPetname(userid);		
		logger.info("petname 가져오기 완료");	
		
		model.addAttribute("petNameList", map.get("petNameList"));
		model.addAttribute("totalMrecordCount", map.get("totalMrecordCount"));
		logger.info("petname이랑 userid 뷰로 쐈당");
		return "management/medicalRegister";
	}
	
	// 병원이용기록 등록 처리
	@RequestMapping(value = "medicalRegister.bit", method = RequestMethod.POST)
	public String writeMedical(Mrecord mrecord, HttpSession session, Principal principal, RedirectAttributes redirectAttributes, Model model) {
		
		//////////////////////////파일 업로드 구현 빠진 상태////////////////////////////
		
		//String userid = (String)session.getAttribute("userid");
		String userid =  principal.getName();
		logger.info("반려동물을 등록한 유저 아이디: " + userid);
		
		// 반려동물 등록한 유저 아이디 저장
		mrecord.setUserid(userid);
		User user = (User)session.getAttribute("user");	
		int result = medicalService.medicalRegister(mrecord);
		logger.info("프론트에서 값 받아오기 성공");
		
		String msg = null;
		String url = null;
		
		if(result == 1) {
			
			logger.info("병원 기록 등록 성공");
			
			msg = "병원 기록이 등록되었습니다.";
	        //url = "getMrecordList.bit";
			url = "main.bit";
	        
		} else { 
			
			redirectAttributes.addFlashAttribute("failedRegisterPet", "failed");
			logger.info("병원 기록 등록 실패");
			
			msg = "병원 기록 등록 실패";
			url = "javascript:history.back();";

		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "redirect";
	}
	
		// 병원 이용기록 상세 페이지 view
		@RequestMapping(value = "getMrecordDetail.bit", method = RequestMethod.GET)
		public String getMrecordDetail(String mindex, Principal principal, Model model) {
			
			Mrecord mrecord = medicalService.getMrecordDetail(mindex);
			logger.info("내 블로그 글 조회 완료");
			
			//petname 가져오기... 쉬불..
			String userid =  principal.getName();
			HashMap<String, Object> map = medicalService.getPetname(userid);		
			logger.info("petname 가져오기 완료");
			
			
			model.addAttribute("mrecord", mrecord);
			model.addAttribute("petNameList", map.get("petNameList"));
			
			return "management/medicalDetail";	
		}
		
		
		//  병원 이용 기록 수정 view
		@RequestMapping(value = "editMrecord.bit", method = RequestMethod.GET)
		public String editMrecord(String mindex, Principal principal, Model model) {
			
			Mrecord mrecord = medicalService.getMrecordDetail(mindex);			
			logger.info("병원이용기륵 조회 완료");
			
			//petname 가져오기... 쉬불..
			String userid =  principal.getName();
			HashMap<String, Object> map = medicalService.getPetname(userid);		
			logger.info("petname 가져오기 완료");
			
			model.addAttribute("mrecord", mrecord);
			model.addAttribute("petNameList", map.get("petNameList"));
			
			return "management/medicalUpdate";	
		}
		
		// 글 수정 처리
		@RequestMapping(value = "editMrecord.bit", method = RequestMethod.POST)
		public String editMrecord(Mrecord mrecord, Model model) {
												
			String msg = null;
			String url = null;
				
			int result = medicalService.editMrecord(mrecord);
		
			if(result==1) {
				
				logger.info("병원이용기륵 수정 완료");
				msg = "병원이용기륵 수정 완료";
		        url = "getMrecordDetail.bit?mindex="+mrecord.getMindex();
				
			}else { 
				
				logger.info("병원이용기륵 수정 실패");
				msg = "병원이용기륵 수정 실패";
		        url = "javascript:history.back();";

			}
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "redirect";	
			
		}
	
		// 마이페이지 > 글 삭제 처리
		@RequestMapping(value = "deleteMrecord.bit", method = {RequestMethod.GET, RequestMethod.POST})
		public String deleteMrecord(Mrecord mrecord, Model model) {
												
//			String msg = null;
//			String url = null;
				
			int result = medicalService.deleteMrecord(mrecord);
		
			if(result==1) {
				
				logger.info("블로그 글 삭제 완료");
//				msg = "블로그 글 삭제 완료";
//		        url = "main.bit";
				return "redirect:/management/getMrecordList.bit";
				
			}else { 
				
				logger.info("블로그 글 삭제 실패");
//				msg = "블로그 글 삭제 실패";
//		        url = "javascript:history.back();";
		        return "javascript:history.back()";
			}
		}
}
