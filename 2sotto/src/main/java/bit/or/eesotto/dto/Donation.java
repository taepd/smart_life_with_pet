package bit.or.eesotto.dto;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class Donation {
	
	private int dindex;
	private String title;
	private String content;
	private String dobject;

	private String rtime; //후원글 등록시간
	private String ctime; //후원글 완료시간
	private int gcoll; //목표 모금액 > goal + collection
	private int ccoll; //현재 모금액 > current + collection
	private String dstate; //삭제유무

	private String dimg;
	
	private List<CommonsMultipartFile> files;
	
	
	
	/* CommonsMultipartFile */

}
