import { axiosCatalog } from "@/http";
import AbstractService from "@/services/abstract.service";

class ProcessStepsService extends AbstractService {
  constructor(endpoint) {
    super(endpoint);
  }
  /*
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
  */
  removeStep(idStep, idProcess) {
    return axiosCatalog
      .delete(this.endpoint + "/" + idStep + "/business-process/" + idProcess)
      .then(res => {
        var data = res.data ? res.data : [];
        return data;
      })
      .catch(err => {
        throw err;
      });
  }
}
export const processStepsService = new ProcessStepsService(
  "/catalog/process-steps"
);
export const processStepsOpenService = new ProcessStepsService(
  "/catalog/open/process-steps"
);

