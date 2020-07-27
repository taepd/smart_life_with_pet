package bit.or.eesotto.service;

import java.util.*;

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
	
	//동물 친구 추천 리스트 조회
	public List<Pet>getRecommendPetList(List<Pet> petList){
		List<Pet> list = new ArrayList<Pet>();
		for(Pet pet: petList) {
			// 같은 품종의 동물 친구			
			List<Pet> tmpList1 = petDao.getSameCategoryPet(pet.getUserid(), pet.getScategory());
			for(Pet recomPet: tmpList1) {
				recomPet.setRelatedPet(pet.getPetindex()); //어떤 반려동물과 관련되어 있는지 추가
				recomPet.setRecomType("kind");
				System.out.println("추천 동물 친구: "+ recomPet);
				list.add(recomPet);
				System.out.println("추천 리스트" + list);
			}
	
			// 비슷한 나이대의 동물 친구
			List<Pet> tmpList2 = petDao.getSimilarAgePet(pet.getUserid(), pet.getAge());
			for(Pet recomPet: tmpList2) {
				recomPet.setRelatedPet(pet.getPetindex()); //어떤 반려동물과 관련되어 있는지 추가
				recomPet.setRecomType("age");
				System.out.println("추천 동물 친구: "+ recomPet);
				list.add(recomPet);
				System.out.println("추천 리스트" + list);
			}
			// 가까운 거리에 사는 동물 친구
			List<Pet> tmpList3 = petDao.getNearPet(pet.getUserid());
			for(Pet recomPet: tmpList3) {
				recomPet.setRelatedPet(pet.getPetindex()); //어떤 반려동물과 관련되어 있는지 추가
				recomPet.setRecomType("dist");
				System.out.println("추천 동물 친구: "+ recomPet);
				list.add(recomPet);
				System.out.println("추천 리스트" + list);
			}
		}
		System.out.println("섞기 전: "+ list);
		// 배열을 랜덤하게 섞어주는 작업
		Collections.shuffle(list);
		System.out.println("섞은 후: "+ list);
		
		// 배열 중 3개만 뽑기
		list = list.subList(0, 3);
		System.out.println("추천리스트 최종: "+ list);
		
		
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
