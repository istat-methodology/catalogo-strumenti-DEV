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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import it.istat.mec.catalog.dto.BusinessFunctionDto;
import it.istat.mec.catalog.request.CreateBusinessFunctionRequest;
import it.istat.mec.catalog.service.BusinessFunctionService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/catalog")
public class BusinessFunctionController {

	@Autowired
	private BusinessFunctionService businessFunctionService;
	
//	@GetMapping("/open/businessfunctions")
//	public List<BusinessFunctionDto> getAllBusinessFunctions() {
//
//		return businessFunctionService.findAllBusinessFunctions();
//	}
	@GetMapping("/open/businessfunctions")
	public List<BusinessFunctionDto> getAllBusinessFunctions(
			@RequestParam(value = "gsbpmIds", required = false) Integer[] gsbpmIds,
			@RequestParam(value = "orderBy", required = false, defaultValue = "id,name") String[] orderBy,
			@RequestParam(value = "sort", required = false, defaultValue = "ASC,ASC") String[] sort) {

		return businessFunctionService.findAllFunctionsByGsbpms(gsbpmIds,orderBy,sort);
	}
	
	@GetMapping(value = "/open/businessfunctions/{id}")
	public BusinessFunctionDto getBusinessFunction(@PathVariable("id") Integer id) {

		return businessFunctionService.findBusinessFunctionById(id);

	}
	
	@PostMapping("/businessfunctions")
	public BusinessFunctionDto create(@RequestBody CreateBusinessFunctionRequest request) {

		return businessFunctionService.newBusinessFunction(request);
	}
	
	@PutMapping(value = "/businessfunctions/{id}")
	public BusinessFunctionDto updateBusinessFunction(@RequestBody CreateBusinessFunctionRequest request) {
		
		return businessFunctionService.updateBusinessFunction(request);
	}
	
	@DeleteMapping(value = "/businessfunctions/{id}")
	public BusinessFunctionDto deleteBusinessFunction(@PathVariable("id") Integer id) {

		return businessFunctionService.deleteBusinessFunction(id);
	}
 
}
