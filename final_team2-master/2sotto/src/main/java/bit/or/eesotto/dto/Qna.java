package bit.or.eesotto.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Qna {
	
	private int qaindex;
	private String userid;
	private String title;
	private String qatime;
	private int count;
	private String scstate;
	private String content;
	private String filename;
	private String awstate;

}
