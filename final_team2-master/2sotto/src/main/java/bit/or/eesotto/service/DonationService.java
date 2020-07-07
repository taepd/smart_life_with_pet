package bit.or.eesotto.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import bit.or.eesotto.dao.DonateDao;
import bit.or.eesotto.dto.Donate;




@Service
public class DonationService {
	private SqlSession sqlsession;
	
	

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	@Autowired
	DonateDao donatedao;
	
	
	
	
	
	//후원게시판  글쓰기
	public int donationWrite(Donate donate, HttpServletRequest request, Principal principal) throws IOException, ClassNotFoundException, SQLException  {
				
		int result = 0;
		try {
			donatedao = sqlsession.getMapper(DonateDao.class);
			result = donatedao.donationWrite(donate);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	
		return result; 
	}
	
	//글 상세보기
		public Donate getDonationDetail(String dindex) {
			
			Donate donate = null;
			try {
				donatedao = sqlsession.getMapper(DonateDao.class);
				donate = donatedao.getDonationDetail(dindex);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return donate;
		}
		
		//후원글 목록 뿌리기
		public List<Donate> getDonationList(String pg , String f , String q) throws ClassNotFoundException, SQLException {
			
			//default
			int page =1;
			String field = "title";
			String query = "%%";
						
			//조건처리
					if(pg != null && !pg.equals("")) {
						page = Integer.parseInt(pg);
					}
					if(f != null && !f.equals("")) {
						field = f;
					}
					if(q != null && !q.equals("")) {
						query = q;
					}
					
			//DAO 데이터 받아오기
					List<Donate> list=null;
					try {
						
						DonateDao donatedao = sqlsession.getMapper(DonateDao.class);
						list = donatedao.getDonationList(page, field, query);
						
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
			return list;
		}
}
