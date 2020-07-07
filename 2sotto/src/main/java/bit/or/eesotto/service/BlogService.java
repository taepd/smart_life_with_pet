package bit.or.eesotto.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import bit.or.eesotto.dao.PostDao;
import bit.or.eesotto.dao.UserDao;
import bit.or.eesotto.dto.Post;
import bit.or.eesotto.dto.User;

@Service
public class BlogService {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	PostDao postDao;
		

	//일반 회원가입 
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

}
