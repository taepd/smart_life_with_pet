package bit.or.eesotto.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BlogComment {
	
	private int bcindex;
	private int bindex;  //블로그 인덱스(FK)
	private String userid;
	private int bclike;
	private String content;
	private String scstate;
	private String rtime;
	private int refer;
	private int depth;
	private int step;

}
