import { axiosRegedit } from "@/http";
import AbstractService from "@/services/abstract.service";

class ServicesService extends AbstractService {
  constructor(endpoint) {
    super(endpoint);
  }
  findServices(payload) {
    return axiosRegedit
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
export const servicesService = new ServicesService(
  "/catalog/statisticalservices"
);
