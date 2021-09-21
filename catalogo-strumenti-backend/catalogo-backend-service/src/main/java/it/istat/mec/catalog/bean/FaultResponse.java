package it.istat.mec.catalog.bean;

import java.util.Date;

import lombok.Data;
import lombok.NonNull;
@Data
public class FaultResponse {
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
