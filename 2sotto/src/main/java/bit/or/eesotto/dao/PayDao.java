package bit.or.eesotto.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import bit.or.eesotto.dto.Blog;
import bit.or.eesotto.dto.User;


public interface PayDao {
	// USER테이블 point 입력
	/*
	 * @Insert("insert into user (userid, point)" + " values (#{userid}, #{point})")
	 */
		@Update("update user set point=#{point} where userid=#{userid}")
		public int payInput(User user);
	
}
