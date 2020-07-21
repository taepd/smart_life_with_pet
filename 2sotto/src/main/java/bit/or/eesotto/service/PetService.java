package bit.or.eesotto.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.or.eesotto.dao.PetDao;
import bit.or.eesotto.dao.UserDao;
import bit.or.eesotto.dto.Pet;
import bit.or.eesotto.dto.User;

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
	
}

