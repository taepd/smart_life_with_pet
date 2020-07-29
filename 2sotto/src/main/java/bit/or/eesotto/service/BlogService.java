package bit.or.eesotto.service;

import java.sql.SQLException;
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
import bit.or.eesotto.dao.*;
import bit.or.eesotto.dto.*;

@Service
public class BlogService {
	
	private static final Logger logger = LoggerFactory.getLogger(BlogService.class);

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	BlogDao blogDao;
	
	@Autowired
	BlikeDao blikeDao;
	
	@Autowired
	BlogCommentDao blogCommentDao;

	// 블로그 > 새 글 쓰기
	public int writePost(Blog blog) {
		int result = 0;

		try {

			blogDao = sqlsession.getMapper(BlogDao.class);
			result = blogDao.writePost(blog);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}
	
	// 블로그 > 내 포스팅 리스트 조회
	public HashMap<String, Object> myMainView(String cp, String ps, String userid) {
		
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

		logger.info("pageSize :" + pageSize);
		logger.info("cpage :" + cpage);
		
		// DAO 데이터 받아오기
		List<Blog> postList = null;

		// mapper 를 통한 인터페이스 연결
		BlogDao blogDao = sqlsession.getMapper(BlogDao.class);

		int totalPostCount = blogDao.getPostCount(userid, "userid");
		
		//
		postList = blogDao.getMyPostList(cpage, pageSize, userid, "userid");

		// 페이지 크기에 맞춰 페이지 수 구하기
		if (totalPostCount % pageSize == 0) {
			pageCount = totalPostCount / pageSize;
		} else {
			pageCount = (totalPostCount / pageSize) + 1;
		}
		
		map.put("postList", postList);
		map.put("cpage", cpage);
		map.put("pageSize", pageSize);
		map.put("pageCount", pageCount);
		map.put("totalPostCount", totalPostCount);
		
		return map;
	}
	
	// 블로그 > 모두의 포스팅 리스트 조회
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
		
		int pageSize = Integer.parseInt(ps);
		int cpage = Integer.parseInt(cp);
		int pageCount = 0;

		logger.info("pageSize :" + pageSize);
		logger.info("cpage :" + cpage);
		
		// DAO 데이터 받아오기
		List<Blog> postList = null;

		// mapper 를 통한 인터페이스 연결
		BlogDao blogDao = sqlsession.getMapper(BlogDao.class);

		int totalPostCount = blogDao.getPostCount(null, null);
		System.out.println("포스트 카운드: "+ totalPostCount);
		//
		postList = blogDao.getPostList(cpage, pageSize, userid, "userid"); 

		// 페이지 크기에 맞춰 페이지 수 구하기
		if (totalPostCount % pageSize == 0) {
			pageCount = totalPostCount / pageSize;
		} else {
			pageCount = (totalPostCount / pageSize) + 1;
		}
		
		map.put("postList", postList);
		map.put("cpage", cpage);
		map.put("pageSize", pageSize);
		map.put("pageCount", pageCount);
		map.put("totalPostCount", totalPostCount);
		
		return map;
	}
	// 블로그 > 인기 포스팅 리스트 조회
	public HashMap<String, Object> popularPostList(String cp, String ps, String userid) {
		
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

		logger.info("pageSize :" + pageSize);
		logger.info("cpage :" + cpage);
		
		// DAO 데이터 받아오기
		List<Blog> postList = null;

		// mapper 를 통한 인터페이스 연결
		BlogDao blogDao = sqlsession.getMapper(BlogDao.class);

		int totalPostCount = blogDao.getPostCount(null, null);
		System.out.println("포스트 카운드: "+ totalPostCount);
		//
		postList = blogDao.getPopularPostList(cpage, 2, userid, "userid"); 

		// 페이지 크기에 맞춰 페이지 수 구하기
		if (totalPostCount % pageSize == 0) {
			pageCount = totalPostCount / pageSize;
		} else {
			pageCount = (totalPostCount / pageSize) + 1;
		}
		
		map.put("postList", postList);
		map.put("cpage", cpage);
		map.put("pageSize", pageSize);
		map.put("pageCount", pageCount);
		map.put("totalPostCount", totalPostCount);
		
		return map;
	}	

	//글 상세보기 
	public Blog getPost(String bindex) {
				
		Blog blog = null;

		blogDao = sqlsession.getMapper(BlogDao.class);
		blog = blogDao.getPost(bindex);
							
		return blog;
	}
	
