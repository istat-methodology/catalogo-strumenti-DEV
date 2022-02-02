package it.istat.mec.users.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import it.istat.mec.users.dto.UsersDto;
import it.istat.mec.users.request.CreateUserRequest;
import it.istat.mec.users.request.ResetPasswordRequest;
import it.istat.mec.users.request.UpdatePasswordRequest;
import it.istat.mec.users.request.UpdateUserRequest;
import it.istat.mec.users.service.UserService;


@RestController
@RequestMapping("/users")
public class UsersController {

	@Autowired
	private UserService userService;

	@GetMapping("/users")
	
	public List<UsersDto> getAllUsers(@RequestParam(value = "role",required = false) String role) {
		return userService.findAllUsers(role);
	}

	@GetMapping(value = "/users/{id}")
	
	public UsersDto getUser(@PathVariable("id") Integer id) {

		return userService.findUserById(id);

	}
	@PostMapping("/users")
	
	public UsersDto create(@RequestBody CreateUserRequest request) {		
			
		return userService.newUser(request);
	}
	
	@PutMapping(value = "/users/{id}")
	
	public String updateUser(@PathVariable("id") Integer id, @RequestBody UpdateUserRequest request) throws Exception {	
		
		return userService.updateUser(id, request);		
	}
	
	@PutMapping(value = "/users/password-email/{email}")
	
	public String updateUserPasswordByEmail(@PathVariable("email") String email, @RequestBody UpdatePasswordRequest request) throws Exception {		
		
		return userService.updatePasswordByEmail(email, request);
			
	}

	@PutMapping(value = "/users/password-id/{id}")

	public String updateUserPasswordById(@PathVariable("id") Integer id, @RequestBody UpdatePasswordRequest request) throws Exception {	
	
	return userService.updatePasswordById(id, request);		
	}
	
	@PutMapping(value = "/users/password-reset/{id}")

	public String resetUserPasswordById(@PathVariable("id") Integer id,  @RequestBody ResetPasswordRequest password) throws Exception {	
	
	return userService.resetPasswordById(id, password);		
	}
	
	@DeleteMapping(value = "/users/{id}")
	
	public UsersDto deleteUser(@PathVariable("id") Integer id) { 
  
		return userService.deleteUser(id);
	}
	
}
