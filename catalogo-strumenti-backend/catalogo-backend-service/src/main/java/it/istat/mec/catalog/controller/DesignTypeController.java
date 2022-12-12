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
import it.istat.mec.catalog.dto.DesignTypeDto;
import it.istat.mec.catalog.request.CreateDesignTypetRequest;
import it.istat.mec.catalog.service.DesignTypeService;


@RestController
@RequestMapping("/catalog")
public class DesignTypeController {

	@Autowired
	private DesignTypeService designTypeService;
	
	@GetMapping("/open/design-types")
	public List<DesignTypeDto> getAllDesignTypes() {

		return designTypeService.findAllDesignType();
	}
	@GetMapping("/open/design-types-by-parent")
	public List<DesignTypeDto> getAllDesignTypesByParent() {

		return designTypeService.findDesignTypeByParent();
	}
	
	
	@GetMapping(value = "/open/design-types/{id}")
	public DesignTypeDto getDesignType(@PathVariable("id") Integer id) {

		return designTypeService.findDesignTypeById(id);

	}
	
	@PostMapping("/design-types")
	public DesignTypeDto create(@RequestBody CreateDesignTypetRequest request) {

		return designTypeService.newDesignType(request);
	}
	
	@PutMapping(value = "/design-types/{id}")
	public DesignTypeDto updateDesignType(@RequestBody CreateDesignTypetRequest request) {
		
		return designTypeService.updateDesignType(request);
	}
	
	@DeleteMapping(value = "/design-types/{id}")
	public DesignTypeDto deleteDesignType(@PathVariable("id") Integer id) {

		return designTypeService.deleteDesignType(id);
	}
 
}

