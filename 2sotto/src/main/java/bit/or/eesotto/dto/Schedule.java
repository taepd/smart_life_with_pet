package bit.or.eesotto.dto;

import java.sql.Timestamp;

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
	private String begin_date;
	private String end_date;
	//private Timestamp begin_date;
	//private Timestamp end_date;
	private String cycle;
	private String adncdnoti;

}
