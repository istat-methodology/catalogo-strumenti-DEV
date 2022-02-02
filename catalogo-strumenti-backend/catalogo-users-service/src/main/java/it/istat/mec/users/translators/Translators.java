package it.istat.mec.users.translators;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import it.istat.mec.users.domain.UserRolesEntity;
import it.istat.mec.users.domain.UsersEntity;
import it.istat.mec.users.dto.UserRolesDto;
import it.istat.mec.users.dto.UsersDto;
import it.istat.mec.users.request.CreateUserRequest;
import it.istat.mec.users.request.CreateUserRoleRequest;
import it.istat.mec.users.request.UpdateUserRequest;

 

@Component
public class Translators {
	
	public static UsersDto translate(UsersEntity x) {

		final ModelMapper modelMapper = new ModelMapper();
		final UsersDto dTO = modelMapper.map(x, UsersDto.class);
		return dTO;
	}
	public static UsersDto translate(Optional<UsersEntity> optional) {

		final ModelMapper modelMapper = new ModelMapper();
		final UsersDto dTO = modelMapper.map(optional, UsersDto.class);
		return dTO;
	}
	public static UserRolesDto translate(UserRolesEntity x) {

		final ModelMapper modelMapper = new ModelMapper();
		final UserRolesDto dTO = modelMapper.map(x, UserRolesDto.class);
		return dTO;
	}

	public static <S, T> List<T> mapList(List<S> source, Class<T> targetClass) {
		final ModelMapper modelMapper = new ModelMapper();
	    return source
	      .stream()
	      .map(element -> modelMapper.map(element, targetClass))
	      .collect(Collectors.toList());
	}
	public static UsersEntity translate(CreateUserRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final UsersEntity user = modelMapper.map(x, UsersEntity.class);
		return user;
	}
	
	public static UserRolesEntity translate(CreateUserRoleRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final UserRolesEntity role = modelMapper.map(x, UserRolesEntity.class);
		return role;
	}
	public static UsersEntity translateUpdate(UpdateUserRequest x, UsersEntity user) {  
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x,user);
		 
		return user;
	}
	public static UserRolesEntity translateUpdate(CreateUserRoleRequest x, UserRolesEntity role) {  
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x,role);
		 
		return role;
	}
}
