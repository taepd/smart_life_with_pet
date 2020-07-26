package bit.or.eesotto.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import bit.or.eesotto.dto.Pet;
import bit.or.eesotto.dto.Point;
import bit.or.eesotto.dto.User;


public interface PointDao {

		// 어드민 > 포인트 리스트 조회  ajax
		@Select("select * from point")
		public List<Point> getPointList(); 
		
		// 어드민 > 포인트 카운트  ajax
		@Select("select count(*) count from point")
		public int getPointCount(Point Point);
	
}
