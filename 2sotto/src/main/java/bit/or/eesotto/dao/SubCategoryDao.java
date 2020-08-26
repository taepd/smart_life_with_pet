package bit.or.eesotto.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import bit.or.eesotto.dto.MainCategory;
import bit.or.eesotto.dto.SubCategory;
import bit.or.eesotto.dto.User;


public interface SubCategoryDao {

	//하나로 합치려면.. 동적 쿼리?
	//추후 리팩토링
	
	@Select("select * from SUBCATEGORY where mcategory = '1' order by scaname asc")
	public List<SubCategory> getSubCategory_dog();

	@Select("select * from SUBCATEGORY where mcategory = '2' order by scaname asc")
	public List<SubCategory> getSubCategory_cat();

}
