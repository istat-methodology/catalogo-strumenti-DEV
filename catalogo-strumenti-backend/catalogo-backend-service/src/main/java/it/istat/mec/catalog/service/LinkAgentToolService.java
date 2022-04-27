package it.istat.mec.catalog.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.LinkAgentToolDao;
import it.istat.mec.catalog.domain.LinkAgentTool;
import it.istat.mec.catalog.dto.LinkAgentToolDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateLinkAgentToolRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class LinkAgentToolService {

	@Autowired
	LinkAgentToolDao linkAgentToolDao;

	public List<LinkAgentToolDto> findAllLinkAgentTools() {
		
		return Translators.translateLinkAgentToolList(linkAgentToolDao.findAll());

	}
	
	public LinkAgentToolDto newLinkAgentTool(CreateLinkAgentToolRequest request) {
		LinkAgentTool toolAgent = new LinkAgentTool();
		toolAgent = Translators.translate(request);		
		linkAgentToolDao.save(toolAgent);
		return Translators.translate(toolAgent);
	}
	
	public LinkAgentToolDto findLinkAgentToolById(Integer id) {

		if (!linkAgentToolDao.findById(id).isPresent())
			throw new NoDataException("LinkAgentTool not present");
		return Translators.translate(linkAgentToolDao.findById(id).get());
	}
	
	public LinkAgentToolDto updateLinkAgentTool(CreateLinkAgentToolRequest request) {		
		
		if (!linkAgentToolDao.findById(request.getId()).isPresent())
			throw new NoDataException("LinkAgentTool not present");
		
		LinkAgentTool toolAgent = linkAgentToolDao.findById(request.getId()).get();	
		
		toolAgent = Translators.translateUpdate(request, toolAgent);
		
		linkAgentToolDao.save(toolAgent);		
		
		return Translators.translate(toolAgent);
	}
	public LinkAgentToolDto deleteLinkAgentTool(Integer id) {		
		if (!linkAgentToolDao.findById(id).isPresent())
			throw new NoDataException("LinkAgentTool not present");
			LinkAgentTool toolAgent = linkAgentToolDao.findById(id).get();
			linkAgentToolDao.delete(toolAgent);
			return Translators.translate(toolAgent);		
	}
}