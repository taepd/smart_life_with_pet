package bit.or.eesotto.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.or.eesotto.dao.PetDao;
import bit.or.eesotto.dao.PetLikeDao;
import bit.or.eesotto.dto.Pet;
import bit.or.eesotto.dto.PetLike;

@Service
public class MainService {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	@Autowired
	PetLikeDao petLikeDao;
	
	@Autowired
	PetDao petDao;
	
	// 메인에 뿌릴 '내가 팔로우하는 동물'
	public List<PetLike> getPetLike(String userid) {
		
		List<PetLike> list = null;
		list = petLikeDao.getPetLike(userid);
		return list;
	}
	
	// 반려동물 이름, 사진 가져가기(메인용)
	public List<Pet> getPetPicture(String userid) {
		List<Pet> list = null;
		list = petDao.getPetPicture(userid);
		return list;
	}
	
	
	// 메인에 뿌릴 내 동물 이름
	/*
	public List<String> getSimplePetInfo(String userid) {
		
		List<String> list = null;
		list = petDao.getSimplePetInfo(userid);
		return list;
		
	}
	*/
}
