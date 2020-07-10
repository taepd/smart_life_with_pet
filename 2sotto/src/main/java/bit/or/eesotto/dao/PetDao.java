package bit.or.eesotto.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import bit.or.eesotto.dto.Pet;
import lombok.Delegate;


public interface PetDao {
	
	

		// 반려동물 등록
		@Insert("insert into pet"
				+ "(petindex, userid, mcategory, scategory, petname, sex, age, size, weight, hlength, nstate, petimg, memo)"
				+ " values( #{petindex}, #{userid}, #{mcategory}, #{scategory}, #{petname}, #{sex}, #{age}, #{size}, #{weight}, "
				+ "#{hlength}, #{nstate}, #{petimg}, #{memo} )")
		public int newPet(Pet pet);

		// 반려동물 정보 가져오기
		@Select("select * from pet where userid = #{userid}")
		public List<Pet> getPetInfo(@Param("userid") String userid);
		
		// 반려동물 수정할 정보 가져오기
		@Select("select * from pet where petindex = #{petindex}")
		public Pet editPetInfo(@Param("petindex") int petindex);
		
		// 반려동물 정보 수정
		@Update("update pet set petname=#{petname}, mcategory=#{mcategory}, scategory=#{scategory}, sex=#{sex}, age=#{age}, "
				+ "size=#{size}, weight=#{weight}, hlength=#{hlength}, nstate=#{nstate}, petimg=#{petimg}, memo=#{memo} "
				+ "where petindex=#{petindex}")
		public int updatePetInfo(Pet pet);
		
		// 반려동물 삭제
		@Delete("delete from pet where petindex = #{petindex}")
		public int deletePet(@Param("petindex") int petindex);
	


	
}
