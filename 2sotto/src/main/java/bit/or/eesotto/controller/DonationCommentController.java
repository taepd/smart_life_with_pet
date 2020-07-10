package bit.or.eesotto.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import bit.or.eesotto.dao.DonateDao;
import bit.or.eesotto.dao.QnaDao;
import bit.or.eesotto.dto.Donate;
import bit.or.eesotto.dto.DonateComment;
import bit.or.eesotto.dto.Qna;
import bit.or.eesotto.service.DonationCommentService;
import bit.or.eesotto.service.DonationService;

@RestController // @Controller + @ResponseBody 비동기를 위한 Restcontroller는 따로 빼는게 좋다
@RequestMapping("/donation/")
public class DonationCommentController {

	@Autowired
    DonationCommentService donationCommentService;
    
	 //댓글 리스트
    @RequestMapping(value = "commentMain.bit", method=RequestMethod.GET)
    @ResponseBody
    private List<DonateComment> commentMain(Model model) throws Exception{
        
        return donationCommentService.commentMain();
    }
    
    //댓글쓰기 처리
    @RequestMapping(value = "commentWrite.bit", method=RequestMethod.POST)  
    @ResponseBody
    private int commentWrite(@RequestParam int dindex, @RequestParam String userid, @RequestParam String content, @RequestParam HttpSession session) throws Exception{
        
    	DonateComment donateComment = new DonateComment();
    	
    	donateComment.setDindex(dindex);
    	donateComment.setContent(content);
        //로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 됩니다. 저는 따로 폼을 구현하지 않았기때문에 임시로 "test"라는 값을 입력해놨습니다.
    	
    	donateComment.setUserid(userid);  
        
        return donationCommentService.commentWrite(donateComment);
    }
  
    //댓글 수정    
    @RequestMapping(value="commentUpdate.bit",method=RequestMethod.POST) 
    @ResponseBody
    private int commentUpdate(@RequestParam int dindex, @RequestParam String content) throws Exception{
        
    	DonateComment donateComment = new DonateComment();
    	donateComment.setDindex(dindex);
    	donateComment.setContent(content);
        
        return donationCommentService.commentUpdate(donateComment);
    }
    
    @RequestMapping("delete.bit") //댓글 삭제  
    @ResponseBody
    private int commentDelete(@PathVariable int dcindex) throws Exception{
        
        return donationCommentService.commentDelete(dcindex);
    }




}
