package bit.or.eesotto.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import bit.or.eesotto.dto.Post;



public interface PostDao {

	// 블로그 > 글쓰기   //date_format(now(),'%Y-%m-%d %H:%i')
	@Insert("insert into post (petindex, userid, blike, title, content, rtime, delstate, count, pimg)"
			+ " values (#{petindex}, #{userid}, 0, #{title}, #{content}, now(), 0, 0,  #{pimg})")
	public int writePost(Post post);
	
	// 블로그 > 포스트 리스트 조회  
	public List<Post> getPostList(int cpage, int pagesize, String userid); 
	
	// 블로그 > 포스팅 개수 조회 //동적쿼리 적용할 것 
	public int getPostCount();
	
	@Select("select count(*) from post where userid=#{userid}")
	public int getPostCount(String userid);
	
	public int getPostCount(String column, int search);
	
}
