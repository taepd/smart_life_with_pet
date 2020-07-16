package bit.or.eesotto.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bit.or.eesotto.dao.PetDao;
import bit.or.eesotto.dao.ScheduleDao;
import bit.or.eesotto.dao.UserDao;
import bit.or.eesotto.dto.Pet;
import bit.or.eesotto.dto.Schedule;
import bit.or.eesotto.dto.User;

@Service
public class ManagementService {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	UserDao UserDao;

	public User normalLogin(String userid) {
		UserDao = sqlsession.getMapper(UserDao.class);
		return UserDao.getUser(userid);
	}
	
	
	@Autowired
	PetDao petDao;
	
	@Autowired
	ScheduleDao scheduleDao;
	
	
	//반려동물 등록하기
	public int newPet(Pet pet) {
		
		int result = 0;
		
		try {
			petDao = sqlsession.getMapper(PetDao.class);
			result = petDao.newPet(pet);
		} catch (Exception e) {
			System.out.println("managementService newPet() 문제 발생" + e.getMessage());
		}
		
		return result;
	}
	
	//반려동물 정보 가져오기
	public List<Pet> getPetInfo(String userid) {

		petDao = sqlsession.getMapper(PetDao.class);
		return petDao.getPetInfo(userid);
		
	}
	
	//반려동물 수정할 정보 가져오기
	public Pet editPetInfo(int petindex) {
		
		Pet pet = null;
		
		try {
			
			petDao = sqlsession.getMapper(PetDao.class);
			pet = petDao.editPetInfo(petindex);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pet;
	}
	
	//반려동물 정보 수정
	public int updatePetInfo(Pet pet) {
		
		int result = 0;
		
		try {
			petDao = sqlsession.getMapper(PetDao.class);
			result = petDao.updatePetInfo(pet);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//반려동물 정보 삭제
	public int deletePet(int petindex) {
		
		int result = 0;
		
		try {
			petDao = sqlsession.getMapper(PetDao.class);
			result = petDao.deletePet(petindex);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;

	}
	
	// 일정 모두 불러오기
	public List<Schedule> getSchedule(String userid) {
		
		List<Schedule> list = null;
		
		try {
			scheduleDao = sqlsession.getMapper(ScheduleDao.class);
			list = scheduleDao.getSchedule(userid);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	

}
