import { axiosCatalog } from "@/http";
import AbstractService from "@/services/abstract.service";

class ProcessSpecificationService extends AbstractService {
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
export const processSpecificationService = new ProcessSpecificationService(
  "/catalog/process-specifications"
);
export const processSpecificationOpenService = new ProcessSpecificationService(
  "/catalog/open/process-specifications"
);