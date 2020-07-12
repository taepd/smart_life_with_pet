package bit.or.eesotto.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import bit.or.eesotto.dto.Schedule;
import bit.or.eesotto.dto.User;


public interface ScheduleDao {

	//일정 등록
	@Insert("insert into schedule"
			+ "(sindex, petindex, userid, title, content, is_complete, begin_date, end_date, cycle, adncdnoti) "
			+ "values( #{sindex}, 4, 'a', #{title}, #{content}, #{is_complete}, now(), "
			+ "now(), now(), #{adncdnoti} )")
	public int newSchedule(Schedule schedule);
	
	//일정 불러오기
	@Select("select * from schedule where userid = #{userid}")
	public List<Schedule> getSchedule(@Param("userid") String userid);
	
}
