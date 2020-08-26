package bit.or.eesotto.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;

import bit.or.eesotto.dto.*;


public interface BlikeDao {

	/*
	 * @Select("select pl.lindex, pl.userid as 'myid', p.userid as 'whosepet', p.petindex, p.petname, p.petimg "
	 * + "from petlike pl join pet p " + "on pl.petindex = p.petindex " +
	 * "where pl.userid = #{userid} " + "order by lindex") public List<BLike>
	 * getBLike(@Param("userid") String userid);
	 */
	
	// 포스트 좋아요 등록  
	@Insert("insert into BLIKE (bindex, userid) values( #{bindex}, #{userid})")
	public int likePost(Blike blike);
	
	// 포스트 좋아요 취소
	@Delete("delete from BLIKE where bindex=#{bindex} and userid=#{userid}")
	public int unlikePost(Blike blike);
	
	// 반려동물 좋아요(팔로우) 여부
	@Select("select * from BLIKE where bindex=#{bindex} and userid=#{userid}")
	public Blike isLikePost(@Param("bindex") int bindex, @Param("userid") String userid);
}
