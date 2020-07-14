package bit.or.eesotto.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import bit.or.eesotto.dto.Blog;
import bit.or.eesotto.dto.BlogComment;
import bit.or.eesotto.dto.User;



public interface BlogCommentDao {

	// 블로그 > 댓글 쓰기 
	@Insert("insert into blogcomment (bindex, userid, bclike, content, scstate, rtime, refer, step, depth)"
			+ " values (#{bindex}, #{userid}, 0, #{content}, #{scstate}, now(), "
			+ "(select ifnull(max(refer)+1,0) from blogcomment b),"
			+ "0, 0)")		
//			+ "(select ifnull(max(step)+1,0)  from blogcomment b where refer=0),"
//			+ "(select ifnull(((max(depth)+1)/(max(depth)+1)),0) from blogcomment b where refer=0))")
	public int writeComment(BlogComment blogcomment);

	// 블로그 > 댓글 수정
	@Insert("update blogcomment set content=#{content} where bcindex=#{bcindex}")		
//			+ "(select ifnull(max(step)+1,0)  from blogcomment b where refer=0),"
//			+ "(select ifnull(((max(depth)+1)/(max(depth)+1)),0) from blogcomment b where refer=0))")
	public int editComment(BlogComment blogcomment);	
	
	
	// 블로그 > 댓글 리스트 조회  
	@Select("select * from blogcomment where bindex=#{bindex} ORDER BY REFER, STEP")
	public List<BlogComment> getCommentList(String bindex); 
	
	// 블로그 > 특정 댓글 조회  
	@Select("select * from blogcomment where bcindex=#{bcindex}")
	public BlogComment getComment(int bcindex); 
	
	// 블로그 > 댓글 삭제
	@Update("delete from blogcomment where bcindex=#{bcindex}")
	public int deleteComment(BlogComment comment);
	
	// 블로그 > 대댓글 쓰기 
	@Insert("insert into blogcomment (bindex, userid, bclike, content, scstate, rtime, refer, step, depth)"
			+ " values (#{bindex}, #{userid}, 0, #{content}, #{scstate}, now(), "
			+ "#{refer}, (select ifnull(max(step)+1,0)  from blogcomment b where refer=#{refer}), 1)")		
//			+ "(select ifnull(((max(depth)+1)/(max(depth)+1)),0) from blogcomment b where refer=0))")
	public int writeRecomment(BlogComment blogcomment);
	
	
	
	
	
//	
//	// 블로그 > 포스팅 개수 조회 //동적쿼리 적용할 것 
//	public int getPostCount();
//	
//	// 블로그 > 내 포스팅 개수 조회
//	@Select("select count(*) from blog where userid=#{userid}")
//	public int getPostCount(String userid);
//	
//	public int getPostCount(String column, int search);
//	
//	// 블로그 > 내 글 상세 조회
//	@Select("select * from blog where bindex = #{bindex}")
//	public Blog getPost(@Param("bindex") String bindex);
//	
//	// 블로그 > 글 수정 
//	@Update("update blog set title=#{title}, content=#{content} where bindex=#{bindex}")
//	public int editPost(Blog post);
//	
//	// 블로그 > 글 삭제
//	@Update("delete from blog where bindex=#{bindex}")
//	public int deletePost(Blog post);
	
}
