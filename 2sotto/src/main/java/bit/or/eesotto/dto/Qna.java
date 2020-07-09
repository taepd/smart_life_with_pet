package bit.or.eesotto.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Qna {
	
	private int qaindex; //글번호
	private String userid; //USERID
	private String title; //제목
	private String qatime; //등록시간
	private int count; //조회수
	private String scstate; //비밀유무
	private String content; //내용
	private String filename; //첨부파일
	private String awstate; //답변완료

}
