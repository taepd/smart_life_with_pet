package bit.or.eesotto.dao;

import java.util.List;

import org.apache.ibatis.annotations.*;

import bit.or.eesotto.dto.PetLike;
import bit.or.eesotto.dto.User;


public interface PetLikeDao {

	@Select("select pl.lindex, pl.userid as 'myid', p.userid as 'whosepet', p.petindex, p.petname, p.petimg "
			+ "from PETLIKE pl join PET p "
			+ "on pl.petindex = p.petindex "
			+ "where pl.userid = #{userid} "
			+ "order by lindex")
	public List<PetLike> getPetLike(@Param("userid") String userid);
	
	// 반려동물 좋아요(팔로우) 등록
	@Insert("insert into PETLIKE (petindex, userid) values( #{petindex}, #{userid})")
	public int followPet(PetLike petlike);
	
	// 반려동물 좋아요(언팔로우) 취소
	@Delete("delete from PETLIKE where petindex=#{petindex} and userid=#{userid}")
	public int unFollowPet(PetLike petlike);
	
	// 반려동물 좋아요(팔로우) 여부
	@Select("select * from PETLIKE where petindex=#{petindex} and userid=#{userid}")
	public PetLike isFollowPet( @Param("petindex") int petindex, @Param("userid") String userid);
	
}
