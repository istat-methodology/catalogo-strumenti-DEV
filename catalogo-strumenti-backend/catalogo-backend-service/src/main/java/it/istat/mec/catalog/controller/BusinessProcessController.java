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
import it.istat.mec.catalog.dto.BusinessProcessDto;
import it.istat.mec.catalog.request.CreateBusinessProcessRequest;
import it.istat.mec.catalog.service.BusinessProcessService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/catalog")
public class BusinessProcessController {

	@Autowired
	private BusinessProcessService businessProcessService;
	
	@GetMapping("/open/businessprocesses")
	public List<BusinessProcessDto> getAllBusinessProcesses() {

		return businessProcessService.findAllBusinessProcesses();
	}
	
	@GetMapping(value = "/open/businessprocesses/{id}")
	public BusinessProcessDto getBusinessProcess(@PathVariable("id") Long id) {

		return businessProcessService.findBusinessProcessById(id);

	}
	
	@PostMapping("/businessprocesses")
	public BusinessProcessDto create(@RequestBody CreateBusinessProcessRequest request) {

		return businessProcessService.newBusinessProcess(request);
	}
	
	@PutMapping(value = "/businessprocesses/{id}")
	public BusinessProcessDto updateBusinessProcess(@RequestBody CreateBusinessProcessRequest request) {
		
		return businessProcessService.updateBusinessProcess(request);
	}
	
	@DeleteMapping(value = "/businessprocesses/{id}")
	public BusinessProcessDto deleteBusinessProcess(@PathVariable("id") Long id) {

		return businessProcessService.deleteBusinessProcess(id);
	}
 
}


