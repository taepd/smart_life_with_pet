package bit.or.eesotto.dao;

import java.util.List;

import org.apache.ibatis.annotations.*;

import bit.or.eesotto.dto.PetLike;
import bit.or.eesotto.dto.User;


public interface PetLikeDao {

	@Select("select pl.lindex, pl.userid as 'myid', p.userid as 'whosepet', p.petindex, p.petname, p.petimg "
			+ "from petlike pl join pet p "
			+ "on pl.petindex = p.petindex "
			+ "where pl.userid = #{userid} "
			+ "order by lindex")
	public List<PetLike> getPetLike(@Param("userid") String userid);
	
	// 반려동물 좋아요(팔로우) 등록  //여기 고쳐야 함
	@Insert("insert into petlike (petindex, userid) values( #{petindex}, #{userid})")
	public int followPet(PetLike petlike);
	
	// 반려동물 좋아요(팔로우) 등록  //여기 고쳐야 함
	@Delete("delete from petlike where petindex=#{petindex} and userid=#{userid}")
	public int unFollowPet(PetLike petlike);
	
	// 반려동물 좋아요(팔로우) 여부
	@Select("select * from petlike where petindex=#{petindex} and userid=#{userid}")
	public PetLike isFollowPet( @Param("petindex") int petindex, @Param("userid") String userid);
	
}
