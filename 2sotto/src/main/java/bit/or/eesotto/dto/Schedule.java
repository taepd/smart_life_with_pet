package bit.or.eesotto.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Schedule {
	
	private int sindex;
	private int petindex;
	private String userid;
	private String title;
	private String content;
	private String is_complete;
	private String start;
	private String end;
	private String allday;
	private String daysofweek;
	private String adncdnoti;
	private String color;
	
	//임시
	private String petname;
	private String petimg;
	

}
