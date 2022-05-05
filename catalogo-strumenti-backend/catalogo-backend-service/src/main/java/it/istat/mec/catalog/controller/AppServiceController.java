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
import it.istat.mec.catalog.dto.AppServiceDto;
import it.istat.mec.catalog.request.CreateAppServiceRequest;
import it.istat.mec.catalog.service.AppServiceService;


@RestController
@RequestMapping("/catalog")
public class AppServiceController {

	@Autowired
	private AppServiceService appServiceService;
	
	@GetMapping("/open/app-services")
	public List<AppServiceDto> getAllAppServices() {

		return appServiceService.findAllAppServices();
	}
	
	@GetMapping(value = "/open/app-services/{id}")
	public AppServiceDto getAppService(@PathVariable("id") Integer id) {

		return appServiceService.findAppServiceById(id);

	}
	
	@PostMapping("/app-services")
	public AppServiceDto create(@RequestBody CreateAppServiceRequest request) {

		return appServiceService.newAppService(request);
	}
	
	@PutMapping(value = "/app-services/{id}")
	public AppServiceDto updateAppService(@RequestBody CreateAppServiceRequest request) {
		
		return appServiceService.updateAppService(request);
	}
	
	@DeleteMapping(value = "/app-services/{id}")
	public AppServiceDto deleteAppService(@PathVariable("id") Integer id) {

		return appServiceService.deleteAppService(id);
	}
 
}

