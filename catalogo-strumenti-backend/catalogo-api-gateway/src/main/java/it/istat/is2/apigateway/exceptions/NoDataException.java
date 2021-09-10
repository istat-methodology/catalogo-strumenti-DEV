package it.istat.is2.apigateway.exceptions;

public class NoDataException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;
	public NoDataException(String message) {
        super(message);
    }
    public NoDataException() {
        super("No data found"); 
    }
}
