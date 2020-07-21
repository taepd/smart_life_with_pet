package bit.or.eesotto.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import bit.or.eesotto.dto.Pet;
import bit.or.eesotto.dto.User;
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
		
		// 반려동물 사진만 가져오기
		@Select("select petname, petimg from pet where userid = #{userid}")
		public List<Pet> getPetPicture(@Param("userid") String userid);

		// 어드민 > 동물 리스트 조회  ajax
		@Select("select * from pet")
		public List<Pet> getPetList(@Param("userid") String userid); 
	
}
