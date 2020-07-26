package bit.or.eesotto.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import bit.or.eesotto.dto.Blog;
import bit.or.eesotto.dto.Qna;
import bit.or.eesotto.dto.User;


public interface QnaDao {
	
	// Qna > Qna보내기  
			@Insert("insert into qna (userid, title, qatime, count, scstate, content, replyContent, filename, awstate)"
					+ " values ( #{userid}, #{title}, now(), 0, 0, #{content}, #{replyContent}, 0, 0)" )
			public int writeQna(Qna qna);
			
			// Qna > Qna 리스트 조회  
			public List<Qna> getQnaList(int cpage, int pagesize, String USERID); 

			
			// Qna > Qna 개수 조회 //동적쿼리 적용할 것 
			public int getQnaCount();
			
			// Qna > 내 Qna 개수 조회
			@Select("select count(*) from QNA where USERID=#{userid}")
			public int getQnaCount(String USERID);
			public int getQnaCount(String column, int search);

			// Qna > 내 글 상세 조회
			@Select("select * from qna where qaindex = #{qaindex}")
			public Qna getPost(@Param("qaindex") String qaindex);
			
			// Qna > 글 수정 
			@Update("update QNA set title=#{title}, content=#{content} where qaindex=#{qaindex}")
			public int editPost(Qna post);
			
			// Qna > 글답글 수정 
			@Update("update QNA set title=#{title}, replyContent=#{replyContent} where qaindex=#{qaindex}")
			public int editReplyPost(Qna post);
			
			// Qna > 글 삭제
			@Update("delete from QNA where qaindex=#{qaindex}")
			public int deletePost(Qna post);
			
			
			
	
}
