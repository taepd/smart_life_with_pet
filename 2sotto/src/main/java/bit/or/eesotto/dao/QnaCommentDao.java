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
	@Insert("insert into QNACOMMENT (qaindex, userid, qnalike, content, scstate, rtime, refer, step, depth)"
			+ " values (#{qaindex}, #{userid}, 0, #{content}, #{scstate}, now(), "
			+ "(select ifnull(max(refer)+1,0) from qnacomment b),"
			+ "0, 0)")		
	public int writeComment(QnaComment qnacomment);

	// Qna > 댓글 수정
	@Insert("update QNACOMMENT set content=#{content} where qnaindex=#{qnaindex}")		
	public int editComment(QnaComment qnacomment);	
	
	// Qna > 댓글 리스트 조회  
	@Select("select * from QNACOMMENT where qaindex=#{qaindex}")
	public List<QnaComment> getCommentList(String qaindex); 
	
	// Qna > 특정 댓글 조회  
	@Select("select * from QNACOMMENT where qnaindex=#{qnaindex}")
	public QnaComment getComment(int qnaindex); 
	
	// Qna > 댓글 삭제
	@Update("delete from QNACOMMENT where qnaindex=#{qnaindex}")
	public int deleteComment(QnaComment comment);
	
}
