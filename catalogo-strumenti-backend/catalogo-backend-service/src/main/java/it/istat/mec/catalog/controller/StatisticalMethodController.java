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
import it.istat.mec.catalog.dto.StatisticalMethodDto;
import it.istat.mec.catalog.request.CreateStatisticalMethodRequest;
import it.istat.mec.catalog.service.StatisticalMethodService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/catalog")
public class StatisticalMethodController {

	@Autowired
	private StatisticalMethodService statisticalMethodService;
	
	@GetMapping("/statisticalmethods")
	public List<StatisticalMethodDto> getAllStatisticalMethods() {

		return statisticalMethodService.findAllStatisticalMethods();
	}
	
	@GetMapping(value = "/statisticalmethods/{id}")
	public StatisticalMethodDto getStatisticalMethod(@PathVariable("id") Long id) {

		return statisticalMethodService.findStatisticalMethodById(id);

	}
	
	@GetMapping("/statisticalmethods/tools/{id}")
	public List<StatisticalMethodDto> getByCatalogTool(@PathVariable("id") Long id) {

		return statisticalMethodService.findByCataloTool(id);
	}
	
	@PostMapping("/statisticalmethods")
	public StatisticalMethodDto create(@RequestBody CreateStatisticalMethodRequest request) {

		return statisticalMethodService.newStatisticalMethod(request);
	}
	
	@PutMapping(value = "/statisticalmethods/{id}")
	public StatisticalMethodDto updateStatisticalMethod(@RequestBody CreateStatisticalMethodRequest request) {
		
		return statisticalMethodService.updateStatisticalMethod(request);
	}
	
	@DeleteMapping(value = "/statisticalmethods/{id}")
	public StatisticalMethodDto deleteStatisticalMethod(@PathVariable("id") Long id) {

		return statisticalMethodService.deleteStatisticalMethod(id);
	}
 
}

