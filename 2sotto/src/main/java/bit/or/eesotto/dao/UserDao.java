package bit.or.eesotto.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import bit.or.eesotto.dto.BlogComment;
import bit.or.eesotto.dto.User;

public interface UserDao {

	
	// 일반 로그인
	@Select("select * from USER where userid = #{userid}")
	public User getUser(@Param("userid") String userid);

	// 보통 회원가입
	@Insert("insert into USER (userid, pwd, nick, loc, cpnumber, enabled, rtime, uimg, lat, lon, snstype, userPoint)"
			+ " values (#{userid}, #{pwd}, #{nick}, #{loc}, #{cpnumber}, 1, now(), #{uimg}, #{lat}, #{lon}, #{snstype}, 0)")
	public int normalJoin(User user);

	// 회원가입 > 아이디 중복체크 ajax
	@Select("select userid from USER where userid = #{userid}")
	public String getUserId(@Param("userid") String userid);

	// 회원가입 > 닉네임 중복체크 ajax
	@Select("select nick from USER where nick = #{nick}")
	public List<String> getNick(@Param("nick") String nick);

	// 회원가입 > 휴대폰 번호 중복체크 ajax
	//@Select("select cpnumber from user where cpnumber = #{cpnumber}")
	//public List<String> getCpnumber(@Param("cpnumber") String cpnumber);

	// 마이페이지 > 회원정보 수정
	@Update("update USER set cpnumber=#{cpnumber}, nick=#{nick}, loc=#{loc}, uimg=#{uimg} where userid=#{userid}")
	public int editUser(User user);

	// 마이페이지 > 회원정보 삭제
	@Update("delete from USER where userid=#{userid}")
	public int deleteUser(String userid);

	// 마이페이지 > 비밀번호 수정
	@Update("update USER set pwd=#{pwd}	where userid = #{userid}")
	public int editPwd(@Param("pwd") String pwd, @Param("userid") String userid);

	// 어드민 > 유저 리스트 조회  ajax
	@Select("select * from USER")
	public List<User> getUserList(@Param("userid") String userid); 
	
	// 어드민 > 유저 카운트  ajax
	@Select("select count(*) count from USER")
	public int getUserCount(User user);
	
	// 어드민 > 일자별 가입자수 차트 조회
	@Select("select (date_format(rtime, '%Y-%m-%d')) 가입일, count(*) '가입자 수' " + 
			"from USER group by 가입일 order by 가입일")
	public List<Map<String, Object>> signUpCountbyDay();
		
	
//	// SNS로그인 (가입한 소셜까지 확인)
//	@Select("select * from users where uEmail = #{uEmail}")
//	public User snsLogin(@Param("uEmail") String uEmail);
//
//	// 자동 로그인 = 로그인 유지
//	@Update("update users set session_key = #{session_key}, session_limit = #{session_limit} where uEmail = #{uEmail}")
//	public void keepLogin(User user);
//
//	// 자동 로그인을위한 세션키 검증
//	@Select("select * from users where session_key = #{cookie_key}")
//	public User checkLoginBefore(@Param("cookie_key") String cookie_key);
//
//	// 가입 이메일 찾기
//	@Select("select uEmail from users where uPhone = #{uPhone}")
//	public User findRegisterEmail(User user);
//
//	// 비밀번호 재설정
//	@Update("update users set uPassword = #{uPassword} where uEmail = #{uEmail}")
//	public int resetPassword(User user);

}
