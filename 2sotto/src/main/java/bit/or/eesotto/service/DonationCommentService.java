package bit.or.eesotto.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import bit.or.eesotto.dao.DonateCommentDao;
import bit.or.eesotto.dao.DonateDao;
import bit.or.eesotto.dto.Donate;
import bit.or.eesotto.dto.DonateComment;

@Service
public class DonationCommentService {
 
	private SqlSession sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
    @Autowired
    DonateCommentDao donateCommentDao;
    
    public List<DonateComment> commentMain() throws Exception{
        
    	donateCommentDao = sqlsession.getMapper(DonateCommentDao.class);    	
        return donateCommentDao.commentMain();
    }
    
    public int commentWrite(DonateComment donateComment) throws Exception{
    	
    	donateCommentDao = sqlsession.getMapper(DonateCommentDao.class);
        return donateCommentDao.commentWrite(donateComment);
    }
    
    public int commentUpdate(DonateComment donateComment) throws Exception{
    	
    	donateCommentDao = sqlsession.getMapper(DonateCommentDao.class);
        return donateCommentDao.commentUpdate(donateComment);
    }
    
    public int commentDelete(int dcindex) throws Exception{
    	
    	donateCommentDao = sqlsession.getMapper(DonateCommentDao.class);
        return donateCommentDao.commentDelete(dcindex);
    }
}


