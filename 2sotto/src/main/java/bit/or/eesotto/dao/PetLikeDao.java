package bit.or.eesotto.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import bit.or.eesotto.dto.PetLike;
import bit.or.eesotto.dto.User;


public interface PetLikeDao {

	@Select("select pl.lindex, pl.userid as 'myid', p.userid as 'whosepet', p.petindex, p.petname, p.petimg "
			+ "from petlike pl join pet p "
			+ "on pl.petindex = p.petindex "
			+ "where pl.userid = #{userid} "
			+ "order by lindex")
	public List<PetLike> getPetLike(@Param("userid") String userid);
	
}
