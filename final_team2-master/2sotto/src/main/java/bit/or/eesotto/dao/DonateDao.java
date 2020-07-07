package bit.or.eesotto.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.context.annotation.Role;

import bit.or.eesotto.dto.Donate;
import bit.or.eesotto.dto.User;





public interface DonateDao {

	//후원글 입력
	
	@Insert("insert into donate (title,content,dobject,rtime)" +
    "values(#{title},#{content},#{dobject},now()) ")
	public int donationWrite(Donate donate);
	
	//게시물 개수
	public int getDonationCount(String field, String query) throws ClassNotFoundException, SQLException;
	
	//전체 게시물
	/*
	 * @Select("SELECT dindex, title, dobject, rtime FROM (SELECT ROWNUM NUM, N.* FROM (SELECT * FROM DONATE WHERE ${param2} ORDER BY rtime DESC) N) WHERE RNUM BETWEEN 1+(${param1}-1)*5 AND 5+(${param1}-1)*5"
	 * )
	 */
	
	 
	
	/*
	 * @Select("SELECT * FROM DONATE WHERE DEL_CHK='N' ORDER BY IDX DESC LIMIT #{pageStart},#{perPageNum}"
	 * )
	 */
	/*
	 * @Select("SELECT E.*" +
	 * "FROM (SELECT @ROWNUM := @ROWNUM +1 ROWNUM, E.* FROM DONATE E WHERE (@rownum:=0)=0) E"
	 * +
	 * "WHERE ROWNUM BETWEEN ${param1}${param2}-(${param2}-1) AND ${param1}${param2};"
	 * )
	 */
	/*
	 * @Select("SET @ROWNUM:= 0;" +
	 * "SELECT * FROM (SELECT @ROWNUM := @ROWNUM +1 ROWNUM, D.* FROM DONATE D) S WHERE ROWNUM "
	 * + "BETWEEN ${param1}${param2}-(${param2}-1) AND ${param1}${param2}")
	 */
	public List<Donate> getDonationList(int page, String field, String query) throws ClassNotFoundException, SQLException;
	
	//게시물 삭제
	public int deleteDonation(String seq) throws ClassNotFoundException, SQLException;
		
	//게시물 수정
	public int updateDonation(Donate donate) throws ClassNotFoundException, SQLException;
		
	//게시물 상세
	/*
	 * @Select("SELECT dindex, title, content, dobject, rtime, FROM DONATE WHERE dindex=#{dindex}"
	 * )
	 *///<!-- #을 쓴 이유는 타입을 인정하기 위해서 / 파라미터 하나일 땐 파라미터 이름 그냥 쓰나봄...? -->
	public Donate getDonationDetail(String dindex) throws ClassNotFoundException, SQLException;
}
