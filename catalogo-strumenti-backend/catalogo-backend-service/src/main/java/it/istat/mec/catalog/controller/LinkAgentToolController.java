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

import it.istat.mec.catalog.dto.LinkAgentToolDto;
import it.istat.mec.catalog.request.CreateLinkAgentToolRequest;
import it.istat.mec.catalog.service.LinkAgentToolService;
@RestController
@RequestMapping("/catalog")
public class LinkAgentToolController {

	@Autowired
	private LinkAgentToolService linkAgentToolService;
	
	@GetMapping("/open/linkagenttools")
	public List<LinkAgentToolDto> getAllLinkAgentTools() {

		return linkAgentToolService.findAllLinkAgentTools();
	}
	
	@GetMapping(value = "/open/linkagenttools/{id}")
	public LinkAgentToolDto getLinkAgentTool(@PathVariable("id") Integer id) {

		return linkAgentToolService.findLinkAgentToolById(id);

	}
	
	@PostMapping("/linkagenttools")
	public LinkAgentToolDto create(@RequestBody CreateLinkAgentToolRequest request) {

		return linkAgentToolService.newLinkAgentTool(request);
	}
	
	@PutMapping(value = "/linkagenttools/{id}")
	public LinkAgentToolDto updateLinkAgentTool(@RequestBody CreateLinkAgentToolRequest request) {
		
		return linkAgentToolService.updateLinkAgentTool(request);
	}
	
	@DeleteMapping(value = "/linkagenttools/{id}")
	public LinkAgentToolDto deleteLinkAgentTool(@PathVariable("id") Integer id) {

		return linkAgentToolService.deleteLinkAgentTool(id);
	}
 
}


