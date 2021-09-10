package it.istat.is2.apigateway.service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import it.istat.is2.apigateway.beans.IS2UserDetails;
import it.istat.is2.apigateway.dao.UsersDao;
import it.istat.is2.apigateway.domain.UserRolesEntity;
import it.istat.is2.apigateway.domain.UsersEntity;
import it.istat.is2.apigateway.dto.UsersDto;
import it.istat.is2.apigateway.exceptions.CustomException;
import it.istat.is2.apigateway.exceptions.NoDataException;
import it.istat.is2.apigateway.repository.UserRespository;
import it.istat.is2.apigateway.translators.Translators;

@Service
public class UserService implements UserDetailsService {

	private final UserRespository userRepository;
	@Autowired
	UsersDao usersDao;

	public UserService(UserRespository userRepository) {
		this.userRepository = userRepository;
	}

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		UsersEntity user = userRepository.findByEmail(email);
		if (user == null || user.getRole() == null) {
			throw new CustomException("Invalid username or password.", HttpStatus.UNAUTHORIZED);
		}
		String[] authorities = new String[Arrays.asList(user.getRole()).size()];
		int count = 0;
		for (UserRolesEntity role : Arrays.asList(user.getRole())) {
			authorities[count] = "ROLE_" + role.getRole();
			count++;
		}
		IS2UserDetails userDetails = new IS2UserDetails(user.getEmail(), user.getPassword(), 1, false, false, true,
				authorities);
		return userDetails;
	}

	public List<UsersDto> findAllUsers(String role) {
		if (!StringUtils.isEmpty(role))
			return usersDao.findByRole(role).stream().map(x -> Translators.translate(x)).collect(Collectors.toList());
		else
			return usersDao.findAll().stream().map(x -> Translators.translate(x)).collect(Collectors.toList());
	}

	public UsersDto findUserById(Integer id) {

		if (!usersDao.findById(id).isPresent())
			throw new NoDataException("User not present");
		return Translators.translate(usersDao.findById(id).get());
	}

	public UsersDto deleteUser(Integer id) {
		UsersDto usersDto = findUserById(id);
		return usersDto;
	}
}
