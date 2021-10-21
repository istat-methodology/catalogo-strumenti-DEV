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
import it.istat.mec.catalog.dto.SoftwareProcedureDto;
import it.istat.mec.catalog.request.CreateSoftwareProcedureRequest;
import it.istat.mec.catalog.service.SoftwareProcedureService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/catalog")
public class SoftwareProcedureController {

	@Autowired
	private SoftwareProcedureService softwareProcedureService;
	
	@GetMapping("/softwareprocedures")
	public List<SoftwareProcedureDto> getAllSoftwareProcedures() {

		return softwareProcedureService.findAllSoftwareProcedures();
	}

	@GetMapping(value = "/softwareprocedures/{id}")
	public SoftwareProcedureDto getSoftwareProcedure(@PathVariable("id") Long id) {

		return softwareProcedureService.findSoftwareProcedureById(id);

	}
	
	@GetMapping("/softwareprocedures/tools/{id}")
	public List<SoftwareProcedureDto> getByCatalogTool(@PathVariable("id") Long id) {

		return softwareProcedureService.findByCataloTool(id);
	}
	
	@PostMapping("/softwareprocedures")
	public SoftwareProcedureDto create(@RequestBody CreateSoftwareProcedureRequest request) {

		return softwareProcedureService.newSoftwareProcedure(request);
	}
	
	@PutMapping(value = "/softwareprocedures/{id}")
	public SoftwareProcedureDto updateSoftwareProcedure(@RequestBody CreateSoftwareProcedureRequest request) {
		
		return softwareProcedureService.updateSoftwareProcedure(request);
	}
	
	@DeleteMapping(value = "/softwareprocedures/{id}")
	public SoftwareProcedureDto deleteSoftwareProcedure(@PathVariable("id") Long id) {

		return softwareProcedureService.deleteSoftwareProcedure(id);
	}
 
}


