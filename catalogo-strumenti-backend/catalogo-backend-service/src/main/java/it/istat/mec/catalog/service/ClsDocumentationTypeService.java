package it.istat.mec.catalog.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.istat.mec.catalog.dao.ClsDocumentationTypeDao;
import it.istat.mec.catalog.dto.DocumentationTypeDto;
import it.istat.mec.catalog.translators.Translators;

@Service
public class ClsDocumentationTypeService {

	@Autowired
	ClsDocumentationTypeDao dao;

	public List<DocumentationTypeDto> findAll() {
		
		return Translators.translateDocumentationTypeList(dao.findAll());

	}
	}

