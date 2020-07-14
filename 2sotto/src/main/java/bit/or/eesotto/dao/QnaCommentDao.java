package bit.or.eesotto.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import bit.or.eesotto.dto.Blog;
import bit.or.eesotto.dto.BlogComment;
import bit.or.eesotto.dto.QnaComment;
import bit.or.eesotto.dto.User;



public interface QnaCommentDao {

	// Qna > 댓글 쓰기 
	@Insert("insert into qnacomment (qaindex, userid, qnalike, content, scstate, rtime, refer, step, depth)"
			+ " values (#{qaindex}, #{userid}, 0, #{content}, #{scstate}, now(), "
			+ "(select ifnull(max(refer)+1,0) from qnacomment b),"
			+ "0, 0)")		
//			+ "(select ifnull(max(step)+1,0)  from blogcomment b where refer=0),"
//			+ "(select ifnull(((max(depth)+1)/(max(depth)+1)),0) from blogcomment b where refer=0))")
	public int writeComment(QnaComment qnacomment);

	// Qna > 댓글 수정
	@Insert("update qnacomment set content=#{content} where qnaindex=#{qnaindex}")		
//			+ "(select ifnull(max(step)+1,0)  from blogcomment b where refer=0),"
//			+ "(select ifnull(((max(depth)+1)/(max(depth)+1)),0) from blogcomment b where refer=0))")
	public int editComment(QnaComment qnacomment);	

	
	
	// Qna > 댓글 리스트 조회  
	@Select("select * from qnacomment where qaindex=#{qaindex}")
	public List<QnaComment> getCommentList(String qaindex); 
	
	// Qna > 특정 댓글 조회  
	@Select("select * from qnacomment where qnaindex=#{qnaindex}")
	public QnaComment getComment(int qnaindex); 
	
	// Qna > 댓글 삭제
	@Update("delete from qnacomment where qnaindex=#{qnaindex}")
	public int deleteComment(QnaComment comment);
//	
//	// Qna > 포스팅 개수 조회 //동적쿼리 적용할 것 
//	public int getPostCount();
//	
//	// Qna > 내 포스팅 개수 조회
//	@Select("select count(*) from blog where userid=#{userid}")
//	public int getPostCount(String userid);
//	
//	public int getPostCount(String column, int search);
//	
//	// Qna > 내 글 상세 조회
//	@Select("select * from blog where bindex = #{bindex}")
//	public Blog getPost(@Param("bindex") String bindex);
//	
//	// Qna > 글 수정 
//	@Update("update blog set title=#{title}, content=#{content} where bindex=#{bindex}")
//	public int editPost(Blog post);
//	
//	// Qna > 글 삭제
//	@Update("delete from blog where bindex=#{bindex}")
//	public int deletePost(Blog post);
	
}
