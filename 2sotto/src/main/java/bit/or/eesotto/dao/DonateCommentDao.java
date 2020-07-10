package bit.or.eesotto.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.context.annotation.Role;

import bit.or.eesotto.dto.Donate;
import bit.or.eesotto.dto.DonateComment;
import bit.or.eesotto.dto.User;





public interface DonateCommentDao {
	// 댓글 개수
    public int commentCount() throws Exception;
 
    // 댓글 목록
    public List<DonateComment> commentMain() throws Exception;
 
    // 댓글 작성
    public int commentWrite(DonateComment donateComment) throws Exception;
    
    // 댓글 수정
    public int commentUpdate(DonateComment donateComment) throws Exception;
 
    // 댓글 삭제
    public int commentDelete(int dcindex) throws Exception;



	
}
