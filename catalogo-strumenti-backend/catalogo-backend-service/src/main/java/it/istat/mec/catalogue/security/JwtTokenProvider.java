package it.istat.mec.catalogue.security;

import java.util.Base64;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Jwts;

@Component
public class JwtTokenProvider {

	private static final String USER_ID = "userId";

	private static String secretKey;

	@Value("${security.secret-key:is2-secretkey}")
	public void setDatabase(String key) {
		secretKey = key;
	}

	public static Integer getUserId(String token) {
		return (Integer) Jwts.parser().setSigningKey(Base64.getEncoder().encodeToString(secretKey.getBytes()))
				.parseClaimsJws(token).getBody().get(USER_ID);
	}

	public static String getUsername(String token) {
		return Jwts.parser().setSigningKey(Base64.getEncoder().encodeToString(secretKey.getBytes()))
				.parseClaimsJws(token).getBody().getSubject();
	}

}
