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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import bit.or.eesotto.dao.DonateDao;
import bit.or.eesotto.dao.UserDao;
import bit.or.eesotto.dto.Donate;
import bit.or.eesotto.dto.User;

@Service
public class DonationService {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	DonateDao donatedao;
	
	@Autowired
	UserDao userdao;

	/*
	 * private static final Logger logger =
	 * 
	 */

	// 후원게시판 글쓰기
	public int write(Donate donate, HttpServletRequest request, Principal principal)
			throws IOException, ClassNotFoundException, SQLException {

		int result = 0;
		try {
			donatedao = sqlsession.getMapper(DonateDao.class);
			result = donatedao.write(donate);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}

	// 글 상세보기
	public Donate detail(String dindex) {

		Donate donate = null;
		try {
			donatedao = sqlsession.getMapper(DonateDao.class);
			donate = donatedao.detail(dindex);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return donate;
	}

	/*
	 * //후원글 목록 뿌리기 public List<Donate> getDonationList(String pg , String f ,
	 * String q) throws ClassNotFoundException, SQLException {
	 * 
	 * //default int page =1; String field = "title"; String query = "%%";
	 * 
	 * //조건처리 if(pg != null && !pg.equals("")) { page = Integer.parseInt(pg); } if(f
	 * != null && !f.equals("")) { field = f; } if(q != null && !q.equals("")) {
	 * query = q; }
	 * 
	 * //DAO 데이터 받아오기 List<Donate> list=null; try {
	 * 
	 * DonateDao donatedao = sqlsession.getMapper(DonateDao.class); list =
	 * donatedao.getDonationList(page, field, query);
	 * 
	 * } catch (ClassNotFoundException e) { e.printStackTrace(); } catch
	 * (SQLException e) { e.printStackTrace(); }
	 * 
	 * return list; }
	 */
	//글 목록
	public HashMap<String, Object> main(String cp, String ps) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		// List 페이지 처음 호출
		if (ps == null || ps.trim().equals("")) {
			// default 값 설정
			ps = "5"; // 5개씩
		}

		if (cp == null || cp.trim().equals("")) {
			// default 값 설정
			cp = "1"; // 1번째 페이지 보겠다
		}

		int pageSize = Integer.parseInt(ps);
		int cpage = Integer.parseInt(cp);
		int pageCount = 0;

		/*
		 * logger.info("pagesize" + pagesize); logger.info("cpage" + cpage);
		 */

		// DAO 데이터 받아오기
		List<Donate> donateList = null;

		// mapper 를 통한 인터페이스 연결
		DonateDao donateDao = sqlsession.getMapper(DonateDao.class);

		int totaldonatecount = donateDao.getDonationCount();
		//
		donateList = donateDao.main(cpage, pageSize);

		// 페이지 크기에 맞춰 페이지 수 구하기
		if (totaldonatecount % pageSize == 0) {
			pageCount = totaldonatecount / pageSize;
		} else {
			pageCount = (totaldonatecount / pageSize) + 1;
		}

		map.put("donateList", donateList);
		map.put("cpage", cpage);
		map.put("pageSize", pageSize);
		map.put("pageCount", pageCount);
		map.put("totaldonatecount", totaldonatecount);

		return map;
	}

	/*
	 * //글 수정 처리 public String update(Donate donate , HttpServletRequest request)
	 * throws IOException, ClassNotFoundException, SQLException {
	 * 
	 * List<CommonsMultipartFile> files = donate.getFiles(); List<String> filenames
	 * = new ArrayList<String>(); //파일명관리
	 * 
	 * if(files != null && files.size() > 0) { //최소 1개의 업로드가 있다면
	 * for(CommonsMultipartFile multifile : files) { String filename =
	 * multifile.getOriginalFilename(); String path =
	 * request.getServletContext().getRealPath("/customer/upload");
	 * 
	 * String fpath = path + "\\"+ filename;
	 * 
	 * if(!filename.equals("")) { //실 파일 업로드 FileOutputStream fs = new
	 * FileOutputStream(fpath); fs.write(multifile.getBytes()); fs.close(); }
	 * filenames.add(filename); //파일명을 별도 관리 (DB insert) }
	 * 
	 * }
	 * 
	 * //DB 파일명 저장
	 * 
	 * donate.setFileSrc(filenames.get(0)); donate.setFileSrc2(filenames.get(1));
	 * 
	 * if( !filenames.isEmpty() ) { donate.setDimg(filenames.get(0));
	 * 
	 * }
	 * 
	 * DonateDao donatedao = sqlsession.getMapper(DonateDao.class);
	 * donatedao.update(donate); return
	 * "redirect:getDonationDetail.bit?dindex="+donate.getDindex(); }
	 */
	
	//글 목록 시간순(최신)
		public HashMap<String, Object> mainbydate(String cp, String ps) {

			HashMap<String, Object> map = new HashMap<String, Object>();

			// List 페이지 처음 호출
			if (ps == null || ps.trim().equals("")) {
				// default 값 설정
				ps = "5"; // 5개씩
			}

			if (cp == null || cp.trim().equals("")) {
				// default 값 설정
				cp = "1"; // 1번째 페이지 보겠다
			}

			int pageSize = Integer.parseInt(ps);
			int cpage = Integer.parseInt(cp);
			int pageCount = 0;

			/*
			 * logger.info("pagesize" + pagesize); logger.info("cpage" + cpage);
			 */

			// DAO 데이터 받아오기
			List<Donate> donateList = null;

			// mapper 를 통한 인터페이스 연결
			DonateDao donateDao = sqlsession.getMapper(DonateDao.class);

			int totaldonatecount = donateDao.getDonationCount();
			//
			donateList = donateDao.mainbydate(cpage, pageSize);

			// 페이지 크기에 맞춰 페이지 수 구하기
			if (totaldonatecount % pageSize == 0) {
				pageCount = totaldonatecount / pageSize;
			} else {
				pageCount = (totaldonatecount / pageSize) + 1;
			}

			map.put("donateList", donateList);
			map.put("cpage", cpage);
			map.put("pageSize", pageSize);
			map.put("pageCount", pageCount);
			map.put("totaldonatecount", totaldonatecount);

			return map;
		}
	
	//글 수정	
	 public int update(Donate donate) {
		 
		 int result = 0;
		 try 
		 { 
			 DonateDao donatedao = sqlsession.getMapper(DonateDao.class);
			 result = donatedao.update(donate);
		 } 
		 catch(Exception e) 
		 { 
			 System.out.println(e.getMessage()); 
		 }
		 
		 return result;
	 
	 }
	 
	 //글 삭제하기
	 public int delete(Donate donate) throws ClassNotFoundException, SQLException {
		 int result = 0;
		 try 
		 { 
			 DonateDao donatedao = sqlsession.getMapper(DonateDao.class);
			 result = donatedao.delete(donate);
		 } 
		 catch(Exception e) 
		 { 
			 System.out.println(e.getMessage()); 
		 }
		 
		 return result;
		 
	 }
	 
	 //포인트 기부
	 @Transactional
	 public int donatePoint(Donate donate, int dpoint, String dUserid) {
		 
		 
		 int result = 0;
		 
		 
		 try {
			 DonateDao donatedao = sqlsession.getMapper(DonateDao.class);
			 
			 System.out.println("dpdpdp"+dpoint);
			 
				/* if(userdao.getUser(userid) < donatedao.) */
			 int result1 = donatedao.minusUserPoint(dpoint, dUserid);
			 int result2 = donatedao.plusCcollPoint(donate.getDindex(), dpoint); 
			 result = result1 * result2;
			 
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		 
		 return result;
	 }
	
}
