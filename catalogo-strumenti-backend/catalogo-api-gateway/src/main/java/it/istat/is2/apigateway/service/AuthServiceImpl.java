package it.istat.is2.apigateway.service;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import it.istat.is2.apigateway.domain.JwttokenEntity;
import it.istat.is2.apigateway.domain.UserRolesEntity;
import it.istat.is2.apigateway.domain.UsersEntity;
import it.istat.is2.apigateway.exceptions.CustomException;
import it.istat.is2.apigateway.repository.JwtTokenRepository;
import it.istat.is2.apigateway.repository.UserRespository;
import it.istat.is2.apigateway.security.JwtTokenProvider;

@Service
public class AuthServiceImpl implements AuthService {
	private final PasswordEncoder passwordEncoder;
	private final JwtTokenProvider jwtTokenProvider;
	private final AuthenticationManager authenticationManager;
	private final UserRespository userRepository;
	private final JwtTokenRepository jwtTokenRepository;

	@Autowired
	public AuthServiceImpl(PasswordEncoder passwordEncoder, JwtTokenProvider jwtTokenProvider,
			AuthenticationManager authenticationManager, UserRespository userRepository,
			JwtTokenRepository jwtTokenRepository) {
		this.passwordEncoder = passwordEncoder;
		this.jwtTokenProvider = jwtTokenProvider;
		this.authenticationManager = authenticationManager;
		this.userRepository = userRepository;
		this.jwtTokenRepository = jwtTokenRepository;
	}

	@Override
	public String login(String username, String password) {
		try {
			authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
			UsersEntity user = userRepository.findByEmail(username);
			if (user == null) {
				throw new CustomException("Invalid username or password.", HttpStatus.UNAUTHORIZED);
			}
			String token = jwtTokenProvider.createToken(username, user.getId(),
					Arrays.asList(user.getRole()).stream().map((UserRolesEntity role) -> role.getRole())
							.filter(Objects::nonNull).collect(Collectors.toList()));
			return token;

		} catch (AuthenticationException e) {
			throw new CustomException("Invalid username or password.", HttpStatus.UNAUTHORIZED);
		}
	}

	@Override
	public boolean logout(String token) {
		jwtTokenRepository.delete(new JwttokenEntity(token));
		return true;
	}

	@Override
	public Boolean isValidToken(String token) {
		return jwtTokenProvider.validateToken(token);
	}

	@Override
	public String createNewToken(String token) {
		String username = jwtTokenProvider.getUsername(token);
		Integer userId = jwtTokenProvider.getUserId(token);
		List<String> roleList = jwtTokenProvider.getRoleList(token);
		String newToken = jwtTokenProvider.createToken(username, userId, roleList);
		return newToken;
	}
}
