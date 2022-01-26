import { axiosCatalog } from "@/http";
import AbstractService from "@/services/abstract.service";

class ProceduresService extends AbstractService {
  constructor(endpoint) {
    super(endpoint);
  }
  findProcedures(payload) {
    return axiosCatalog
      .get(this.endpoint + "/tools/" + payload)
      .then(res => {
        var data = res.data ? res.data : [];
        //console.log(data);
        return data;
      })
      .catch(err => {
        throw err;
      });
  }
}
export const proceduresService = new ProceduresService(
  "/catalog/softwareprocedures"
);
