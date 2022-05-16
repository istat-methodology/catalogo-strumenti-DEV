import { axiosCatalog } from "@/http";
import AbstractService from "@/services/abstract.service";

class ProcessStepService extends AbstractService {
  constructor(endpoint) {
    super(endpoint);
  }
  save(payload) {
    //console.log(config);
    console.log(payload);
    return axiosCatalog
      .post(this.endpoint, payload)
      .then(res => {
        var data = res.data ? res.data : {};
        console.log(data);
        return data;
      })
      .catch(err => {
        throw err;
      });
  }
}

export const processStepService = new ProcessStepService(
  "/catalog/process-steps"
);
export const processStepOpenService = new ProcessStepService(
  "/catalog/open/process-steps"
);
