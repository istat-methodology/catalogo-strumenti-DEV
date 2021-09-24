package it.istat.mec.users.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import it.istat.mec.users.dto.UserRolesDto;
import it.istat.mec.users.request.CreateUserRoleRequest;
import it.istat.mec.users.service.UserRolesService;

@Controller
@RequestMapping("/users")
public class UserRolesController {
	@Autowired
	private UserRolesService userRolesService;
	
	@GetMapping("/roles")
	@ResponseBody
	public List<UserRolesDto> getAllUserRoles() {
		return userRolesService.findAllUserRoles();
	}
	
	@GetMapping(value = "/roles/{id}")
	@ResponseBody
	public UserRolesDto getUserRole(@PathVariable("id") Integer id) {

		return userRolesService.findUserRolesById(id);

	}
	
	@PostMapping("/roles")
	@ResponseBody
	public UserRolesDto create(@RequestBody CreateUserRoleRequest request) {		
			
		return userRolesService.newUserRole(request);
	}
	
	@PutMapping(value = "/roles/{id}")
	@ResponseBody
	public UserRolesDto updateUserRole(@RequestBody CreateUserRoleRequest request) {
		
		
		return userRolesService.updateUserRole(request);
	}
	
	@DeleteMapping(value = "/roles/{id}")
	@ResponseBody
	public UserRolesDto deleteUserRole(@PathVariable("id") Integer id) { 
  
		return userRolesService.deleteUserRole(id);
	}
}
