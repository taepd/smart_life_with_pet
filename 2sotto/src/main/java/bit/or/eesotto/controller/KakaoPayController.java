package bit.or.eesotto.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bit.or.eesotto.service.KakaoPay;
import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller

public class KakaoPayController {
	 	@Autowired
	    private KakaoPay kakaopay;
	    
	    
	    @RequestMapping(value = "/donation/kakaoPay.bit", method=RequestMethod.GET )
	    public void kakaoPayGet() {
	        
	    }
	    
	    @RequestMapping(value = "/donation/kakaoPay.bit", method=RequestMethod.POST)
	    public String kakaoPay() {
	        log.info("kakaoPay post............................................");
	        
	        return "redirect:" + kakaopay.kakaoPayReady();
	 
	    }
	    
	    @RequestMapping(value = "/donation/kakaoPaySuccess.bit", method=RequestMethod.GET)
	    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
	        log.info("kakaoPaySuccess get............................................");
	        log.info("kakaoPaySuccess pg_token : " + pg_token);
	        
	        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
	        
	        
	    }
}
