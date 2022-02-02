package it.istat.mec.users.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import it.istat.mec.users.dao.UserRolesDao;
import it.istat.mec.users.dao.UsersDao;
import it.istat.mec.users.domain.UserRolesEntity;
import it.istat.mec.users.domain.UsersEntity;
import it.istat.mec.users.dto.UsersDto;
import it.istat.mec.users.exceptions.NoDataException;
import it.istat.mec.users.repository.UserRespository;
import it.istat.mec.users.request.CreateUserRequest;
import it.istat.mec.users.request.ResetPasswordRequest;
import it.istat.mec.users.request.UpdatePasswordRequest;
import it.istat.mec.users.request.UpdateUserRequest;
import it.istat.mec.users.translators.Translators;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserService {

	private final UserRespository userRepository;
	@Autowired
	UsersDao usersDao;
	@Autowired
	UserRolesDao userRolesDao;

	public UserService(UserRespository userRepository) {
		this.userRepository = userRepository;
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
		usersDao.deleteById(id);
		return usersDto;
	}
	public UsersDto newUser(CreateUserRequest request) {
		UsersEntity user = new UsersEntity();
		UserRolesEntity userRole = userRolesDao.findById(request.getRole()).get();
		user = Translators.translate(request);	
		user.setRole(userRole);
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		user.setPassword(passwordEncoder.encode(request.getPassword()));
		
		usersDao.save(user);		    
		return Translators.translate(user);
	}
	public String updateUser(Integer id, UpdateUserRequest request) throws Exception {	
		
		String msg = "";
		if (!usersDao.findById(id).isPresent())
			throw new NoDataException("User not present");		
		UsersEntity user = usersDao.findById(id).get();
		
		user = Translators.translateUpdate(request, user);	
		
		if(request.getRoleid() !=null) {
			if (!userRolesDao.findById(request.getRoleid()).isPresent())
				throw new NoDataException("Role not present");	
			UserRolesEntity userRole = userRolesDao.findById(request.getRoleid()).get();			
			user.setRole(userRole);	
		}
		usersDao.save(user);  
		msg = "User succesfully updated!";
		
        return msg;
	}
	
	public String updatePasswordByEmail(String email, UpdatePasswordRequest request) throws Exception {
		String msg = "";
		if (!usersDao.findByEmail(email).isPresent())
			throw new NoDataException("User not present");		
		UsersEntity user = usersDao.findByEmail(email).get();		
		
		if((request.getNewpass()!=null && !request.getNewpass().equals("")) && (request.getOldpass()!=null && !request.getOldpass().equals(""))) {
			
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String newPass = passwordEncoder.encode(request.getNewpass());
			
			if(passwordEncoder.matches(request.getOldpass(), user.getPassword())) {
				user.setPassword(newPass);   
				usersDao.save(user);
				msg = "01 Password succesfully updated!";
			}else {
				msg = "02 The old password doesn't match with password stored in db";
			}
			    
		} else {
			msg = "03 The Old password and New password fields are mandatory";
		}		
        
        usersDao.save(user);        
        return msg;
    }

    public String updatePasswordById(Integer id, UpdatePasswordRequest request) throws Exception {
    	String msg = "";
    	if (!usersDao.findById(id).isPresent())
			throw new NoDataException("User not present");		
		UsersEntity user = usersDao.findById(id).get();
		
		if( (request.getNewpass()!=null && !request.getNewpass().equals("")) && (request.getOldpass()!=null && !request.getOldpass().equals("")) ) {
			
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String newPass = passwordEncoder.encode(request.getNewpass());
			
			if(passwordEncoder.matches(request.getOldpass(), user.getPassword())) {
				user.setPassword(newPass);   
				usersDao.save(user);
				msg = "01 Password succesfully updated!";
			}else {
				msg = "02 The old password doesn't match with password stored in db";
			}
			    
		} else {
			msg = "03 The Old password and New password fields are mandatory";
		}		
        
        usersDao.save(user);        
        return msg;
    }
    
    public String resetPasswordById(Integer id, ResetPasswordRequest request) throws Exception {
    	String msg = "";
    	if (!usersDao.findById(id).isPresent())
			throw new NoDataException("User not present");		
		UsersEntity user = usersDao.findById(id).get();
		
		if( (request.getPassword()!=null && !request.getPassword().equals("")) ) {
			
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String newPass = passwordEncoder.encode(request.getPassword());
						
			user.setPassword(newPass);   
			usersDao.save(user);
			msg = "01 Password succesfully updated!";			
			    
		} else {
			msg = "02 The password field is mandatory";
		}		
        
        usersDao.save(user);        
        return msg;
    }
	
}
