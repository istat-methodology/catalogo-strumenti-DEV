package it.istat.is2.apigateway.exceptions;

import org.springframework.http.HttpStatus;

public class CustomException extends RuntimeException {
    private String message;
    private HttpStatus status;

    public CustomException(String message, HttpStatus status) {
        super(message);
        this.message = message;
        this.status = status;
    }
}
