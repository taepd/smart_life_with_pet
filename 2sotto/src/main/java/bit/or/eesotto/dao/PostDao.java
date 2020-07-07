package bit.or.eesotto.dao;

import org.apache.ibatis.annotations.Insert;

import bit.or.eesotto.dto.Post;



public interface PostDao {

	// 블로그> 글쓰기  --petindex 입력 수정해야 함
	@Insert("insert into post (petindex, userid, blike, title, content, rtime, delstate, count, pimg)"
			+ " values (#{petindex}, #{userid}, 0, #{title}, #{content}, now(), 0, 0,  #{pimg})")
	public int writePost(Post post);

	
}
