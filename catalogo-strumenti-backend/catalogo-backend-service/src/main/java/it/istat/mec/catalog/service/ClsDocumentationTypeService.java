package it.istat.mec.catalog.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.istat.mec.catalog.dao.DocumentationTypeDao;
import it.istat.mec.catalog.dto.DocumentationTypeDto;
import it.istat.mec.catalog.translators.Translators;

@Service
public class ClsDocumentationTypeService {

	@Autowired
	DocumentationTypeDao dao;

	public List<DocumentationTypeDto> findAll() {
		
		return Translators.translateDocumentationTypeList(dao.findAll());

	}
	}

