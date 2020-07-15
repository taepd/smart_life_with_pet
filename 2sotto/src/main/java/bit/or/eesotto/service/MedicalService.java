package bit.or.eesotto.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import bit.or.eesotto.dao.BlogDao;
import bit.or.eesotto.dao.MrecordDao;
import bit.or.eesotto.dao.PetDao;
import bit.or.eesotto.dao.UserDao;
import bit.or.eesotto.dto.Blog;
import bit.or.eesotto.dto.Mrecord;

import bit.or.eesotto.dto.Pet;
import bit.or.eesotto.dto.User;

@Service
public class MedicalService {
	private static final Logger logger = LoggerFactory.getLogger(MedicalService.class);
	
	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	UserDao UserDao;
	
	@Autowired
	PetDao petDao;
	
	@Autowired
	MrecordDao mrecordDao;
	
	
	//병원이용 기록 등록하기
	public int writeMedical(Mrecord mrecord) {
		
		int result = 0;
		
		try {
			mrecordDao = sqlsession.getMapper(MrecordDao.class);
			result = mrecordDao.writeMedical(mrecord);
		} catch (Exception e) {
			System.out.println("MedicalService write() 문제 발생" + e.getMessage());
		}
		
		return result;
	}
	
	//병원이용기록 리스트 가져오기
	public HashMap<String, Object> mrecordMainView(String cp, String ps, String userid) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// List 페이지 처음 호출
		if (ps == null || ps.trim().equals("")) {
			// default 값 설정
			ps = "5"; // 5개씩
		}

		if (cp == null || cp.trim().equals("")) {
			// default 값 설정
			cp = "1"; // 1번째 페이지 보겠다
		}
		
		int pageSize = Integer.parseInt(ps);
		int cpage = Integer.parseInt(cp);
		int pageCount = 0;

		logger.info("pageSize :" + pageSize);
		logger.info("cpage :" + cpage);
		
		// DAO 데이터 받아오기
		List<Mrecord> mrecordList = null;

		// mapper 를 통한 인터페이스 연결
		MrecordDao mrecordDao = sqlsession.getMapper(MrecordDao.class);

		int totalMrecordCount = mrecordDao.getMrecordCount(userid);
		//
		mrecordList = mrecordDao.getMrecordList(cpage, pageSize, userid);

		// 페이지 크기에 맞춰 페이지 수 구하기
		if (totalMrecordCount % pageSize == 0) {
			pageCount = totalMrecordCount / pageSize;
		} else {
			pageCount = (totalMrecordCount / pageSize) + 1;
		}
		
		map.put("mrecordList", mrecordList);
		map.put("cpage", cpage);
		map.put("pageSize", pageSize);
		map.put("pageCount", pageCount);
		map.put("totalMrecordCount", totalMrecordCount);
		
		return map;
		
	}
	
	//병원 이용기록 상세보기 
		public Mrecord getMrecordDetail(String mindex) {
					
			Mrecord mrecord = null;

			mrecordDao = sqlsession.getMapper(MrecordDao.class);
			mrecord = mrecordDao.getMrecordDetail(mindex);
								
			return mrecord;
		}
		//병원 이용기록 글 수정
		public int editMrecord(Mrecord mrecord) {

			mrecordDao = sqlsession.getMapper(MrecordDao.class);
										
			return mrecordDao.editMrecord(mrecord);
		}
		
		//병원 이용기록 글 삭제
		public int deleteMrecord(Mrecord mrecord) {

			mrecordDao = sqlsession.getMapper(MrecordDao.class);
			
			return mrecordDao.deleteMrecord(mrecord);
		}
	
	//반려동물 수정할 정보 가져오기
	/*
	 * public Pet editPetInfo(int petindex) {
	 * 
	 * Pet pet = null;
	 * 
	 * try {
	 * 
	 * petDao = sqlsession.getMapper(PetDao.class); pet =
	 * petDao.editPetInfo(petindex);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return pet; }
	 */
	
	
	/*
	 * //반려동물 정보 수정 public int updatePetInfo(Pet pet) {
	 * 
	 * int result = 0;
	 * 
	 * try { petDao = sqlsession.getMapper(PetDao.class); result =
	 * petDao.updatePetInfo(pet);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return result; }
	 * 
	 * //반려동물 정보 삭제 public int deletePet(int petindex) {
	 * 
	 * int result = 0;
	 * 
	 * try { petDao = sqlsession.getMapper(PetDao.class); result =
	 * petDao.deletePet(petindex); } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return result;
	 * 
	 * }
	 */
	
	

}