	//글 조회수 증가
	public int updateCount(String bindex) {
		
		int result = 0;
		
		blogDao = sqlsession.getMapper(BlogDao.class);
		result = blogDao.updateCount(bindex);
		
		return result;
	}
	
	//블로그 > 글 수정
	public int editPost(Blog post) {

		blogDao = sqlsession.getMapper(BlogDao.class);
									
		return blogDao.editPost(post);
	}
	
	//블로그 > 글 삭제
	public int deletePost(Blog post) {

		blogDao = sqlsession.getMapper(BlogDao.class);
		
		return blogDao.deletePost(post);
	}
	
	//블로그 > 댓글 쓰기
	public int writeCommnet(BlogComment blogComment) {
		
		int result = 0;

		try {

			blogCommentDao = sqlsession.getMapper(BlogCommentDao.class);
			result = blogCommentDao.writeComment(blogComment);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}


	//블로그 > 댓글 수정
	public int editComment(BlogComment blogComment) {
		
		int result = 0;

		try {

			blogCommentDao = sqlsession.getMapper(BlogCommentDao.class);
			result = blogCommentDao.editComment(blogComment);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}	
	//블로그 > 댓글 조회
	public BlogComment getComment(int bcindex) {
		
		BlogComment comment = null;

		try {

			blogCommentDao = sqlsession.getMapper(BlogCommentDao.class);
			comment = blogCommentDao.getComment(bcindex);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return comment;
	}
	
	//블로그 > 댓글 리스트 조회
	public List<BlogComment> getCommentList(String bindex) {
		
		List<BlogComment> commentList = null;

		try {

			blogCommentDao = sqlsession.getMapper(BlogCommentDao.class);
			commentList = blogCommentDao.getCommentList(bindex);
			System.out.println(commentList);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return commentList;
	}
	
	//블로그 > 글 삭제
	public int deleteComment(BlogComment comment) {

		blogCommentDao = sqlsession.getMapper(BlogCommentDao.class);
		
		return blogCommentDao.deleteComment(comment);
	}
	
	//블로그 > 댓글 쓰기
	public int writeRecomment(BlogComment blogComment) {
		
		int result = 0;

		try {

			blogCommentDao = sqlsession.getMapper(BlogCommentDao.class);
			result = blogCommentDao.writeRecomment(blogComment);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}
	
	//특정 반려동물 블로그 포스트 리스트 조회
	public HashMap<String, Object> petPostList(String cp, String ps, String petindex) {
		
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

		logger.info("pageSize :" + pageSize);
		logger.info("cpage :" + cpage);
		
		// DAO 데이터 받아오기
		List<Blog> postList = null;

		// mapper 를 통한 인터페이스 연결
		BlogDao blogDao = sqlsession.getMapper(BlogDao.class);

		int totalPostCount = blogDao.getPostCount(petindex, "petindex");
		
		//
		postList = blogDao.getMyPostList(cpage, pageSize, petindex, "petindex");

		// 페이지 크기에 맞춰 페이지 수 구하기
		if (totalPostCount % pageSize == 0) {
			pageCount = totalPostCount / pageSize;
		} else {
			pageCount = (totalPostCount / pageSize) + 1;
		}
		
		map.put("postList", postList);
		map.put("cpage", cpage);
		map.put("pageSize", pageSize);
		map.put("pageCount", pageCount);
		map.put("totalPostCount", totalPostCount);
		
		return map;
	}
	
	// 포스트 좋아요 처리
		public int likePost(Blike blike) {
			
			int result = 0;

			try {

				blikeDao = sqlsession.getMapper(BlikeDao.class);
				result = blikeDao.likePost(blike);

			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			return result;
		}
		
	// 포스트 좋아요 취소 처리
	public int unlikePost(Blike blike) {
		
		int result = 0;

		try {

			blikeDao = sqlsession.getMapper(BlikeDao.class);
			result = blikeDao.unlikePost(blike);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}
	
	// 포스트 좋아요 여부 확인
	public Blike isLikePost(String bindex, String userid) {
		
		Blike blike = null;

		try {

			blikeDao = sqlsession.getMapper(BlikeDao.class);
			blike = blikeDao.isLikePost(Integer.parseInt(bindex), userid);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return blike;
	}
	
}

