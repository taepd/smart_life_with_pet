package bit.or.eesotto.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Message {
	
	private int msindex; //쪽지번호
	private String ruserid; //받은사람ID
	private String suserid2; //보낸사람ID
	private String title; //쪽지내용
	private String qatime; //보낸일시
	private String id; //읽은일시
	private String readstate; //읽음여부 

}
