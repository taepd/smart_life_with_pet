package bit.or.eesotto.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Post {
	
	private int bdindex;
	private int petindex;
	private String userid;
	private int blike;
	private String title;
	private String content;
	private String rtime;
	private String delstate;
	private int count;
	private String pimg;

}
