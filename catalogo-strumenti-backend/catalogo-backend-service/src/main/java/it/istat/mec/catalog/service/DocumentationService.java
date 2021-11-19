package it.istat.mec.catalog.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.DocumentationDao;
import it.istat.mec.catalog.dao.ToolDao;
import it.istat.mec.catalog.domain.CatalogTool;
import it.istat.mec.catalog.domain.Documentation;
import it.istat.mec.catalog.dto.DocumentationDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateDocumentationRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class DocumentationService {

	@Autowired
	DocumentationDao documentationDao;
	@Autowired
	ToolDao toolDao;

	public List<DocumentationDto> findAllDocumentations() {
		
		return Translators.translateDoc(documentationDao.findAll());

	}
	
	public DocumentationDto newDocumentation(CreateDocumentationRequest request) {
		Documentation doc = new Documentation();
		doc = Translators.translate(request);	
		CatalogTool tool = toolDao.getOne(request.getToolId());
		doc.setCatalogTool(tool);
		documentationDao.save(doc);
		return Translators.translate(doc);
	}
	
	public DocumentationDto findDocumentationById(Long id) {

		if (!documentationDao.findById(id).isPresent())
			throw new NoDataException("Documentation not present");
		return Translators.translate(documentationDao.findById(id).get());
	}
	
	public DocumentationDto updateDocumentation(CreateDocumentationRequest request) {		
		
		if (!documentationDao.findById(request.getId()).isPresent())
			throw new NoDataException("Documentation not present");
		
		Documentation doc = documentationDao.findById(request.getId()).get();	
		
		doc = Translators.translateUpdate(request, doc);
		if(!doc.getCatalogTool().getId().equals( request.getToolId())){
			if (!toolDao.findById(request.getToolId()).isPresent())
				throw new NoDataException("Statistical Tool not present");
			doc.setCatalogTool(toolDao.findById(request.getToolId()).get());
		}
		
		documentationDao.save(doc);		
		
		return Translators.translate(doc);
	}
	public DocumentationDto deleteDocumentation(Long id) {		
		if (!documentationDao.findById(id).isPresent())
			throw new NoDataException("Documentation not present");
			Documentation doc = documentationDao.findById(id).get();
			documentationDao.delete(doc);
			return Translators.translate(doc);		
	}
}

