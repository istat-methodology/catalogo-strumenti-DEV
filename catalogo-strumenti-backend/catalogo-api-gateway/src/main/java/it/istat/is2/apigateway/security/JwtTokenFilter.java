package it.istat.is2.apigateway.security;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.GenericFilterBean;

import io.jsonwebtoken.JwtException;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class JwtTokenFilter extends GenericFilterBean {
	private JwtTokenProvider jwtTokenProvider;

	public JwtTokenFilter(JwtTokenProvider jwtTokenProvider) {
		this.jwtTokenProvider = jwtTokenProvider;
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain)
			throws IOException, ServletException {

		HttpServletResponse response = (HttpServletResponse) res;
		String token = jwtTokenProvider.resolveToken((HttpServletRequest) req);
		log.debug("token found: " +token);
		if (token != null) {
			if (!jwtTokenProvider.isTokenPresentInDB(token)) {
				log.debug("token not present in db");
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid JWT, Token not present");
				// throw new CustomException("Invalid JWT token",HttpStatus.UNAUTHORIZED);
			} else {
				try {
					log.debug("token present in db and validating..");
					jwtTokenProvider.validateToken(token);
					log.debug("token present in db and validate ok");
					Authentication auth = token != null ? jwtTokenProvider.getAuthentication(token) : null;
					// setting auth in the context.
					SecurityContextHolder.getContext().setAuthentication(auth);
					log.debug("token present in db and validate ok, Auth ok");

				} catch (JwtException | IllegalArgumentException e) {
					log.debug("token present in db and validate ko, removing from db..");
					jwtTokenProvider.removeInvalidTokenFromDB(token);
					log.debug("token present in db and validate ko, removed from db");
					response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid JWT token");
					// throw new CustomException("Invalid JWT token", HttpStatus.UNAUTHORIZED);
				}
			}
		}
		filterChain.doFilter(req, res);
	}
}
