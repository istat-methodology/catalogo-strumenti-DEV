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
import it.istat.mec.catalog.dto.BusinessServiceDto;
import it.istat.mec.catalog.request.CreateBusinessServiceRequest;
import it.istat.mec.catalog.service.BusinessServiceService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/catalog")
public class BusinessServiceController {

	@Autowired
	private BusinessServiceService businessServiceService;
	
	@GetMapping("/open/businessservices")
	public List<BusinessServiceDto> getAllBusinessServices() {

		return businessServiceService.findAllBusinessServices();
	}
	
	@GetMapping(value = "/open/businessservices/{id}")
	public BusinessServiceDto getBusinessService(@PathVariable("id") Long id) {

		return businessServiceService.findBusinessServiceById(id);

	}
	
	@PostMapping("/businessservices")
	public BusinessServiceDto create(@RequestBody CreateBusinessServiceRequest request) {

		return businessServiceService.newBusinessService(request);
	}
	
	@PutMapping(value = "/businessservices/{id}")
	public BusinessServiceDto updateBusinessService(@RequestBody CreateBusinessServiceRequest request) {
		
		return businessServiceService.updateBusinessService(request);
	}
	
	@DeleteMapping(value = "/businessservices/{id}")
	public BusinessServiceDto deleteBusinessService(@PathVariable("id") Long id) {

		return businessServiceService.deleteBusinessService(id);
	}
 
}


