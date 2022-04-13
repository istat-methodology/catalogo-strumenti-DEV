package it.istat.mec.catalog.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import it.istat.mec.catalog.dto.DocumentationTypeDto;
import it.istat.mec.catalog.service.ClsDocumentationTypeService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/catalog")
public class ClsDocumentationTypeController {

	@Autowired
	private ClsDocumentationTypeService service;
	
	@GetMapping("/open/documentation-types")
	public List<DocumentationTypeDto> getAll() {

		 return service.findAll();
	}
	 
}

