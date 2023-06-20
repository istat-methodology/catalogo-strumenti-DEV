import { axiosCatalog } from "@/http";
import AbstractService from "@/services/abstract.service";
class DesignTypeService extends AbstractService {
  constructor(endpoint) {
    super(endpoint);
  }
  filter(payload) {
    console.log(payload);
    var params = new URLSearchParams();
    params.append("parent", payload);
    var request = {
      params: params
    };
    return axiosCatalog
      .get(this.endpoint, request)
      .then(res => {
        var data = res.data ? res.data : {};
        return data;
      })
      .catch(function(error) {
        console.log(error);
      });
  }
}
export const designtypeService = new DesignTypeService("/catalog/design-types");
export const designtypeopenService = new DesignTypeService(
  "/catalog/open/design-types"
);
export const designtypebyparentService = new DesignTypeService(
  "/catalog/design-types-by-parent"
);
export const designtypebyparentopenService = new DesignTypeService(
  "/catalog/open/design-types-by-parent"
);
