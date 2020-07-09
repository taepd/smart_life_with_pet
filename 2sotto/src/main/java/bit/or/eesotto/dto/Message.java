package bit.or.eesotto.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Message {
	
	private int MSINDEX; //쪽지번호
	private String RUSERID; //받은사람ID
	private String SUSERID; //보낸사람ID
	private String CONTENT; //쪽지내용
	private String SENDTIME; //보낸일시
	private String READTIME; //읽은일시
	private String READSTATE; //읽음여부 

}
