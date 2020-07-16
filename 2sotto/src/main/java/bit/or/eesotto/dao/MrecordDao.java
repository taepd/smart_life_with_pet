package bit.or.eesotto.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import bit.or.eesotto.dto.Blog;
import bit.or.eesotto.dto.MainCategory;
import bit.or.eesotto.dto.Mrecord;

import bit.or.eesotto.dto.Pet;
import bit.or.eesotto.dto.User;


public interface MrecordDao {
			// 병원이용기록 등록
			@Insert("insert into mrecord(userid, petindex, hname, vdate, vreason)"
					+ "values (#{userid}, #{petindex}, #{hname}, #{vdate}, #{vreason})")
			public int medicalRegister(Mrecord mrecord);

			// 병원이용기록 리스트로  가져오기
			/*
			 * @Select("SET @ROWNUM:= 0;" +
			 * "SELECT * FROM (SELECT @ROWNUM := @ROWNUM +1 ROWNUM, M.*, p.petname FROM" +
			 * "MRECORD M join PET P ON M.USERID = P.USERID, (SELECT @ROWNUM:=0) r where m.userid=#{param3}) S WHERE ROWNUM"
			 * +
			 * "BETWEEN ${param1}${param2}-(${param2}-1) AND ${param1}${param2}")//1*5-(5-1)
			 * AND 1*5
			 */	
			
			//전체 병원기록 리스트 가져오기
			public List<Mrecord> getMrecordList(int cpage, int pageSize, String userid);
			
			//PETNAME만 가져오기
			/*
			 * @Select("select m.*, p.PETNAME as petname" + "from mrecord m " +
			 * "left outer join pet p on m.PETNAME = P.PETNAME " +
			 * "where userid = #{userid}")
			 */
			public List<Mrecord> getPetname(@Param("userid") String userid);
			
			//병원기록 수			
			public int getMrecordCount(@Param("userid") String userid);//
			
			// 병원진료  상세 조회
			@Select("select * from mrecord where mindex = #{mindex}")
			public Mrecord getMrecordDetail(@Param("mindex") String mindex);
			
			// 병원진료  수정 
			@Update("update mrecord set hname=#{hname}, vdate=#{vdate}, vreason=#{vreason} where mindex=#{mindex}")
			public int editMrecord(Mrecord mrecord);
			
			// 병원진료 글 삭제
			@Delete("delete from mrecord where mindex=#{mindex}")
			public int deleteMrecord(Mrecord mrecord);
			
			/*
			 * //반려동물테이블에서 petname, petindex,
			 * 
			 * @Select("select m.*, p.PETNAME as petname" + "from mrecord m" +
			 * "left outer join pet s on m.petname = p.petname " +
			 * "where userid = #{userid}") public List<Mrecord> getPetName();
			 */
	
}
