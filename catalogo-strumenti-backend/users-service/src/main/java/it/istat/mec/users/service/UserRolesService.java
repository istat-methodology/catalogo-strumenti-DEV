package it.istat.mec.users.service;

import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.users.dao.UserRolesDao;
import it.istat.mec.users.domain.UserRolesEntity;
import it.istat.mec.users.dto.UserRolesDto;
import it.istat.mec.users.dto.UsersDto;
import it.istat.mec.users.exceptions.NoDataException;
import it.istat.mec.users.request.CreateUserRoleRequest;
import it.istat.mec.users.translators.Translators;


@Service
public class UserRolesService {
	@Autowired
	UserRolesDao userRolesDao;
	
	public List<UserRolesDto> findAllUserRoles() {		
			return userRolesDao.findAll().stream().map(x -> Translators.translate(x)).collect(Collectors.toList());
	}
	
	public UserRolesDto findUserRolesById(Integer id) {

		if (!userRolesDao.findById(id).isPresent())
			throw new NoDataException("Role not present");
		return Translators.translate(userRolesDao.findById(id).get());
	}
	
	public UserRolesDto deleteUserRole(Integer id) {
		UserRolesDto userRolesDto = findUserRolesById(id);
		userRolesDao.deleteById(id);
		return userRolesDto;
	}
	
	public UserRolesDto newUserRole(CreateUserRoleRequest request) {
		UserRolesEntity role = new UserRolesEntity();
		role = Translators.translate(request);	
		
		userRolesDao.save(role);		    
		return Translators.translate(role);
	}
	
	public UserRolesDto updateUserRole(CreateUserRoleRequest request) {		
		
		if (!userRolesDao.findById(request.getId()).isPresent())
			throw new NoDataException("Role not present");
		
		UserRolesEntity role = userRolesDao.findById(request.getId()).get();
		role = Translators.translateUpdate(request, role);	
		
		userRolesDao.save(role);		
		return Translators.translate(role);
	}

	
}
