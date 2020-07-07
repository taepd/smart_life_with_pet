package bit.or.eesotto.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Comment {
	
	private int prindex;
	private int bdindex;
	private String userid;
	private int rplike;
	private String content;
	private String scstate;
	private String rtime;
	private int refer;
	private int depth;
	private int step;

}
