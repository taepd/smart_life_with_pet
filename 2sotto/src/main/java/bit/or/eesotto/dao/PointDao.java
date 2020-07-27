package bit.or.eesotto.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import bit.or.eesotto.dto.Message;
import bit.or.eesotto.dto.Pet;
import bit.or.eesotto.dto.Point;
import bit.or.eesotto.dto.Qna;
import bit.or.eesotto.dto.User;


public interface PointDao {
		//뜨쉬
		// 어드민 > 포인트 리스트 조회  ajax
		@Select("select * from point")
		public List<Point> getPointList(); 
		
		// 어드민 > 포인트 카운트  ajax
		@Select("select count(*) count from point")
		public int getPointCount(Point Point);
		//뜨쉬
		
		
		
		// pont > point 리스트 조회 추가
		public List<Point> getUserPointList(int cpage, int pagesize, String USERID);
		// pont > point 리스트 조회 추가
		//point > point 개수 조회 //동적쿼리 적용할 것 
		public int getUserPointCount();
		// point > 내 point 개수 조회
		@Select("select count(*) from POINT where USERID=#{userid}")
		public int getUserPointCount(String USERID);
		public int getUserPointCount(String column, int search);
		
		// Point > 내 글 상세 조회
		@Select("select * from point where ptindex = #{ptindex}")
		public Point getPointDetail(@Param("ptindex") String ptindex);

}
