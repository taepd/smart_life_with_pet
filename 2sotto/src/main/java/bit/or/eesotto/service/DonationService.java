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
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import bit.or.eesotto.dao.*;
import bit.or.eesotto.dto.*;

@Service
public class DonationService {

	@Autowired
	DonationCommentDao donationCommentDao;

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	DonationDao donatedao;

	@Autowired
	UserDao userdao;

	/*
	 * private static final Logger logger =
	 * 
	 */

	// 후원게시판 글쓰기
	public int write(Donation donate, HttpServletRequest request, Principal principal)
			throws IOException, ClassNotFoundException, SQLException {

		int result = 0;
		try {
			donatedao = sqlsession.getMapper(DonationDao.class);
			result = donatedao.write(donate);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}

	// 글 상세보기
	public Donation detail(String dindex) {

		Donation donate = null;
		try {
			donatedao = sqlsession.getMapper(DonationDao.class);
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
	// 글 목록
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
		List<Donation> donationList = null;

		// mapper 를 통한 인터페이스 연결
		DonationDao donateDao = sqlsession.getMapper(DonationDao.class);

		int totaldonatecount = donateDao.getDonationCount();
		//
		donationList = donateDao.main(cpage, pageSize);

		// 페이지 크기에 맞춰 페이지 수 구하기
		if (totaldonatecount % pageSize == 0) {
			pageCount = totaldonatecount / pageSize;
		} else {
			pageCount = (totaldonatecount / pageSize) + 1;
		}

		map.put("donationList", donationList);
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

	// 글 목록 시간순(최신)
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
		List<Donation> donateList = null;

		// mapper 를 통한 인터페이스 연결
		DonationDao donateDao = sqlsession.getMapper(DonationDao.class);

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

	// 글 수정
	public int update(Donation donate) {
		System.out.println("글 수정 여기까지는 온다...");
		int result = 0;
		try {
			DonationDao donatedao = sqlsession.getMapper(DonationDao.class);
			result = donatedao.update(donate);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("글 수정 매핑 된다.");
		return result;

	}

	// 글 삭제하기
	public int delete(Donation donate) throws ClassNotFoundException, SQLException {
		int result = 0;
		try {
			DonationDao donatedao = sqlsession.getMapper(DonationDao.class);
			result = donatedao.delete(donate);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;

	}

	// 포인트 기부
	@Transactional
	public int donatePoint(Donation donate, int dpoint, String dUserid) {

		int result = 0;

		try {
			DonationDao donatedao = sqlsession.getMapper(DonationDao.class);
			
			int dindex = donate.getDindex();
			String userid = dUserid;
			int dcoll = dpoint;
			
			

			System.out.println("dpdpdp" + dpoint);

			/* if(userdao.getUser(userid) < donatedao.) */
			int result1 = donatedao.minusUserPoint(dpoint, dUserid);
			int result2 = donatedao.plusCcollPoint(donate.getDindex(), dpoint);
			System.out.println("서비스 단 dindex 가져오나?" + donate.getDindex());
			int result3 = donatedao.donationRecord(dindex, userid, dcoll);
			System.out.println("서비스 단 result3" + result3);
			
			result = result1 * result2 * result3;

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}

	// donationrecord 테이블에 입력
	/*
	 * public int donationRecord(DonationRecord donationRecord) {//String userid,
	 * String point System.out.println("donationRecord DAO 타기는 하나??"); int result =
	 * 0;
	 * 
	 * 
	 * User user = new User(); int upoint = user.getPoint() +
	 * Integer.parseInt(point); logger.info("합산 포인트: " + upoint);
	 * 
	 * 
	 * try {
	 * 
	 * donatedao = sqlsession.getMapper(DonateDao.class); result =
	 * donatedao.donationRecord(donationRecord);
	 * 
	 * System.out.println("donationRecord DAO 작동하니?" + result);
	 * 
	 * } catch (Exception e) { System.out.println(e.getMessage()); }
	 * 
	 * return result; }
	 */

	// 기부 완료(우선 ccoll = gcoll일 경우)
	public int completeDonationByColl(String dindex) {

		int result = 0;

		try {
			DonationDao donatedao = sqlsession.getMapper(DonationDao.class);
			result = donatedao.completeDonationByColl(Integer.parseInt(dindex));

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}

	// 후원글 댓글기능 service
	// 후원글 > 댓글 쓰기
	public int writeCommnet(DonationComment donationComment) {

		int result = 0;

		try {

			donationCommentDao = sqlsession.getMapper(DonationCommentDao.class);
			result = donationCommentDao.writeComment(donationComment);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}

	// 후원글 > 댓글 수정
	public int editComment(DonationComment donationComment) {

		int result = 0;

		try {

			donationCommentDao = sqlsession.getMapper(DonationCommentDao.class);
			result = donationCommentDao.writeComment(donationComment);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}

	// 후원글 > 댓글 조회
	public DonationComment getComment(int dcindex) {

		DonationComment donationComment = null;

		try {

			donationCommentDao = sqlsession.getMapper(DonationCommentDao.class);
			donationComment = donationCommentDao.getComment(dcindex);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return donationComment;
	}

	// 후원글 > 댓글 리스트 조회
	public List<DonationComment> getCommentList(String dindex) {

		List<DonationComment> commentList = null;

		try {

			donationCommentDao = sqlsession.getMapper(DonationCommentDao.class);
			commentList = donationCommentDao.getCommentList(dindex);
			System.out.println(commentList);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return commentList;
	}

	// 후원글 > 댓글 삭제
	public int deleteComment(DonationComment donationComment) {

		donationCommentDao = sqlsession.getMapper(DonationCommentDao.class);

		return donationCommentDao.deleteComment(donationComment);
	}

	// 후원글 > 댓글 쓰기
	public int writeRecomment(DonationComment donationComment) {

		int result = 0;

		try {

			donationCommentDao = sqlsession.getMapper(DonationCommentDao.class);
			result = donationCommentDao.writeRecomment(donationComment);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}
	
	//어드민 > 후원 리스트 조회
		public List<Donation> getDonationList() {
			List<Donation> donationList = null;
			try {

				donatedao = sqlsession.getMapper(DonationDao.class);
				donationList = donatedao.getDonationList();
				System.out.println(donationList);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			return donationList;
		}
}
