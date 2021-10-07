package it.istat.mec.catalog.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import it.istat.mec.catalog.dto.DesktopApplicationDto;
import it.istat.mec.catalog.request.CreateDesktopApplicationRequest;
import it.istat.mec.catalog.service.DesktopApplicationService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/catalog")
public class DesktopApplicationController {

	@Autowired
	private DesktopApplicationService desktopApplicationService;
	
	@GetMapping("/desktopapplications")
	public List<DesktopApplicationDto> getAllAgents() {

		return desktopApplicationService.findAllDesktopApplications();
	}
	
	@GetMapping(value = "/desktopapplications/{id}")
	public DesktopApplicationDto getDesktopApplication(@PathVariable("id") Long id) {

		return desktopApplicationService.findDesktopApplicationById(id);

	}
	
	@PostMapping("/desktopapplications")
	public DesktopApplicationDto create(@RequestBody CreateDesktopApplicationRequest request) {

		return desktopApplicationService.newDesktopApplication(request);
	}
	
	@PutMapping(value = "/desktopapplications/{id}")
	public DesktopApplicationDto updateDesktopApplication(@RequestBody CreateDesktopApplicationRequest request) {
		
		return desktopApplicationService.updateDesktopApplication(request);
	}
	
	@DeleteMapping(value = "/desktopapplications/{id}")
	public DesktopApplicationDto deleteDesktopApplication(@PathVariable("id") Long id) {

		return desktopApplicationService.deleteDesktopApplication(id);
	}
 
}


