package it.istat.is2.apigateway.exceptions;

import lombok.Data;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import java.util.Date;

@ControllerAdvice
@Slf4j
public class CustomExceptionHandler extends ResponseEntityExceptionHandler {

    private final MessageSource messageSource;

    @Autowired
    public CustomExceptionHandler(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @ExceptionHandler(CustomException.class)
    public ResponseEntity<FaultResponse> notFoundException(CustomException ex) {
        FaultResponse response = new FaultResponse(HttpStatus.UNAUTHORIZED.toString(), ex.getMessage());
        return new ResponseEntity<>(response, HttpStatus.UNAUTHORIZED);
    }


    @Data
    public static class FaultResponse {
        @NonNull
        private String errorCode;
        @NonNull
        private String errorMessage;
        private Date timestamp;

        public FaultResponse(String errorCode, String errorMessage) {
            super();
            this.errorCode = errorCode;
            this.errorMessage = errorMessage;
            this.timestamp = new Date();
        }
    }
}
