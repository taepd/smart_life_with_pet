package bit.or.eesotto.dao;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import bit.or.eesotto.dto.*;
import lombok.Delegate;


public interface PetDao {
	
	

		// 반려동물 등록
		@Insert("insert into pet"
				+ "(petindex, userid, mcategory, scategory, petname, sex, age, size, weight, hlength, nstate, petimg, memo)"
				+ " values( #{petindex}, #{userid}, #{mcategory}, #{scategory}, #{petname}, #{sex}, #{age}, #{size}, #{weight}, "
				+ "#{hlength}, #{nstate}, #{petimg}, #{memo} )")
		public int newPet(Pet pet);

		// 반려동물 정보 가져오기
		//@Select("select * from pet where userid = #{userid}")
		@Select("select p.*, s.SCANAME as scaname, m.MCANAME as mcaname " 
				+ "from pet p "
				+ "left outer join subcategory s on p.SCATEGORY = s.SCATEGORY "
			    + "left outer join maincategory m on p.MCATEGORY = m.MCATEGORY "
			    + "where userid = #{userid}")
		public List<Pet> getPetInfo(@Param("userid") String userid);
		
		// 반려동물 수정할 정보 가져오기
		@Select("select p.*, s.SCANAME as scaname, m.MCANAME as mcaname " 
				+ "from pet p "
				+ "left outer join subcategory s on p.SCATEGORY = s.SCATEGORY "
			    + "left outer join maincategory m on p.MCATEGORY = m.MCATEGORY "
			    + "where petindex = #{petindex}")
		public Pet editPetInfo(@Param("petindex") int petindex);
		
		// 반려동물 정보 수정
		@Update("update pet set petname=#{petname}, mcategory=#{mcategory}, scategory=#{scategory}, sex=#{sex}, age=#{age}, "
				+ "size=#{size}, weight=#{weight}, hlength=#{hlength}, nstate=#{nstate}, petimg=#{petimg}, memo=#{memo} "
				+ "where petindex=#{petindex}")
		public int updatePetInfo(Pet pet);
		
		// 반려동물 삭제
		@Delete("delete from pet where petindex = #{petindex}")
		public int deletePet(@Param("petindex") int petindex);

		// 메인에 뿌릴 이름 정보만 가져오기
		@Select("select petname from pet where userid = #{userid}")
		public List<String> getSimplePetInfo(@Param("userid") String userid);
		
		// 반려동물 사진만 가져오기 >> 추천 동물 로직에도 사용하기 위해 전체 정보 가져오는 것으로 임시 변경
		@Select("select * from pet where userid = #{userid}")
		public List<Pet> getPetPicture(@Param("userid") String userid);


		// 어드민 > 동물 리스트 조회  ajax
		@Select("select * from pet")
		public List<Pet> getPetList(@Param("userid") String userid); 

		// 반려동물 한 마리 정보 가져오기
		//@Select("select * from pet where userid = #{userid}")
		@Select("select p.*, s.SCANAME as scaname, m.MCANAME as mcaname, u.nick as nick " 
				+ "from pet p "
				+ "left outer join user u on p.userid = u.userid "
				+ "left outer join subcategory s on p.SCATEGORY = s.SCATEGORY "
			    + "left outer join maincategory m on p.MCATEGORY = m.MCATEGORY "
			    + "where petindex = #{petindex}")
		public Pet getPet(@Param("petindex") int petindex);
		
		// 메인> 추천 반려동물 (품종) 3마리 추천
		@Select("select * from pet where scategory = #{param2} and userid not in (#{param1})order by rand() limit 3")
		public List<Pet> getSameCategoryPet(String userid, String scategory);
		
		// 메인> 추천 반려동물 (비슷한 나이(개월)) 3마리 추천
		@Select("select * from pet where (age between #{param2}-12 and #{param2}+12) and userid not in (#{param1})order by rand() limit 3")
		public List<Pet> getSimilarAgePet(String userid, int age);
		
		// 메인> 추천 반려동물 (가까운 거리) 3마리 추천
		@Select("select * from pet where userid not in (#{param1})order by rand() limit 3")
		/*
		 * @Select("select p.* from pet p join user u on p.userid = u.userid " +
		 * " where round((google_distance(u.lat,u.lon, 37.4992037464339, 127.06309937724)),0) < 5 "
		 * + " and p.userid not in (#{userid})order by rand() limit 3")
		 */
		public List<Pet> getNearPet(String userid);
		
		
		// 메인> 동물 대분류별 수 조회
		@Select("select (select count(*) from pet where MCATEGORY = 1) 개, (select count(*) from pet where MCATEGORY = 2) 고양이 from dual")
		public List<Map<String, Object>> getPetKindCount();

		
		
		
	
}
