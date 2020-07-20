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

	//일정 등록
	@Insert("insert into schedule"
			+ "(sindex, petindex, userid, title, content, is_complete, start, end, allday, daysofweek, adncdnoti, color) "
			+ "values( #{sindex}, #{petindex}, #{userid}, #{title}, #{content}, #{is_complete}, #{start}, #{end}, "
			+ "#{allday}, #{daysofweek}, #{adncdnoti}, #{color} )")
	public int newSchedule(Schedule schedule);
	
	//일정 불러오기
	@Select("select sindex, petindex, userid, title, content, is_complete, start, end, allday, daysofweek, adncdnoti, color "
			+ "from schedule where userid = #{userid}")
	public List<Schedule> getSchedule(@Param("userid") String userid);
	
	//일정 업데이트
	@Update("update schedule set title=#{title}, content=#{content}, is_complete=#{is_complete}, "
			+ "start=#{start}, end=#{end}, allday=#{allday}, daysofweek=#{daysofweek}, adncdnoti=#{adncdnoti}, color=#{color} "
			+ "where sindex=#{sindex}")
	public int updateSchedule(Schedule schedule);
	
	//일정 삭제
	@Delete("delete from schedule where sindex=#{sindex}")
	public int deleteSchedule(@Param("sindex") String sindex);
	
	//특정 유저의 특정 동물 스케쥴 가져오기
	@Select("select p.petindex, p.userid, p.petname, p.petimg, s.sindex, s.title, s.start " + 
			"from pet p join schedule s " + 
			"on p.USERID = s.USERID and p.PETINDEX = s.PETINDEX " + 
			"where p.userid = #{userid} and p.petname = #{petname} " + 
			"order by start")
	public List<Schedule> getMyPetSchedule(@Param("userid") String userid, @Param("petname") String petname);
	
}
