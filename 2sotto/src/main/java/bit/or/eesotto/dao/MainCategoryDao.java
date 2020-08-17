package bit.or.eesotto.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import bit.or.eesotto.dto.MainCategory;
import bit.or.eesotto.dto.User;


public interface MainCategoryDao {

	@Select("select * from MAINCATEGORY")
	public List<MainCategory> getMainCategory();
	
}
