package bit.or.eesotto.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import bit.or.eesotto.dao.MainCategoryDao;
import bit.or.eesotto.dao.ScheduleDao;
import bit.or.eesotto.dao.SubCategoryDao;
import bit.or.eesotto.dto.MainCategory;
import bit.or.eesotto.dto.Schedule;
import bit.or.eesotto.dto.SubCategory;
import bit.or.eesotto.service.ManagementService;

@RestController
@RequestMapping("/management/")
public class ManagementAjaxController {

	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	@Autowired
	private ManagementService managementService;
	
	// 대분류 코드 가져오기
	@RequestMapping("getMainCategory.bit")
	public List<MainCategory> getMainCategory() {

		List<MainCategory> list = null;
		
		try {
			
			MainCategoryDao dao = sqlsession.getMapper(MainCategoryDao.class);
			list = dao.getMainCategory();
			logger.info("대분류코드 가져오기 완료");

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return list;
	}
	
	// 소분류 코드 가져오기 - 개
	@RequestMapping("getSubCategory_dog.bit")
	public List<SubCategory> getSubCategory_dog() {
		
		List<SubCategory> list = null;
		
		try {
			
			SubCategoryDao dao = sqlsession.getMapper(SubCategoryDao.class);
			list = dao.getSubCategory_dog();
			logger.info("소분류 코드(개) 가져오기 완료");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return list;
	}
	
	// 소분류 코드 가져오기 - 고양이
	@RequestMapping("getSubCategory_cat.bit")
	public List<SubCategory> getSubCategory_cat() {
		
		List<SubCategory> list = null;
		
		try {
			
			SubCategoryDao dao = sqlsession.getMapper(SubCategoryDao.class);
			list = dao.getSubCategory_cat();
			logger.info("소분류 코드(고양이) 가져오기 완료");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return list;
	}
	
	@RequestMapping("insertSchedule.bit")
	public int newSchedule(Schedule schedule) {
		
		int result = 0;
		/*
		String a = schedule.getBegin_date();
		String b = schedule.getEnd_date();
		Timestamp t1 = Timestamp.valueOf(a);
		Timestamp t2 = Timestamp.valueOf(b);
		schedule.setBegin_date(t1);
		 */
		
		try {
			ScheduleDao dao = sqlsession.getMapper(ScheduleDao.class);
			result = dao.newSchedule(schedule);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping("getSchedule.bit")
	public HashMap<String, Object> getSchedule(String userid) {
		
		//서비스단에서 리스트로 만들고, 컨트롤러에서는 map으로 만들기?
		
		List<Schedule> schedule = null;
		
		HashMap<String, Object> map = null;
		
		try {
			
			schedule = managementService.getSchedule(userid);
			map.put("schedule", schedule);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}
	
}
