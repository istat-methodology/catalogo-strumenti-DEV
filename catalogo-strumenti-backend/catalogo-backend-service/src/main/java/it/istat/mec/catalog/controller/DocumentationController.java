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
import it.istat.mec.catalog.dto.DocumentationDto;
import it.istat.mec.catalog.request.CreateDocumentationRequest;
import it.istat.mec.catalog.service.DocumentationService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/catalog")
public class DocumentationController {

	@Autowired
	private DocumentationService documentationService;
	
	@GetMapping("/documentations")
	public List<DocumentationDto> getAllDocumentations() {

		return documentationService.findAllDocumentations();
	}
	
	@GetMapping(value = "/documentations/{id}")
	public DocumentationDto getAgent(@PathVariable("id") Long id) {

		return documentationService.findDocumentationById(id);

	}
	
	@PostMapping("/documentations")
	public DocumentationDto create(@RequestBody CreateDocumentationRequest request) {

		return documentationService.newDocumentation(request);
	}
	
	@PutMapping(value = "/documentations/{id}")
	public DocumentationDto updateAgent(@RequestBody CreateDocumentationRequest request) {
		
		return documentationService.updateDocumentation(request);
	}
	
	@DeleteMapping(value = "/documentations/{id}")
	public DocumentationDto deleteAgent(@PathVariable("id") Long id) {

		return documentationService.deleteDocumentation(id);
	}
 
}


