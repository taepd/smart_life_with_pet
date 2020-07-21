package bit.or.eesotto.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import bit.or.eesotto.dto.Blog;
import bit.or.eesotto.dto.BlogComment;
import bit.or.eesotto.dto.DonationComment;
import bit.or.eesotto.dto.User;



public interface DonationCommentDao {

	// 후원글 > 댓글 쓰기 
	@Insert("insert into donationcomment (dindex, userid, nick, rplike, dccontent, scstate, rtime, refer, step, depth)"
			+ " values (#{dindex}, #{userid}, #{nick}, 0, #{dccontent}, #{scstate}, now(), "
			+ "(select ifnull(max(refer)+1,0) from donationcomment d),"
			+ "0, 0)")		
//			+ "(select ifnull(max(step)+1,0)  from blogcomment b where refer=0),"
//			+ "(select ifnull(((max(depth)+1)/(max(depth)+1)),0) from blogcomment b where refer=0))")
	public int writeComment(DonationComment donationcomment);

	// 후원글 > 댓글 수정
	@Insert("update donationcomment set dccontent=#{dccontent} where dcindex=#{dcindex}")		
//			+ "(select ifnull(max(step)+1,0)  from blogcomment b where refer=0),"
//			+ "(select ifnull(((max(depth)+1)/(max(depth)+1)),0) from blogcomment b where refer=0))")
	public int editComment(DonationComment donationcomment);	
	
	
	// 후원글 > 댓글 리스트 조회  
	@Select("select * from donationcomment where dindex=#{dindex} ORDER BY REFER, STEP")
	public List<DonationComment> getCommentList(String dindex); 
	
	// 후원글 > 특정 댓글 조회  
	@Select("select * from donationcomment where dcindex=#{dcindex}")
	public DonationComment getComment(int dcindex); 
	
	// 후원글 > 댓글 삭제
	@Update("delete from donationcomment where dcindex=#{dcindex}")
	public int deleteComment(DonationComment donationcomment);
	
	// 후원글 > 대댓글 쓰기 
	@Insert("insert into donationcomment (dindex, userid, nick, rplike, dccontent, scstate, rtime, refer, step, depth)"
			+ " values (#{dindex}, #{userid}, #{nick}, 0, #{dccontent}, #{scstate}, now(), "
			+ "#{refer}, (select ifnull(max(step)+1,0)  from donationcomment d where refer=#{refer}), 1)")		
//			+ "(select ifnull(((max(depth)+1)/(max(depth)+1)),0) from blogcomment b where refer=0))")
	public int writeRecomment(DonationComment donationcomment);
	
	
	
	
	
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
