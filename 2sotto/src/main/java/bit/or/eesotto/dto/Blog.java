package bit.or.eesotto.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Blog {
	
	private int bindex; //글번호
	private String petindex; //동물식별번호
	private String userid; //Userid
	private int blike; //추천수
	private String title; //제목
	private String content; //내용
	private String rtime; //등록시간
	private String delstate; //삭제유무
	private int count; //조회수
	private String pimg; //이미지
	private String nick; //닉네임
	
	private int bcCount; //댓글 개수 표시를 위한 blogComment와 join시 추가 컬럼

}
