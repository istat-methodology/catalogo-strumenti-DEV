package it.istat.is2.apigateway.security;

import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import it.istat.is2.apigateway.beans.IS2UserDetails;
import it.istat.is2.apigateway.domain.JwttokenEntity;
import it.istat.is2.apigateway.repository.JwtTokenRepository;

@Component
public class JwtTokenProvider {
	private static final String AUTH = "auth";
	private static final String USER_ID = "userId";
	private static final String AUTHORIZATION = "Authorization";

	@Value("${security.secret-key:secret-key}")
	private String secretKey;

	private long validityInMilliseconds = 28800000;// 8h 3600000; // 1h

	@Autowired
	private JwtTokenRepository jwtTokenRepository;

	@PostConstruct
	protected void init() {
		secretKey = Base64.getEncoder().encodeToString(secretKey.getBytes());
	}

	public String createToken(String username, Integer userid, List<String> roles) {

		Claims claims = Jwts.claims().setSubject(username);
		claims.put(USER_ID, userid);
		claims.put(AUTH, roles);

		Date now = new Date();
		Date validity = new Date(now.getTime() + validityInMilliseconds);

		String token = Jwts.builder()//
				.setClaims(claims)//
				.setIssuedAt(now)//
				.setExpiration(validity)//
				.signWith(SignatureAlgorithm.HS256, secretKey)//
				.compact();
		jwtTokenRepository.save(new JwttokenEntity(token));
		return token;
	}

	public String resolveToken(HttpServletRequest req) {
		String bearerToken = req.getHeader(AUTHORIZATION);
		/*
		 * if (bearerToken != null && bearerToken.startsWith("Bearer ")) { return
		 * bearerToken.substring(7, bearerToken.length()); }
		 */
		if (bearerToken != null) {
			return bearerToken;
		}
		return null;
	}

	public boolean validateToken(String token) throws JwtException, IllegalArgumentException {
		Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token);
		return true;
	}

	public boolean isTokenPresentInDB(String token) {
		return jwtTokenRepository.findById(token).isPresent();
	}

	// user details with out database hit
	public UserDetails getUserDetails(String token) {
		String userName = getUsername(token);
		List<String> roleList = getRoleList(token);
		UserDetails userDetails = new IS2UserDetails(userName, roleList.toArray(new String[roleList.size()]));
		return userDetails;
	}

	public Integer getUserId(String token) {
		return (Integer) Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token).getBody().get(USER_ID);
	}

	public List<String> getRoleList(String token) {
		return (List<String>) Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token).getBody().get(AUTH);
	}

	public String getUsername(String token) {
		return Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token).getBody().getSubject();
	}

	public Authentication getAuthentication(String token) {
		// using data base: uncomment when you want to fetch data from data base
		// UserDetails userDetails =
		// userDetailsService.loadUserByUsername(getUsername(token));
		// from token take user value. comment below line for changing it taking from
		// data base
		UserDetails userDetails = getUserDetails(token);
		return new UsernamePasswordAuthenticationToken(userDetails, "", userDetails.getAuthorities());
	}

	public void removeInvalidTokenFromDB(String token) {
		this.jwtTokenRepository.delete(new JwttokenEntity(token));
	}

}
