package bit.or.eesotto.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import bit.or.eesotto.dto.Blog;
import bit.or.eesotto.dto.User;



public interface BlogDao {

	// 블로그 > 글쓰기   //date_format(now(),'%Y-%m-%d %H:%i')
	@Insert("insert into blog (petindex, userid, blike, title, content, rtime, delstate, count, pimg, nick)"
			+ " values (#{petindex}, #{userid}, 0, #{title}, #{content}, now(), 0, 0,  #{pimg}, #{nick})")
	public int writePost(Blog blog);
	
	// 블로그 > 내 포스트 리스트 조회  
	public List<Blog> getMyPostList(int cpage, int pagesize, String userid); 
	
	// 블로그 > 모두의 포스트 리스트 조회
	public List<Blog> getPostList(int cpage, int pagesize, String userid); 

		
//	// 블로그 > 모두의 포스팅 개수 조회
//	public int getPostCount();
	
	// 블로그 > 포스팅 개수 조회
	public int getPostCount(@Param("userid") String userid);
	
	public int getPostCount(String column, int search);
	
	// 블로그 > 글 상세 조회
	@Select("select * from blog where bindex = #{bindex}")
	public Blog getPost(@Param("bindex") String bindex);
	
	// 블로그> 글 조회수 증가 
	@Update("update blog set count= count+1 where bindex=${bindex}")
	public int updateCount(@Param("bindex") String bindex);
	
	// 블로그 > 글 수정 
	@Update("update blog set title=#{title}, content=#{content} where bindex=#{bindex}")
	public int editPost(Blog post);
	
	// 블로그 > 글 삭제
	@Update("delete from blog where bindex=#{bindex}")
	public int deletePost(Blog post);
	
}
