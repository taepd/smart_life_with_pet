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
	private String rtime;
	private String ctime;
	private int gcoll; //목표 모금액 > goal + collection
	private int ccoll; //현재 모금액 > current + collection
	private String dstate;
	private String dimg;
	
	private List<CommonsMultipartFile> files;
	
	
	
	/* CommonsMultipartFile */

}
