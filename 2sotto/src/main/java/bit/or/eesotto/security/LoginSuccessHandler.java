package bit.or.eesotto.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.*;
import org.springframework.security.web.*;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import bit.or.eesotto.dao.*;
import bit.or.eesotto.dto.User;


//https://to-dy.tistory.com/94 참고
//https://cafe.naver.com/opensourceweb/1435 참고


public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler implements AuthenticationSuccessHandler{

	private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);
	
	private SqlSession sqlSession;    
    public SqlSession getSqlSession() {return sqlSession;}
    public void setSqlSession(SqlSession sqlSession) {this.sqlSession = sqlSession;}
	
    private String userid;
    private String defaultUrl;
    
    private RequestCache requestCache = new HttpSessionRequestCache();
    private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();

	
    public String getUserid() {
        return userid;
    }
 
    public void setUserid(String loginidname) {
        this.userid = loginidname;
    }
 
    public String getDefaultUrl() {
        return defaultUrl;
    }
 
    public void setDefaultUrl(String defaultUrl) {
        this.defaultUrl = defaultUrl;
    }
    
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
    		
    	   //로그인 성공 후 리다이렉트 경로 지정 메서드  
    	   resultRedirectStrategy(request, response, authentication);  
    	   
    	   //로그인 실패 에러 세션 지우기
    	   clearAuthenticationAttributes(request);
    	   logger.info("로그인 실패 에러 세션 지우기 완료");   	
    	   
    	   //로그인 유저 정보 가져와서 세션객체에 저장
    	   logger.info((String)authentication.getPrincipal().toString());
    	   
    	   UserDetails userDetails = (UserDetails)authentication.getPrincipal();
    	   
    	   UserDao userDao = sqlSession.getMapper(UserDao.class);
    	   User user = userDao.getUser(userDetails.getUsername());
    	   logger.info("유저네임: "+userDetails.getUsername());      	   
    	   
    	   HttpSession session = request.getSession();
    	   session.setAttribute("user", user);
    	   //로그인 유저 정보 가져와서 세션객체에 저장 끝
    	   
    }
    
    //로그인 성공 후 리다이렉트 경로 지정 메서드   
    protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        
        SavedRequest savedRequest = requestCache.getRequest(request, response);
        
        //저장된 리퀘스트 경로가 있는 경우 그쪽으로 이동, 없으면 디폴트 페이지로 이동
        if(savedRequest!=null) {
            String targetUrl = savedRequest.getRedirectUrl();
            redirectStratgy.sendRedirect(request, response, targetUrl);
            logger.info("이전 경로로 이동");
        } else {
            redirectStratgy.sendRedirect(request, response, defaultUrl);
            logger.info(defaultUrl+": 기본 경로로 이동");
        }
        
    }
    

}
