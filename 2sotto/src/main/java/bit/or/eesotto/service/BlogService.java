package bit.or.eesotto.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import bit.or.eesotto.controller.BlogController;
import bit.or.eesotto.dao.PostDao;
import bit.or.eesotto.dao.UserDao;
import bit.or.eesotto.dto.Post;
import bit.or.eesotto.dto.User;

@Service
public class BlogService {
	
	private static final Logger logger = LoggerFactory.getLogger(BlogService.class);

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	PostDao postDao;

	// 일반 회원가입
	public int writePost(Post post) {
		int result = 0;

		try {

			postDao = sqlsession.getMapper(PostDao.class);
			result = postDao.writePost(post);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}

	public HashMap<String, Object> mainView(String cp, String ps, String userid) {
		
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
		
		int pagesize = Integer.parseInt(ps);
		int cpage = Integer.parseInt(cp);
		int pagecount = 0;

		logger.info("pagesize" + pagesize);
		logger.info("cpage" + cpage);
		
		// DAO 데이터 받아오기
		List<Post> postList = null;

		// mapper 를 통한 인터페이스 연결
		PostDao postDao = sqlsession.getMapper(PostDao.class);

		int totalempcount = postDao.getPostCount(userid);
		//
		postList = postDao.getPostList(cpage, pagesize, userid);

		// 페이지 크기에 맞춰 페이지 수 구하기
		if (totalempcount % pagesize == 0) {
			pagecount = totalempcount / pagesize;
		} else {
			pagecount = (totalempcount / pagesize) + 1;
		}
		
		map.put("postList", postList);
		map.put("cpage", cpage);
		map.put("pagesize", pagesize);
		map.put("pagecount", pagecount);
		map.put("totalempcount", totalempcount);
		
		return map;
	}

}

