package bit.or.eesotto.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import bit.or.eesotto.dto.Blog;
import bit.or.eesotto.dto.Donate;
import bit.or.eesotto.dto.Qna;
import bit.or.eesotto.dto.User;


public interface QnaDao {
	
	// Qna > Qna보내기  
			@Insert("insert into qna (userid, title, qatime, count, scstate, content, replyContent, filename, awstate)"
					+ " values ( #{userid}, #{title}, now(), 0, 0, #{content}, #{replyContent}, 0, 0)" )
			public int writeQna(Qna qna);
			
			// Qna > Qna 리스트 조회  
			public List<Qna> getQnaList(int cpage, int pagesize); 

			
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
			
			//알람관련 Dao추가
			//////알림 관련 dao/////////////////////////////////////////////////////////////////////////
			
			//사용자가 어드민한테 문의했으나 아직 읽지 않은 모든 글 카운트
			public int getCountAdminNotRead()throws ClassNotFoundException, SQLException;	
			
			//어드민이 알림을 읽거나 문의게시판 관리 페이지 들어가면 개수 줄어들게 하기 위해 업데이트
			public int updateAdminRead(int qaindex)throws ClassNotFoundException, SQLException;	
			
			//어드민이 답변을 했을 경우 사용자에게 알림이 가기 위해 상태 업데이트
			//public int updateQnaRep(int qna_brd_ref) throws ClassNotFoundException, SQLException;	

			//사용자 입장에서 답변이 왔지만 읽지 않은 문의글 개수 카운트 (참조 수 + 자기 이메일 아닌거로 해야할듯)
			public int getCountUserNotRead(String userid) throws ClassNotFoundException, SQLException;	

			//사용자가 답변을 읽었을 경우 상태 업데이트
			public int updateQnaUserRead(String userid) throws ClassNotFoundException, SQLException;
			//알람관련 Dao추가
			
			// 어드민 > Qna 리스트 조회  ajax
			@Select("select * from qna")
			public List<Qna> getAdminQnaList(); 
			
			
	
}
