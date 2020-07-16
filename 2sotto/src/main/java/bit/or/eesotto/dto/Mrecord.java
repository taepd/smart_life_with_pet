package bit.or.eesotto.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Mrecord {
	
	private int mindex;
	private int petindex;
	private String userid;
	private String vdate;
	private String vreason;
	private String hname;
	
	//반려동물 이름 받아오는 용도
	private String petname;

}
