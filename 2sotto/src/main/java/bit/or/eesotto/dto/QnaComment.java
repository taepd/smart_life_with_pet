package bit.or.eesotto.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QnaComment {
	
	private int qnaindex;
	private int qaindex;  //Qna 인덱스(FK)
	private String userid;
	private int qnalike;
	private String content;
	private String scstate;
	private String rtime;
	private int refer;
	private int depth;
	private int step;
	
}
