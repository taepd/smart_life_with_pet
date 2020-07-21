package bit.or.eesotto.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.or.eesotto.dao.PetDao;
import bit.or.eesotto.dao.UserDao;
import bit.or.eesotto.dto.Pet;
import bit.or.eesotto.dto.User;

@Service
public class MypageService {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	UserDao userDao;
	PetDao petDao;
	//유저 정보 가져오기
	public User getUserInfo(String userid) {

		userDao = sqlsession.getMapper(UserDao.class);

		return userDao.getUser(userid);
		
	}
	
	//유저 정보 수정하기
	public int editUser(User user) {

		userDao = sqlsession.getMapper(UserDao.class);

		return userDao.editUser(user);
		
	}
	
	//유저 정보 삭제하기
	public int deleteUser(String userid) {

		userDao = sqlsession.getMapper(UserDao.class);

		return userDao.deleteUser(userid);
		
	}	
	
	//비밀번호 수정하기
	public int editPwd(String pwd, String userid) {

		userDao = sqlsession.getMapper(UserDao.class);

		return userDao.editPwd(pwd, userid);
			
	}
	
	//댕댕이 정보 가져오기
	public List<Pet> getPetInfo(String userid) {
		petDao = sqlsession.getMapper(PetDao.class);
		return petDao.getPetInfo(userid);
	}
	
	//반려동물 한 마리 정보 가져오기(petindex 매개변수)
	public Pet getPet(int petindex) {

		petDao = sqlsession.getMapper(PetDao.class);
		return petDao.getPet(petindex);
		
	}
	
	
	
	
	
//	//댕댕이 정보 넣기
//
//	public int newPet(Pet pet, String userid) {
//		int result = 0;
//		userDao = sqlsession.getMapper(UserDao.class);
//		userid = userDao.getUser(userid).toString();
//		try {
//			petDao = sqlsession.getMapper(PetDao.class);
//			result = petDao.newPet(pet);
//		} catch (Exception e) {
//			System.out.println(e.getMessage());
//		}
//		return result;
//	}

	
//	//댕댕이 정보 수정
//	public int editPet(Pet pet, String userid) {
//		petDao = sqlsession.getMapper(PetDao.class);
//			return petDao.editPet(pet, userid);
//	}

}
