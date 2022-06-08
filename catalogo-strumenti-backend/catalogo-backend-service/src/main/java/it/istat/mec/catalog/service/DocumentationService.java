package it.istat.mec.catalog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.istat.mec.catalog.dao.DocumentationDao;
import it.istat.mec.catalog.dao.DocumentationTypeDao;
import it.istat.mec.catalog.dao.StatisticalMethodDao;
import it.istat.mec.catalog.dao.ToolDao;
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
	@Autowired
	StatisticalMethodDao statisticalMethodDao;
	@Autowired
	DocumentationTypeDao documentationTypeDao;

	public List<DocumentationDto> findAllDocumentations() {

		return Translators.translateDoc(documentationDao.findAll());

	}

	public DocumentationDto newDocumentation(CreateDocumentationRequest request) {
		Documentation doc = new Documentation();
		doc = Translators.translate(request);

		

		if (request.getDocumentType() != null)

		{

			if (!documentationTypeDao.findById(request.getDocumentType()).isPresent())
				throw new NoDataException("Documetation type not present");
			doc.setDocumentType(documentationTypeDao.findById(request.getDocumentType()).get());
		}
		
		if (request.getTool() != null && toolDao.findById(request.getTool()).isPresent())
			doc.getCatalogTools().add(toolDao.findById(request.getTool()).get());
		if (request.getMethod() != null && statisticalMethodDao.findById(request.getMethod()).isPresent())
			doc.getStatisticalMethods().add(statisticalMethodDao.findById(request.getMethod()).get());
		
		doc=documentationDao.save(doc);
		return Translators.translate(doc);
	}

	public DocumentationDto findDocumentationById(Integer id) {

		if (!documentationDao.findById(id).isPresent())
			throw new NoDataException("Documentation not present");
		return Translators.translate(documentationDao.findById(id).get());
	}

	public DocumentationDto updateDocumentation(CreateDocumentationRequest request) {

		if (!documentationDao.findById(request.getId()).isPresent())
			throw new NoDataException("Documentation not present");

		Documentation doc = documentationDao.findById(request.getId()).get();

		doc = Translators.translateUpdate(request, doc);
		if (request.getTool() != null ) {

			if (!toolDao.findById(request.getTool()).isPresent())
				throw new NoDataException("Statistical Tool not present");
			doc.getCatalogTools().add(toolDao.findById(request.getTool()).get());
		}

		if (request.getDocumentType() != null && (doc.getDocumentType() == null
				|| !request.getDocumentType().equals(doc.getDocumentType().getId()))) {

			if (!documentationTypeDao.findById(request.getDocumentType()).isPresent())
				throw new NoDataException("Documetation type not present");
			doc.setDocumentType(documentationTypeDao.findById(request.getDocumentType()).get());
		}

		documentationDao.save(doc);

		return Translators.translate(doc);
	}

	public DocumentationDto deleteDocumentation(Integer id) {
		if (!documentationDao.findById(id).isPresent())
			throw new NoDataException("Documentation not present");
		Documentation doc = documentationDao.findById(id).get();
		documentationDao.delete(doc);
		return Translators.translate(doc);
	}
}
