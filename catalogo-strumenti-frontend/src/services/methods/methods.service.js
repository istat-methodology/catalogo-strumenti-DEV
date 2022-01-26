import { axiosCatalog } from "@/http";
import AbstractService from "@/services/abstract.service";

class MethodsService extends AbstractService {
  constructor(endpoint) {
    super(endpoint);
  }
  findMethods(payload) {
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
export const methodsService = new MethodsService("/catalog/statisticalmethods");
