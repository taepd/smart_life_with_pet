package bit.or.eesotto.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Pet {
	
	private int petindex; //동물식별번호
	private String userid; //유저id
	private String mcategory; //대분류코드
	private String scategory; //소분류코드
	private String petname; //이름
	private String sex; //성별
	private int age; //나이
	private String size; //크기
	private int weight; //몸무게
	private String hlength; //털길이
	private String nstate; //중성화여부
	private String petimg; //사진
	private String memo; //특이사항
	
	//나이 계산용 멤버 필드
	private int age_year;
	private int age_month;
	
	//대분류코드명, 소분류코드명 뽑기 용도
	private String scaname;
	private String mcaname;
	
	//반려동물 주인 닉네임 뽑기 용도
	private String nick;
	
	//추천타입 용도
	private String recomType;
	private int relatedPet;
	

}
