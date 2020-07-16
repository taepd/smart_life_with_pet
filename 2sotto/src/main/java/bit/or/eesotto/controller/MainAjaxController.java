package bit.or.eesotto.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import bit.or.eesotto.dao.PetDao;
import bit.or.eesotto.dao.ScheduleDao;
import bit.or.eesotto.dto.Schedule;

@RestController
public class MainAjaxController {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	// 내 동물 이름만 가져오기
	@RequestMapping("getSimplePetInfo.bit")
	public List<String> getSimplePetInfo(String userid) {
		
		List<String> list = null;
		
		try {
			PetDao petdao = sqlsession.getMapper(PetDao.class);
			list = petdao.getSimplePetInfo(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 동물 이름에 따른 스케쥴 가져오기
	@RequestMapping("getMyPetSchedule.bit")
	public List<Schedule> getMyPetSchedule(String userid, String petname) {
		
		List<Schedule> list = null;
		try {
			ScheduleDao scheduleDao = sqlsession.getMapper(ScheduleDao.class);
			list = scheduleDao.getMyPetSchedule(userid, petname);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
