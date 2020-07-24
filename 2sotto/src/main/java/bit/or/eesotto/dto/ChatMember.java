package bit.or.eesotto.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@Data
public class ChatMember {
	
	private int mem_number;
	private int room_number;
	private String user_email;
	private String user_nickname;
}
