package bit.or.eesotto.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import bit.or.eesotto.dao.*;
import bit.or.eesotto.dto.*;

@Service
public class PointService {
	
	private static final Logger logger = LoggerFactory.getLogger(PointService.class);

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	UserDao userDao;
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	PointDao pointDao;
	
	public HashMap<String, Object> pointView(String cp, String ps, String userid) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// List 페이지 처음 호출
		if (ps == null || ps.trim().equals("")) {
			// default 값 설정
			ps = "9"; // 5개씩
		}

		if (cp == null || cp.trim().equals("")) {
			// default 값 설정
			cp = "1"; // 1번째 페이지 보겠다
		}
		
		int pageSize = Integer.parseInt(ps);
		int cpage = Integer.parseInt(cp);
		int pageCount = 0;

		logger.info("pageSize" + pageSize);
		logger.info("cpage" + cpage);
		
		// DAO 데이터 받아오기
		List<Point> pointList = null;

		// mapper 를 통한 인터페이스 연결
		PointDao pointDao = sqlsession.getMapper(PointDao.class);

		int totalPointCount = pointDao.getUserPointCount(userid);
		
		//
		pointList = pointDao.getUserPointList(cpage, pageSize, userid);
		
		// 페이지 크기에 맞춰 페이지 수 구하기
		if (totalPointCount % pageSize == 0) {
			pageCount = totalPointCount / pageSize;
		} else {
			pageCount = (totalPointCount / pageSize) + 1;
		}
		
		map.put("pointList", pointList);
		map.put("cpage", cpage);
		map.put("pageSize", pageSize);
		map.put("pageCount", pageCount);
		map.put("totalPointCount", totalPointCount);
		System.out.println("여기에 뭐있니?"+map);
		return map;
	}
	
	//글 상세보기 
	public Point getPointDetail(String ptindex) {
				
		Point point = null;

		pointDao = sqlsession.getMapper(PointDao.class);
		point = pointDao.getPointDetail(ptindex);
							
		return point;
	}
	
	
	
	
	

	//어드민 > 포인트 리스트 조회
	public List<Point> getPointList() {
		System.out.println("건휘야");
		List<Point> pointList = null;
		System.out.println("집에가자");
		try {

			pointDao = sqlsession.getMapper(PointDao.class);
			pointList = pointDao.getPointList();
			System.out.println(pointList);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return pointList;
	}
	
	
		//어드민 > 유저 가입 확인 시작 
		public int getUserCount(User user) {
			int result = 0;
			try {
				userDao = sqlsession.getMapper(UserDao.class);
				result = userDao.getUserCount(user);
				System.out.println("너는 값이 뭐로 나오나??");	
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			return result;
		}
		//어드민 > 유저 가입 확인 끝
		// -----------이메일 체크 시작----------- 
		//중복된 코드같은데 일단 가지고있음.
		/*
		public List<String> idCheck(String userid) {

			List<String> list = null;

			try {

				userDao = sqlsession.getMapper(UserDao.class);
				list = userDao.getUserId(userid);

			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			return list;
		}
		*/
		
		// -----------이메일 체크 끝-----------
		// ------------이메일 발송 서비스 시작------------
		public int sendConfirmEmail(Email email) throws Exception {
			MimeMessage messagedto = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(messagedto, true, "utf-8");

			Random random = new Random(System.currentTimeMillis());
			int confirmation = 0;

			while (true) {
				confirmation = (random.nextInt(10000));
				if (confirmation < 10000 && confirmation > 1000) {
					break;
				}
			}

			messageHelper.setFrom("2sotto.bit155@gmail.com"); // 보내는 메일주소는 수정하자 dispatcher-servlet이랑 맞춰주자.
			messageHelper.setTo(email.getReceiveMail());
			messageHelper.setSubject("2sotto 회원가입을 위해 요청하신 인증번호입니다.");
			messageHelper.setText("요청하신 인증번호는 " + confirmation + "입니다.");

			mailSender.send(messagedto);

			return confirmation; 
		}
		// ------------이메일 발송 서비스 끝------------
		
	

		
}

