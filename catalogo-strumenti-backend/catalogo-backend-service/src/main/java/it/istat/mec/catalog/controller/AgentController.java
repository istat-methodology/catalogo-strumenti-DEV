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

import it.istat.mec.catalog.dto.AgentDto;
import it.istat.mec.catalog.request.CreateAgentRequest;
import it.istat.mec.catalog.service.AgentService;


@RestController
@RequestMapping("/catalog")
public class AgentController {

	@Autowired
	private AgentService agentService;
	
	@GetMapping("/open/agents")
	public List<AgentDto> getAllAgents() {

		return agentService.findAllAgents();
	}
	
	@GetMapping(value = "/open/agents/{id}")
	public AgentDto getAgent(@PathVariable("id") Integer id) {

		return agentService.findAgentById(id);

	}
	
	@PostMapping("/agents")
	public AgentDto create(@RequestBody CreateAgentRequest request) {

		return agentService.newAgent(request);
	}
	
	@PutMapping(value = "/agents/{id}")
	public AgentDto updateAgent(@RequestBody CreateAgentRequest request) {
		
		return agentService.updateAgent(request);
	}
	
	@DeleteMapping(value = "/agents/{id}")
	public AgentDto deleteAgent(@PathVariable("id") Integer id) {

		return agentService.deleteAgent(id);
	}
 
}

