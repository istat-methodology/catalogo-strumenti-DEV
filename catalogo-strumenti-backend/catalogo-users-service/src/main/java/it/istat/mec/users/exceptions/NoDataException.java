package it.istat.mec.users.exceptions;

public class NoDataException extends RuntimeException {
    
	
	private static final long serialVersionUID = 2687477693444569386L;
	public NoDataException(String message) {
        super(message);
    }
    public NoDataException() {
        super("No data found");
    }
}
