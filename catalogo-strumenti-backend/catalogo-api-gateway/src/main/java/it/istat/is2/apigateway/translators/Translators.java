package it.istat.is2.apigateway.translators;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import it.istat.is2.apigateway.domain.UsersEntity;
import it.istat.is2.apigateway.dto.UsersDto;
 

@Component
public class Translators {
	
	public static UsersDto translate(UsersEntity x) {

		final ModelMapper modelMapper = new ModelMapper();
		final UsersDto dTO = modelMapper.map(x, UsersDto.class);
		return dTO;
	}

	public static <S, T> List<T> mapList(List<S> source, Class<T> targetClass) {
		final ModelMapper modelMapper = new ModelMapper();
	    return source
	      .stream()
	      .map(element -> modelMapper.map(element, targetClass))
	      .collect(Collectors.toList());
	}
}
