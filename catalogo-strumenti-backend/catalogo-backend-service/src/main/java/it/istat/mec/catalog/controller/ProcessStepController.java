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
import it.istat.mec.catalog.dto.ProcessStepDto;
import it.istat.mec.catalog.request.CreateProcessStepRequest;
import it.istat.mec.catalog.service.ProcessStepService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/catalog")
public class ProcessStepController {

	@Autowired
	private ProcessStepService processStepService;
	
	@GetMapping("/open/processsteps")
	public List<ProcessStepDto> getAllProcessSteps() {

		return processStepService.findAllProcessSteps();
	}
	
	@GetMapping(value = "/open/processsteps/{id}")
	public ProcessStepDto getProcessStep(@PathVariable("id") Long id) {

		return processStepService.findProcessStepById(id);

	}
	
	@PostMapping("/processsteps")
	public ProcessStepDto create(@RequestBody CreateProcessStepRequest request) {

		return processStepService.newProcessStep(request);
	}
	
	@PutMapping(value = "/processsteps/{id}")
	public ProcessStepDto updateProcessStep(@RequestBody CreateProcessStepRequest request) {
		
		return processStepService.updateProcessStep(request);
	}
	
	@DeleteMapping(value = "/processsteps/{id}")
	public ProcessStepDto deleteProcessStep(@PathVariable("id") Long id) {

		return processStepService.deleteProcessStep(id);
	}
 
}

