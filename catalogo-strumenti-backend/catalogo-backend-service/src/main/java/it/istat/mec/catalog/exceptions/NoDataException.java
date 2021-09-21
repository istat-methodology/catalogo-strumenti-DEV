package it.istat.mec.catalog.exceptions;

public class NoDataException extends RuntimeException {
    

	private static final long serialVersionUID = -554412700324228721L;
	public NoDataException(String message) {
        super(message);
    }
    public NoDataException() {
        super("No data found");
    }
}
