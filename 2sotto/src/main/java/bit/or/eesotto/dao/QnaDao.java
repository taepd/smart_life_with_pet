package bit.or.eesotto.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;


import bit.or.eesotto.dto.Qna;
import bit.or.eesotto.dto.User;


public interface QnaDao {
	
	// 쪽지 > 쪽지보내기  
			@Insert("insert into qna (userid, title, qatime, count, scstate, content, filename, awstate)"
					+ " values ( #{userid}, #{title}, 0, 0, 0, #{content}, 0, 0)" )
			public int writeQna(Qna qna);
			
			// 쪽지 > 쪽지 리스트 조회  
			public List<Qna> getQnaList(int cpage, int pagesize, String USERID); 
			
			// 쪽지 > 쪽지 리스트 조회 추가
			public List<Qna> getQnaSendList(int cpage, int pagesize, String USERID);
			
			// 쪽지 > 쪽지 개수 조회 //동적쿼리 적용할 것 
			public int getQnaCount();
			public int getQnaCount(String USERID);
			public int getQnaCount(String column, int search);

	
}
