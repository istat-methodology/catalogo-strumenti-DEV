package it.istat.is2.apigateway.service;

public interface AuthService {
    String login(String username, String password);
    boolean logout(String token);
    Boolean isValidToken(String token);
    String createNewToken(String token);
}
