package it.istat.mec.catalog.translators;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import it.istat.mec.catalog.domain.CatalogTool;
import it.istat.mec.catalog.dto.ToolDto;


@Component
public class Translators {
	public static ToolDto translate(CatalogTool x) {

		final ModelMapper modelMapper = new ModelMapper();
		final ToolDto dTO = modelMapper.map(x, ToolDto.class);
		return dTO;
	}

	public static List<ToolDto> translate(List<CatalogTool> list) {
		return mapList(list, ToolDto.class);
	}
	
	public static <S, T> List<T> mapList(List<S> source, Class<T> targetClass) {
		final ModelMapper modelMapper = new ModelMapper();
		return source.stream().map(element -> modelMapper.map(element, targetClass)).collect(Collectors.toList());
	}

}
