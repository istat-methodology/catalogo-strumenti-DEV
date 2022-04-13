package it.istat.mec.catalog.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.AgentDao;
import it.istat.mec.catalog.domain.Agent;
import it.istat.mec.catalog.dto.AgentDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateAgentRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class AgentService {

	@Autowired
	AgentDao agentDao;

	public List<AgentDto> findAllAgents() {
		
		return Translators.translateAgentList(agentDao.findAll());

	}
	
	public AgentDto newAgent(CreateAgentRequest request) {
		Agent agent = new Agent();
		agent = Translators.translate(request);		
		agentDao.save(agent);
		return Translators.translate(agent);
	}
	
	public AgentDto findAgentById(Integer id) {

		if (!agentDao.findById(id).isPresent())
			throw new NoDataException("Agent not present");
		return Translators.translate(agentDao.findById(id).get());
	}
	
	public AgentDto updateAgent(CreateAgentRequest request) {		
		
		if (!agentDao.findById(request.getId()).isPresent())
			throw new NoDataException("Agent not present");
		
		Agent agent = agentDao.findById(request.getId()).get();	
		
		agent = Translators.translateUpdate(request, agent);
		
		agentDao.save(agent);		
		
		return Translators.translate(agent);
	}
	public AgentDto deleteAgent(Integer id) {		
		if (!agentDao.findById(id).isPresent())
			throw new NoDataException("Agent not present");
			Agent agent = agentDao.findById(id).get();
			agentDao.delete(agent);
			return Translators.translate(agent);		
	}
}

