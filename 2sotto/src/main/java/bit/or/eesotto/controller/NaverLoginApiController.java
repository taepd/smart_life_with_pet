package bit.or.eesotto.controller;

import org.springframework.stereotype.Controller;

import com.github.scribejava.core.builder.api.DefaultApi20;

@Controller
public class NaverLoginApiController extends DefaultApi20 {
	protected NaverLoginApiController() {
	}

	private static class InstanceHolder {
		private static final NaverLoginApiController INSTANCE = new NaverLoginApiController();
	}

	public static NaverLoginApiController instance() {
		return InstanceHolder.INSTANCE;
	}

	@Override
	public String getAccessTokenEndpoint() {
		return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return "https://nid.naver.com/oauth2.0/authorize";
	}
}
