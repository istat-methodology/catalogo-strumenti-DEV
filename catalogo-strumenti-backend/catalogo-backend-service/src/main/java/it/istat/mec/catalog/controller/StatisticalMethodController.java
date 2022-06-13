package it.istat.mec.catalog.controller;
import java.text.ParseException;
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

import it.istat.mec.catalog.dto.CatalogToolMiniListDTO;
import it.istat.mec.catalog.dto.StatisticalMethodDto;
import it.istat.mec.catalog.dto.StatisticalMethodMiniDto;
import it.istat.mec.catalog.request.CreateStatisticalMethodRequest;
import it.istat.mec.catalog.service.StatisticalMethodService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/catalog")
public class StatisticalMethodController {

	@Autowired
	private StatisticalMethodService statisticalMethodService;
	
	@GetMapping("/open/statisticalmethods")
	public List<StatisticalMethodMiniDto> getAllStatisticalMethods() {

		return statisticalMethodService.findAllStatisticalMethods();
	}
	
	@GetMapping(value = "/open/statisticalmethods/{id}")
	public StatisticalMethodDto getStatisticalMethod(@PathVariable("id") Integer id) {

		return statisticalMethodService.findStatisticalMethodById(id);

	}
	
	@GetMapping("/open/tools/statisticalmethods/{id}")
	public List<StatisticalMethodMiniDto> findBydocumentation(@PathVariable("id") Integer id) {

		return statisticalMethodService.findByDocumentation(id);
	} 
	
	
/*	
	@GetMapping("/open/statisticalmethods/tools/{id}")
	public List<StatisticalMethodDto> getByCatalogTool(@PathVariable("id") Integer id) {

		return statisticalMethodService.findByCataloTools(id);
	}
	*/
	@PostMapping("/statisticalmethods")
	public StatisticalMethodDto create(@RequestBody CreateStatisticalMethodRequest request) throws ParseException {

		return statisticalMethodService.newStatisticalMethod(request);
	}
	
	@PutMapping(value = "/statisticalmethods/{id}")
	public StatisticalMethodDto updateStatisticalMethod(@RequestBody CreateStatisticalMethodRequest request) throws ParseException {
		
		return statisticalMethodService.updateStatisticalMethod(request);
	}
	
	@PutMapping(value = "/statisticalmethods/{id}/documentation-add/{docID}")
	public StatisticalMethodDto addStatisticalMethodDocumentatione(@PathVariable("id") Integer id,@PathVariable("docID") Integer docID) throws ParseException {
		
		return statisticalMethodService.addStatisticalMethodDocumentation(id,docID);
	}
	
	@PutMapping(value = "/statisticalmethods/{id}/documentation-remove/{docID}")
	public StatisticalMethodDto removeStatisticalMethodDocumentatione(@PathVariable("id") Integer id,@PathVariable("docID") Integer docID) throws ParseException {
		
		return statisticalMethodService.removeStatisticalMethodDocumentation(id,docID);
	}
	
	
	@DeleteMapping(value = "/statisticalmethods/{id}")
	public StatisticalMethodDto deleteStatisticalMethod(@PathVariable("id") Integer id) {

		return statisticalMethodService.deleteStatisticalMethod(id);
	}
 
}


