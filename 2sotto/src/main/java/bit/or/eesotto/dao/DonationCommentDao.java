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
	@Insert("insert into DONATIONCOMMENT (dindex, userid, nick, rplike, dccontent, scstate, rtime, refer, step, depth)"
			+ " values (#{dindex}, #{userid}, #{nick}, 0, #{dccontent}, #{scstate}, now(), "
			+ "(select ifnull(max(refer)+1,0) from DONATIONCOMMENT d),"
			+ "0, 0)")		
	public int writeComment(DonationComment donationcomment);

	// 후원글 > 댓글 수정
	@Insert("update DONATIONCOMMENT set dccontent=#{dccontent} where dcindex=#{dcindex}")		
	public int editComment(DonationComment donationcomment);	
	
	
	// 후원글 > 댓글 리스트 조회  
	@Select("select * from DONATIONCOMMENT where dindex=#{dindex} ORDER BY REFER, STEP")
	public List<DonationComment> getCommentList(String dindex); 
	
	// 후원글 > 특정 댓글 조회  
	@Select("select * from DONATIONCOMMENT where dcindex=#{dcindex}")
	public DonationComment getComment(int dcindex); 
	
	// 후원글 > 댓글 삭제
	@Update("delete from DONATIONCOMMENT where dcindex=#{dcindex}")
	public int deleteComment(DonationComment donationcomment);
	
	// 후원글 > 대댓글 쓰기 
	@Insert("insert into DONATIONCOMMENT (dindex, userid, nick, rplike, dccontent, scstate, rtime, refer, step, depth)"
			+ " values (#{dindex}, #{userid}, #{nick}, 0, #{dccontent}, #{scstate}, now(), "
			+ "#{refer}, (select ifnull(max(step)+1,0)  from DONATIONCOMMENT d where refer=#{refer}), 1)")		
	public int writeRecomment(DonationComment donationcomment);
	
}
