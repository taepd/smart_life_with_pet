package bit.or.eesotto.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import bit.or.eesotto.dto.Schedule;
import bit.or.eesotto.dto.User;


public interface ScheduleDao {

	//일정 등록 (지금은 임의값 부여)
	@Insert("insert into schedule"
			+ "(sindex, petindex, userid, title, content, is_complete, begin_date, end_date, cycle, adncdnoti) "
			+ "values( #{sindex}, 4, 'a', #{title}, #{content}, #{is_complete}, #{begin_date}, "
			+ "#{end_date}, now(), #{adncdnoti} )")
	public int newSchedule(Schedule schedule);
	
	//일정 불러오기
	@Select("select sindex, petindex, userid, title, content, is_complete, begin_date, end_date, cycle, adncdnoti "
			+ "from schedule where userid = #{userid}")
	public List<Schedule> getSchedule(@Param("userid") String userid);
	
	//일정 업데이트
	@Update("update schedule set title=#{title}, content=#{content}, is_complete=#{is_complete}, "
			+ "begin_date=#{begin_date}, end_date=#{end_date}, cycle=now(), adncdnoti=#{adncdnoti} "
			+ "where sindex=#{sindex}")
	public int updateSchedule(Schedule schedule);
	
	//일정 삭제
	@Delete("delete from schedule where sindex=#{sindex}")
	public int deleteSchedule(@Param("sindex") String sindex);
	
	
}
