package bit.or.eesotto.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import bit.or.eesotto.dao.MainCategoryDao;
import bit.or.eesotto.dao.PetDao;
import bit.or.eesotto.dao.ScheduleDao;
import bit.or.eesotto.dao.SubCategoryDao;
import bit.or.eesotto.dto.MainCategory;
import bit.or.eesotto.dto.Pet;
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
	
	// 일정 추가하기
	@RequestMapping("insertSchedule.bit")
	public int newSchedule(Schedule schedule) {
		
		int result = 0;
		
		try {
			ScheduleDao dao = sqlsession.getMapper(ScheduleDao.class);
			result = dao.newSchedule(schedule);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 전체 일정 불러오기
	@RequestMapping("getSchedule.bit")
	public Map<String, Object> getSchedule(String userid) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Schedule> schedule = null;
		
		try {
			
			schedule = managementService.getSchedule(userid);
			map.put("schedule", schedule);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}
	
	// 일정 업데이트
	@RequestMapping("updateSchedule.bit")
	public int updateSchedule(Schedule schedule) {
		
		int result = 0;
		try {
			ScheduleDao dao = sqlsession.getMapper(ScheduleDao.class);
			result = dao.updateSchedule(schedule);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 일정 삭제하기
	@RequestMapping("deleteSchedule.bit")
	public int deleteSchedule(String sindex) {
		
		int result = 0;
		
		try {
			ScheduleDao dao = sqlsession.getMapper(ScheduleDao.class);
			result = dao.deleteSchedule(sindex);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}
