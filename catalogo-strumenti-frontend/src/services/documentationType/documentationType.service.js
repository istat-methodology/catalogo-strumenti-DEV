import { axiosCatalog } from "@/http";
import AbstractService from "@/services/abstract.service";

class DocumentationTypeService extends AbstractService {
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
export const documentationTypeService = new DocumentationTypeService(
  "/catalog/documentation-types"
);
export const documentationTypeOpenService = new DocumentationTypeService(
  "/catalog/open/documentation-types"
);
