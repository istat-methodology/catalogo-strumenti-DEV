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
import it.istat.mec.catalog.dto.InformationObjectDto;
import it.istat.mec.catalog.request.CreateInformationObjectRequest;
import it.istat.mec.catalog.service.InformationObjectService;


@RestController
@RequestMapping("/catalog")
public class InformationObjectController {

	@Autowired
	private InformationObjectService informationObjectService;
	
	@GetMapping("/open/information-objects")
	public List<InformationObjectDto> getAllInformationObjects() {

		return informationObjectService.findAllInformationObjects();
	}	
	
	@GetMapping(value = "/open/information-objects/{id}")
	public InformationObjectDto getInformationObject(@PathVariable("id") Integer id) {

		return informationObjectService.findInformationObjectById(id);

	}
	
	@PostMapping("/information-objects")
	public InformationObjectDto create(@RequestBody CreateInformationObjectRequest request) {

		return informationObjectService.newInformationObject(request);
	}
	
	@PutMapping(value = "/information-objects/{id}")
	public InformationObjectDto updateInformationObject(@RequestBody CreateInformationObjectRequest request) {
		
		return informationObjectService.updateInformationObject(request);
	}
	
	@DeleteMapping(value = "/information-objects/{id}")
	public InformationObjectDto deleteInformationObject(@PathVariable("id") Integer id) {

		return informationObjectService.deleteInformationObject(id);
	}
 
}


