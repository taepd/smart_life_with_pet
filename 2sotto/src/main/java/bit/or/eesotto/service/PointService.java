package bit.or.eesotto.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

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
		System.out.println("여기에 뭐있니?" + map);
		return map;
	}

	// 글 상세보기
	public Point getPointDetail(String ptindex) {

		Point point = null;

		pointDao = sqlsession.getMapper(PointDao.class);
		point = pointDao.getPointDetail(ptindex);

		return point;
	}

	// 어드민 > 포인트 리스트 조회
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


	// 일자 별 결제액
	public List<Map<String, Object>> pCountByDay() {

		List<Map<String, Object>> map = null;

		try {

			pointDao = sqlsession.getMapper(PointDao.class);
			map = pointDao.pCountByDay();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return map;
	}

}
