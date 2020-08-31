package bit.or.eesotto.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.context.annotation.Role;

import bit.or.eesotto.dto.Donation;
import bit.or.eesotto.dto.DonationRecord;
import bit.or.eesotto.dto.Pay;
import bit.or.eesotto.dto.Point;
import bit.or.eesotto.dto.User;





public interface DonationDao {

	//후원글 입력
	
	@Insert("insert into DONATION (title,dobject,content,rtime,gcoll,ccoll,ctime, dstate)" +
    "values(#{title},#{dobject},#{content},now(),#{gcoll},0,#{ctime},'Y')")
	public int write(Donation donate);
	
	//게시물 개수
	public int getDonationCount();
	
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
	
	//검색시 카테고리 설정할때 쓸 dao
	
	
	 //글목록 보기
    public List<Donation> main(int cpage, int pagesize);
    
    //글목록 보기 시간순(오래된 순)
    public List<Donation> mainbydate(int cpage, int pagesize);
	
	//게시물 삭제
	public int delete(Donation donate);
		
	//게시물 수정
	public int update(Donation donate) throws ClassNotFoundException, SQLException;
		
	//게시물 상세
	
	/*
	 * @Select("SELECT dindex, title, content, dobject, rtime, FROM DONATE WHERE dindex=#{dindex}"
	 * )
	 */
	 ///<!-- #을 쓴 이유는 타입을 인정하기 위해서 / 파라미터 하나일 땐 파라미터 이름 그냥 쓰나봄...? -->
	public Donation detail(String dindex) throws ClassNotFoundException, SQLException;
	
	//유저 포인트 차감
	public int minusUserPoint(@Param("dpoint") int dpoint, @Param("dUserid") String dUserid);
	
	//현재 모금 포인트 증가
	public int plusCcollPoint(int dindex, int dpoint);
	
	//기부 완료
	public int completeDonationByColl(int dindex);
	
	//기부테이블에 입력하기
	@Insert("insert into DonationRecord (dindex, userid, dcoll, dtime)"
			+ "values (#{param1}, #{param2}, #{param3}, now())")
	public int donationRecord(int dindex, String userid, int dcoll);
	
	// 어드민 > 후원 리스트 조회  ajax
	@Select("select * from donation order by dindex desc")
	public List<Donation> getDonationList(); 
	
	// 어드민 > 포인트 카운트  ajax
	/*
	 * @Select("select count(*) count from point") public int getPointCount(Point
	 * Point);
	 */
}
