package bit.or.eesotto.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.or.eesotto.dao.*;
import bit.or.eesotto.dto.*;

@Service
public class PetService {
	
	private static final Logger logger = LoggerFactory.getLogger(PetService.class);

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	PetDao petDao;
	
	@Autowired
	PetLikeDao petLikeDao;
	

	//어드민 > 동물 리스트 조회
	public List<Pet> getPetList(String userid) {
		
		List<Pet> petList = null;

		try {

			petDao = sqlsession.getMapper(PetDao.class);
			petList = petDao.getPetList(userid);
			System.out.println(petList);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return petList;
	}
	
	// 펫 팔로우 처리
	public int followPet(PetLike petLike) {
		
		int result = 0;

		try {

			petLikeDao = sqlsession.getMapper(PetLikeDao.class);
			result = petLikeDao.followPet(petLike);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}
	
	// 펫 언팔로우 처리
	public int unFollowPet(PetLike petLike) {
		
		int result = 0;

		try {

			petLikeDao = sqlsession.getMapper(PetLikeDao.class);
			result = petLikeDao.unFollowPet(petLike);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}
	
	// 펫 팔로우 여부 확인
	public PetLike isFollowPet(String petindex, String userid) {
		
		PetLike petLike = null;

		try {

			petLikeDao = sqlsession.getMapper(PetLikeDao.class);
			petLike = petLikeDao.isFollowPet(Integer.parseInt(petindex), userid);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return petLike;
	}
	
	public List<HashMap<String, Object>> getPetKindCount() {
		
		List<HashMap<String, Object>> map = null;

		try {

			petDao = sqlsession.getMapper(PetDao.class);
			map = petDao.getPetKindCount();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return map;
	}
	
	
	
}

