package bit.or.eesotto.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import bit.or.eesotto.dto.Message;
import bit.or.eesotto.dto.User;


public interface MessageDao {
	
		// 쪽지 > 쪽지보내기  
		@Insert("insert into message (ruserid, suserid, content, sendtime, readtime, readstate)"
				+ " values ( #{ruserid}, #{suserid}, #{content}, now(), now(), 0)" )
		public int writeMessage(Message message);
		
		// 쪽지 > 쪽지 리스트 조회  
		public List<Message> getMessageList(int cpage, int pagesize, String SUSERID); 
		
		// 쪽지 > 쪽지 리스트 조회 추가
		public List<Message> getMessageSendList(int cpage, int pagesize, String RUSERID);
		
		// 쪽지 > 쪽지 개수 조회 //동적쿼리 적용할 것 
		public int getMessageCount();
		public int getMessageCount(String SUSERID);
		public int getMessageCount(String column, int search);
		
	}
