package bit.or.eesotto.dto;

import lombok.Getter;

@Getter
public class AuthInfo {

	private String clientId;
    private String clientSecret;
    
    
    public AuthInfo(String clientId, String clientSecret) {
        this.clientId = clientId;
        this.clientSecret = clientSecret;
    }
    
}


