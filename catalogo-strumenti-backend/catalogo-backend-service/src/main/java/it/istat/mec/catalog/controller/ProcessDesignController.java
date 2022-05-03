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
import it.istat.mec.catalog.dto.ProcessDesignDto;
import it.istat.mec.catalog.request.CreateProcessDesignRequest;
import it.istat.mec.catalog.service.ProcessDesignService;


@RestController
@RequestMapping("/catalog")
public class ProcessDesignController {

	@Autowired
	private ProcessDesignService processDesignService;
	
	@GetMapping("/open/process-designes")
	public List<ProcessDesignDto> getAllPrcessDesignes() {

		return processDesignService.findAllPrcessDesignes();
	}
	
	@GetMapping("/open/process-designes/process-step/{id_step}")
	public List<ProcessDesignDto> geProcessDesignesByProcessStep(@PathVariable("id_step") Integer id_step) {

		return processDesignService.findProcessDesignesByStep(id_step);
	}	
	
	
	@PostMapping("/process-designes")
	public ProcessDesignDto create(@RequestBody CreateProcessDesignRequest request) {

		return processDesignService.newProcessDesign(request);
	}
	
	@PutMapping(value = "/process-designes/{id}")
	public ProcessDesignDto updateProcessDesign(@RequestBody CreateProcessDesignRequest request) {
		
		return processDesignService.updateProcessDesign(request);
	}
	
	@DeleteMapping(value = "/process-designes/{id}")
	public ProcessDesignDto deleteProcessDesign(@PathVariable("id") Integer id) {

		return processDesignService.deleteProcessDesign(id);
	}
 
}


