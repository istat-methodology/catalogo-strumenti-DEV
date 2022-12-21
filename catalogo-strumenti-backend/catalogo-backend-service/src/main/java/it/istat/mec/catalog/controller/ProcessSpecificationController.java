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
import it.istat.mec.catalog.dto.ProcessSpecificationDto;
import it.istat.mec.catalog.request.CreateProcessSpecificationRequest;
import it.istat.mec.catalog.service.ProcessSpecificationService;


@RestController
@RequestMapping("/catalog")
public class ProcessSpecificationController {

	@Autowired
	private ProcessSpecificationService processSpecificationService;
	
	@GetMapping("/open/process-specifications")
	public List<ProcessSpecificationDto> getAllProcessSpecification() {

		return processSpecificationService.findAllProcessSpecification();
	}
	
	@GetMapping("/open/process-specifications/process-design/{idDesign}")
	public List<ProcessSpecificationDto> geProcessSpecificationByDesign(@PathVariable("idDesign") Integer idDesign) {

		return processSpecificationService.findProcessSpecificationByDesign(idDesign);
	}	
	
	
	@PostMapping("/process-specifications")
	public ProcessSpecificationDto create(@RequestBody CreateProcessSpecificationRequest request) {

		return processSpecificationService.newProcessSpecification(request);
	}
	
	@PutMapping(value = "/process-specifications/{id}")
	public ProcessSpecificationDto updateProcessSpecification(@RequestBody CreateProcessSpecificationRequest request) {
		
		return processSpecificationService.updateProcessSpecification(request);
	}
	
	@DeleteMapping(value = "/process-specifications/{id}")
	public ProcessSpecificationDto deleteProcessSpecification(@PathVariable("id") Integer id) {

		return processSpecificationService.deleteProcessSpecification(id);
	}
 
}


