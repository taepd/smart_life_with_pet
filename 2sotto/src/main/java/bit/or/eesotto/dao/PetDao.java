package bit.or.eesotto.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import bit.or.eesotto.dto.User;
import bit.or.eesotto.dto.Pet;


public interface PetDao {
		// 댕댕이 정보 가져오기
		@Select("select * from pet where userid = #{userid}")
		public Pet getPetInfo(@Param("userid") String userid);

		// 반려동물 등록
		@Insert("insert into pet (mcategory, scategory, petname, sex, age, size, weight, "
				+ "hlength, nstate, petimg, memo)"
				+ " select (#{mcategory}, #{scategory}, #{petname}, #{sex}, #{age}, "
				+ "#{size}, #{weight}, #{hlength}, #{nstate}, #{petimg}, #{memo}) "
				+ "from dual where exists (select userid from user where userid = #{userid}")
		public int newPet(Pet pet, String userid);

		// 수정
		@Update("update pet set scategory = #{scategory}, age = #{age}, size = #{size}, "
				+ "weight = #{weight}, nstate = #{nstate}, petimg = #{petimg}, memo = #{memo}"
				+ "	where userid=#{userid}")
		public int editPet(Pet pet, String userid);	

	
}
